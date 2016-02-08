<%-- 
	描述： 新建项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%
	ProjectUserBO pub = new ProjectUserBO();
	int projectId = Integer.parseInt(request.getParameter("projectId"));
	int userId = Integer.parseInt(request.getParameter("userId"));
	int roleId = Integer.parseInt(request.getParameter("roleId"));
	int projectUserId = Integer.parseInt(request
			.getParameter("projectUserId"));

	ProjectUser projectUser = new ProjectUser();

	projectUser.setProjectUserId(projectUserId);
	projectUser.setUserId(userId);
	projectUser.setRoleId(roleId);
	projectUser.setProjectId(projectId);

	pub.updateProjectUser(projectUser);
%>
<jsp:forward page="viewProjectUser.jsp"></jsp:forward>