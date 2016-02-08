<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	IssueTypeBO ib = new IssueTypeBO();
	String iid = request.getParameter("id");
	int ii = Integer.parseInt(iid);
	ib.deleteIssueType(ii);
%>
<jsp:forward page="/jsp/backend/issue/type/viewIssueType.jsp"/>