<%-- 
	描述：修改项目相关操作
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.ProjectBO"%>
<%@ page import="com.nastation.pm.bean.Project"%>
<%@ page import="com.nastation.pm.util.*"%>

<html>
<body>
	<%
		ProjectBO pb = new ProjectBO();
		String str = request.getParameter("projectId");
		System.out.println(str);
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
		Project project = pb.getProject(projectId);
		project.setProjectId(projectId);
		project.setName(name);
		project.setUrl(url);
		project.setDescription(description);
		project.setLeader(leaderId);
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

		pb.updateProject(project);
	%>
	<jsp:forward page="viewProjectDetail.jsp"></jsp:forward>
</body>
</html>
