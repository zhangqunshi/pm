<%--
    Description:Delete a permission scheme.
    Author:Sun Chongyang  
 --%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

</head>

<body>
	<%
		String idStr = request.getParameter("id");
		String schemeId = request.getParameter("schemeId");
		int id = Integer.parseInt(idStr);
		PermissionAssigneeBO assigneeBO = new PermissionAssigneeBO();
		assigneeBO.deletePermission(id);
		response.sendRedirect("editPermissions.jsp?schemeId=" + schemeId);
	%>
</body>
</html>
