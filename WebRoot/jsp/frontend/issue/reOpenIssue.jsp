<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
    String issueKey = request.getParameter("issueKey");
    String action = request.getParameter("action");
    String updateTime = StringUtils.toString(new Date());
    IssueBO ib = new IssueBO();
    Issuehbm issue = ib.getIssueByKey(issueKey);
    issue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.REOPEN));
    issue.setLastUpdateDate(new java.util.Date());
    ib.updateIssueByLinkStatus(issue);
%>
<jsp:forward page="issueDetailLayout.jsp" />