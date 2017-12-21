<%-- 
	描述：修改项目类型
	作者: 张磊
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<html>
<body>
    <%
        ProjectBO pb = new ProjectBO();
        ProjectCategoryBO pcBO = new ProjectCategoryBO();
        String str = request.getParameter("projectId");
        int id = Integer.parseInt(str);
        String category = request.getParameter("categoryId");
        int categoryId = Integer.parseInt(category);
        Projecthbm project = pb.getProject(id);
        project.setCategory(pcBO.getProjectCategory(categoryId));
        pb.updateProject1(project);
    %>
    <jsp:forward page="viewProjectDetail.jsp"></jsp:forward>
</body>
</html>
