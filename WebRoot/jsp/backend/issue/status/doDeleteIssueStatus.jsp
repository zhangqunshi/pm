<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>

<html>
	<body>
		<%
			String id = (String) request.getParameter("IssueStatusId");
			System.out.println("=====IssueStatusId==" + id);
			int issueStatusId = Integer.parseInt(id);

			IssueStatusBO is = new IssueStatusBO();
			is.deleteIssueStatus(issueStatusId);
		%>
		<jsp:forward page="viewIssueStatus.jsp"></jsp:forward>
	</body>
</html>
