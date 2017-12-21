<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    //获得参数值
    String issueName = request.getParameter("issueName");
    String issueId = request.getParameter("issueId");

    if (StringUtils.isBlank(issueName)) {
        return;
    }
    if (StringUtils.isBlank(issueId)) {
        return;
    }

    //获得复制前的任务对象
    IssueBO bo = new IssueBO();
    Issuehbm oldIssue = bo.getIssue(Integer.parseInt(issueId));

    //生成复制后的任务对象

    ProjectBO projectBO = new ProjectBO();
    int nextId = projectBO.getProjectIssueMaxId(oldIssue.getProject().getId());
    Projecthbm project = projectBO.getProject(oldIssue.getProject().getId());
    String projectKey = project.getProjectKey();
    String newIssueKey = projectKey + "-" + nextId;

    Issuehbm newIssue = new Issuehbm();
    newIssue.setIssueType(oldIssue.getIssueType());
    newIssue.setName(issueName);
    newIssue.setPriorityLevel(oldIssue.getPriorityLevel());
    newIssue.setPlanEndTime(oldIssue.getPlanEndTime());
    newIssue.setComponentId(oldIssue.getComponentId());
    newIssue.setAssignee(oldIssue.getAssignee());
    newIssue.setReporter(oldIssue.getReporter());
    newIssue.setEnvironment(oldIssue.getEnvironment());
    newIssue.setDescription(oldIssue.getDescription());
    newIssue.setProject(oldIssue.getProject());
    newIssue.setCreateDate(new java.util.Date());
    newIssue.setLastUpdateDate(new java.util.Date());
    newIssue.setIssueStatus(oldIssue.getIssueStatus());
    newIssue.setIssueKey(newIssueKey);
    bo.addIssue(newIssue);

    response.sendRedirect("issueDetailLayout.jsp?issueKey=" + java.net.URLEncoder.encode(newIssueKey, "UTF-8"));
%>
