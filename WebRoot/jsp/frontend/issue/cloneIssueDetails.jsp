<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	//获得参数值
	String issueName = request.getParameter("issueName");
	String issueId = request.getParameter("issueId");
	
	System.out.println("==========11===issueName========" + issueName);
	System.out.println("==========11===issueId========" + issueId);
	
	if (StringUtils.isBlank(issueName)) {
		return;
	}
	if (StringUtils.isBlank(issueId)) {
		return;
	}
	
	//获得复制前的任务对象
	IssueBO bo = new IssueBO();
	Issuehb oldIssue = bo.getIssue(Integer.parseInt(issueId));
	
	//生成复制后的任务对象
	
	ProjectBO projectBO = new ProjectBO();
	int nextId = projectBO.getProjectIssueMaxId(oldIssue.getProjectId().getProjectId());
	Project project = projectBO.getProject(oldIssue.getProjectId().getProjectId());
	String projectKey = project.getProjectKey();
	String newIssueKey = projectKey + "-" + nextId;
	System.out.println("===newIssueKey===="	+ newIssueKey);
	
	Issuehb newIssue = new Issuehb();
	newIssue.setIssueTypeId(oldIssue.getIssueTypeId());
	newIssue.setName(issueName);
	newIssue.setPriorityLevelId(oldIssue.getPriorityLevelId());
	newIssue.setPlanEndTime(oldIssue.getPlanEndTime());
	newIssue.setComponentId(oldIssue.getComponentId());
	newIssue.setAssigneeId(oldIssue.getAssigneeId());
	newIssue.setReporterId(oldIssue.getReporterId());
	newIssue.setEnvironment(oldIssue.getEnvironment());
	newIssue.setDescription(oldIssue.getDescription());
	newIssue.setProjectId(oldIssue.getProjectId());
	newIssue.setCreateDate(new java.util.Date());
	newIssue.setLastUpdateDate(new java.util.Date());
	newIssue.setIssueStatus(oldIssue.getIssueStatus());
	newIssue.setIssueKey(newIssueKey);
	bo.addIssue(newIssue);
	
	response.sendRedirect("issueDetailLayout.jsp?issueKey=" + java.net.URLEncoder.encode(newIssueKey, "UTF-8"));
%>
