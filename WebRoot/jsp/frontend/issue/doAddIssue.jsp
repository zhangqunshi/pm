<%-- 
    Document   : 向数据库中写入记录
    Created on : 2008-12-24
    Author     : Kris
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
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
<<<<<<< HEAD

=======
        
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
        request.setAttribute("error", error);
%>
<jsp:forward page="addIssueStep2.jsp" />
<%
    } //endif

    //转换类型  	
    int issueTypeId = Integer.parseInt(issueTypeIdStr);
    int projectId = Integer.parseInt(projectIdStr);
    int priorityLevelId = Integer.parseInt(priorityLevelIdStr);
    IssueTypehbm issueType = new IssueTypeBO().getIssueType(issueTypeId);
    Projecthbm proj = new ProjectBO().getProject(projectId);
    IssuePriorityhbm issuePriority = new IssuePriorityBO().getIssuePriority(priorityLevelId);

    int componentId = 0;
    if (StringUtils.isNotBlank(componentIdStr)) {
        componentId = Integer.parseInt(componentIdStr);
    }
    int developerId = Integer.parseInt(developerIdStr);
    Userhbm userD = new UserBO().getUser(developerId);
    String createDate = StringUtils.toString(new java.util.Date());

    //建立issue对象  	
    Issuehbm issue = new Issuehbm();
    issue.setIssueType(issueType);
    issue.setName(StringUtils.removeHtmlTag(summary));
    issue.setPriorityLevel(issuePriority);
    issue.setPlanEndTime(StringUtils.parseDate(planEndTime));
    if (StringUtils.isNotBlank(componentIdStr)) {
        issue.setComponentId(componentId);
    }
    issue.setAssignee(userD);
    Userhbm user = new UserBO().getUser(reporter); //注意我没有判断这个用户是否存在, 以后加上
    issue.setReporter(user);
    issue.setEnvironment(StringUtils.removeHtmlTag(environment));
    issue.setDescription(StringUtils.removeHtmlTag(description));
    issue.setProject(proj);
    issue.setCreateDate(new java.util.Date());
    issue.setLastUpdateDate(new java.util.Date());
    IssueStatushbm is = new IssueStatusBO().getIssueStatus(Global.OPEN);
    issue.setIssueStatus(is);

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
<<<<<<< HEAD

=======
    
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
    response.sendRedirect(nextPage);
%>
