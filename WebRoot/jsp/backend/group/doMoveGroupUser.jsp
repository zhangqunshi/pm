<%-- 
	描述： 删除用户组里组对应的用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
<head>
</head>
<body>
	<%
		String groupUserStr = request.getParameter("groupUserId");
		String groupName = request.getParameter("groupName");

		String errMsg = "";
		if (StringUtils.isBlank(groupName)) {
			System.out.println("==============groupName is null ===");
			errMsg = "Please select group(s) to edit";
			response.sendRedirect("BulkEditUserGroups!default.jsp?errMsg=" + errMsg);
			return;
		}
		if (StringUtils.isBlank(groupUserStr)) {
			System.out.println("==============groupUserStr is null ===");
			errMsg += "Please select users to remove from the selected group(s) ";
			System.out.println("========29======errMsg ===" + errMsg);
			request.setAttribute("errMsg", errMsg);
			response.sendRedirect("BulkEditUserGroups!default.jsp?groupName=" + groupName + "&errMsg=" + errMsg);
			return;
		}

		int groupUserId = Integer.parseInt(groupUserStr);
		System.out.println("=========groupUserId=====" + groupUserId);
		GroupUserBO groupUserBO = new GroupUserBO();
		groupUserBO.deleteGroupUser(groupUserId);
		response.sendRedirect("BulkEditUserGroups!default.jsp?groupName=" + groupName);
	%>

</body>
</html>