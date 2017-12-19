<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>

<!-- 功能：添加问题状态 -->
<!-- @author: 许希光-->
<%
	String name = request.getParameter("name");
	String description = request.getParameter("description");
	String iconUrl = request.getParameter("filename");

	if (StringUtils.isBlank(name)) {
		request.setAttribute("error", "the name can't be empty");
%>
<jsp:forward page="viewIssueStatus.jsp"></jsp:forward>
<%
	}
	if (StringUtils.isBlank(iconUrl)) {
		request.setAttribute("error", "You must specify a URL for the icon of this new status.");
%>
<jsp:forward page="viewIssueStatus.jsp"></jsp:forward>
<%
	}
	IssueStatus issueStatus = new IssueStatus();
	issueStatus.setName(name);
	issueStatus.setDescription(description);
	issueStatus.setIconUrl(iconUrl);

	IssueStatusBO issueStatusBO = new IssueStatusBO();
	if (!issueStatusBO.exist(issueStatus)) {
		issueStatusBO.addIssueStatus(issueStatus);
		out.println("添加成功");
%>
<jsp:forward page="viewIssueStatus.jsp"></jsp:forward>
<%
	} else {
		request.setAttribute("error", "the name already exist");
%>
<jsp:forward page="viewIssueStatus.jsp"></jsp:forward>
<%
	}
%>
