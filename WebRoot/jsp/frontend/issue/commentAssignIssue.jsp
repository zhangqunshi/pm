<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="java.util.*"%>
<%
	String id = request.getParameter("id");
	String assign = request.getParameter("assignee");
	String resolution = request.getParameter("newId");
	String comment = request.getParameter("comment");
	String status = request.getParameter("status");
	User user = (User) session.getAttribute(Global.SESSION_USER);
	System.out.println("=======id======" + id);
	System.out.println("=======assign======" + assign);
	System.out.println("=======resolution======" + resolution);
	System.out.println("=======coment======" + comment);
	int issueId = Integer.parseInt(id);
	IssueBO ib = new IssueBO();
	Issuehb issue = ib.getIssue(issueId);
	if (assign.equals("-1")) {
		issue.setAssigneeId(user);  //xxx
	} else {
		issue.setAssigneeId(new UserBO().getUser(Integer.parseInt(assign)));  //xxx
	}
	issue.setResolutionId(Integer.parseInt(resolution));
	ib.updateIssueByLinkResolution(issue);
	if (!StringUtils.isBlank(comment)) {
		String createTime = StringUtils.toString(new java.util.Date());
		CommentBO cb = new CommentBO();
		Comment coment = new Comment();
		coment.setAuthor(user.getName());
		coment.setCommentContent(comment);
		coment.setIssueId(issue);
		coment.setCreateDate(new java.util.Date());
		cb.addComment(coment);
	}
	if (status.equals("close")) {
		String endTime = StringUtils.toString(new Date());
		Issuehb newIssue = ib.getIssue(issueId);
		newIssue.setEndTime(new java.util.Date());
		newIssue.setLastUpdateDate(new java.util.Date());
		newIssue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.CLOSE));
		ib.updateIssueByLinkStatus(newIssue);
	}
	if (status.equals("resolved")) {
		String endTime = StringUtils.toString(new Date());
		Issuehb newIssue = ib.getIssue(issueId);
		newIssue.setEndTime(new java.util.Date());
		newIssue.setLastUpdateDate(new java.util.Date());
		newIssue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.RESOLVED));
		ib.updateIssueByLinkStatus(newIssue);
	}
	if (status.equals("reopen")) {
		String updateTime = StringUtils.toString(new Date());
		Issuehb newIssue = ib.getIssue(issueId);
		newIssue.setLastUpdateDate(new java.util.Date());
		newIssue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.REOPEN));
		ib.updateIssueByLinkStatus(newIssue);
	}
%>
<jsp:forward page="issueDetailLayout.jsp" />