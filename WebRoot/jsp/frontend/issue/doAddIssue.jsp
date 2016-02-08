<%-- 
    Document   : 向数据库中写入记录
    Created on : 2008-12-24
    Author     : Kris
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	//获得参数
	String summary = request.getParameter("summary");
	String projectIdStr = request.getParameter("projectId");
	String issueTypeIdStr = request.getParameter("issueTypeId");
	String priorityLevelIdStr = request.getParameter("priorityLevelId");
	String planEndTime = request.getParameter("planEndTime");
	String componentIdStr = request.getParameter("componentId");
	String developerIdStr = request.getParameter("developerId");
	String reporter = request.getParameter("reporter");
	String environment = request.getParameter("environment");
	String description = request.getParameter("description");
	String projectKey = request.getParameter("projectkey");

	System.out.println("=======projectId======" + projectIdStr);
	System.out.println("======issueTypeId=======" + issueTypeIdStr);
	System.out.println("========name=====" + summary);
	System.out.println("=======priorityLevelId======"
			+ priorityLevelIdStr);
	System.out.println("=======planEndTime======" + planEndTime);
	System.out.println("=======componentId======" + componentIdStr);
	System.out.println("=======developerId======" + developerIdStr);
	System.out.println("=========reporter====" + reporter);
	System.out.println("=========environment====" + environment);
	System.out.println("=========description====" + description);
	//检查参数
	UserBO ub = new UserBO();
	IssueBO ib = new IssueBO();
	boolean hasError = false;
	String error = "";
	if (!ib.checkDate(planEndTime)) {
		hasError = true;
		error += "the time format is not right<br>";
	}
	if (!ub.checkUserExist(reporter)) {
		hasError = true;
		error += "the reporter does't exist<br>";
	}
	if (StringUtils.isBlank(summary)) {
		hasError = true;
		error += "Please enter the summary of issue!<br>";
	}
	if (StringUtils.isBlank(issueTypeIdStr)) {
		hasError = true;
		error += "Please choose issue type!<br>";
	}
	if (StringUtils.isBlank(projectIdStr)) {
		hasError = true;
		error += "Please choose project!<br>";
	}
	if (StringUtils.isBlank(priorityLevelIdStr)) {
		hasError = true;
		error += "Please choose issue priority!<br>";
	}
	if (StringUtils.isBlank(developerIdStr)) {
		hasError = true;
		error += "Please choose developer!<br>";
	}
	if (StringUtils.isBlank(reporter)) {
		hasError = true;
		error += "Please choose reporter!<br>";
	}
	if (hasError) {
		System.out.println("error" + error);
		request.setAttribute("error", error);
%>
<jsp:forward page="addIssueStep2.jsp" />
<%
	} //endif

	//转换类型  	
	int issueTypeId = Integer.parseInt(issueTypeIdStr);
	int projectId = Integer.parseInt(projectIdStr);
	int priorityLevelId = Integer.parseInt(priorityLevelIdStr);
	int componentId = 0;
	if (StringUtils.isNotBlank(componentIdStr)) {
		componentId = Integer.parseInt(componentIdStr);
	}
	int developerId = Integer.parseInt(developerIdStr);
	String createDate = StringUtils.toString(new java.util.Date());

	//建立issue对象  	
	Issue issue = new Issue();
	issue.setIssueTypeId(issueTypeId);
	issue.setName(StringUtils.removeHtmlTag(summary));
	issue.setPriorityLevelId(priorityLevelId);
	issue.setPlanEndTime(planEndTime);
	if (StringUtils.isNotBlank(componentIdStr)) {
		issue.setComponentId(componentId);
	}
	issue.setAssigneeId(developerId);
	User user = new UserBO().getUser(reporter); //注意我没有判断这个用户是否存在, 以后加上
	issue.setReporterId(user.getId());
	issue.setEnvironment(StringUtils.removeHtmlTag(environment));
	issue.setDescription(StringUtils.removeHtmlTag(description));
	issue.setProjectId(projectId);
	issue.setCreateDate(createDate);
	issue.setLastUpdateDate(createDate);
	issue.setIssueStatus(Global.OPEN);

	//找此项目的最大问题的索引值,作为issueKey
	ProjectBO projectBO = new ProjectBO();
	int nextId = projectBO.getProjectIssueMaxId(projectId);
	String issueKey = projectKey + "-" + nextId;
	issue.setIssueKey(issueKey);

	//保存issue对象    
	IssueBO issueBO = new IssueBO();
	issueBO.addIssue(issue);
	String nextPage = request.getContextPath()
			+ "/jsp/frontend/issue/issueDetailLayout.jsp?action=all&issueKey="
			+ java.net.URLEncoder.encode(issueKey, "UTF-8");
	System.out.println("nextPage===" + nextPage);
	response.sendRedirect(nextPage);
%>
