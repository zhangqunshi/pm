<%--
    Description:Update the permission scheme.
    Author:Sun Chongyang
 --%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
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
		String idStr = request.getParameter("schemeId");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		int schemeId = 0;
		if (StringUtils.isNotBlank(idStr)) {
			schemeId = Integer.parseInt(idStr);
		}
		if (StringUtils.isBlank(name)) {
			String error = "模板名称不能为空！";
			request.setAttribute("error", error);
	%>
	<jsp:forward page="updatePermissionScheme.jsp">
		<jsp:param name="schemeId" value="<%=schemeId%>" />
	</jsp:forward>
	<%
		}
		PermissionSchemeBO schemeBO = new PermissionSchemeBO();
		if (schemeBO.exist(name) && schemeBO.getId(name) != schemeId) {
			String error = "该模板名已存在，请重新命名！";
			request.setAttribute("error", error);
	%>
	<jsp:forward page="updatePermissionScheme.jsp">
		<jsp:param name="schemeId" value="<%=schemeId%>" />
	</jsp:forward>
	<%
		} else {
			PermissionScheme scheme = schemeBO.getScheme(schemeId);
			scheme.setDescription(description);
			scheme.setName(name);
			schemeBO.updatePermissionScheme(scheme);
			response.sendRedirect("viewPermissionSchemes.jsp");
		}
	%>
</body>
</html>
