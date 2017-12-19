<%-- 
    Document   : 问题详情的整体布局页面, 左右布局
    Created on : 2008-12-25
    Author     : Kris
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>

<%
	String issueKey = request.getParameter("issueKey");
	System.out.println("===issueKey===" + issueKey);
	
	if (StringUtils.isBlank(issueKey)) {
		System.out.println("The issue key is null");
		out.println("<body>The issue key is null</body>");
		return;
	}
	Issue issue = new IssueBO().getIssueDetailByKey(issueKey);
	request.setAttribute("issue", issue);
%>
<html>
	<head>
	</head>
	<body>
		<table border="0" width="100%">
			<tr>
				<td valign="top" width="200"><%@include file="/jsp/frontend/issue/issueDetailLeftMenu.jsp"%></td>
				<td valign="top"><%@include file="/jsp/frontend/issue/issueDetail.jsp"%></td>
			</tr>
		</table>
	</body>
</html>