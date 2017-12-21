<%-- 
	描述：修改项目相关操作
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.ProjectBO"%>
<%@ page import="com.nastation.pm.bean.Project"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<html>
<body>
    <%
        ProjectBO pb = new ProjectBO();
        String str = request.getParameter("projectId");
        int projectId = Integer.parseInt(str);
        String name = request.getParameter("name");
        String url = request.getParameter("url");
        String description = request.getParameter("description");
        String leaderId = request.getParameter("lead");

        //检查参数
        boolean hasError = false;
        String errMsg = "";
        if (StringUtils.isBlank(name)) {
            hasError = true;
            errMsg += "项目名不能为空，请重新填写！";
        }
        Projecthbm p = pb.getProject(projectId);
        p.setName(name);
        p.setUrl(url);
        p.setDescription(description);
        p.setLeader(leaderId);
        Project project = new Project();
        project.setName(p.getName());
        boolean exist = pb.existName(project);
        if (exist) {
            hasError = true;
            errMsg += "项目名已存在！请重新命名。";
        }
        if (hasError) {
            request.setAttribute("error", errMsg);
    %>
    <jsp:forward page="updateProject.jsp">
        <jsp:param name="projectId" value="<%=projectId%>" />
    </jsp:forward>
    <%
        }

        pb.updateProject(p);
    %>
    <jsp:forward page="viewProjectDetail.jsp"></jsp:forward>
</body>
</html>
