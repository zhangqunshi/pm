<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%
	String issueKey = request.getParameter("issueKey");
	String action = request.getParameter("action");
	System.out.println("=======action=====" + action);
	String updateTime = StringUtils.toString(new Date());
	IssueBO ib = new IssueBO();
	Issue issue = ib.getIssueByKey(issueKey);
	issue.setIssueStatus(Global.IN_PROGRESS);
	issue.setLastUpdateDate(updateTime);
	ib.updateIssueByLinkStatus(issue);
%>
<jsp:forward page="issueDetailLayout.jsp" />