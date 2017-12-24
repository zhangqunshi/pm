<%-- 
	描述： 操作修改后的问题
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<html>
<%
    //用问题参数 
    String id = request.getParameter("id");
    String issueKey = request.getParameter("issueKey");
    String name = request.getParameter("name");
    String planEndTime = request.getParameter("planEndTime");
    String reportername = request.getParameter("reporter");
    String environment = request.getParameter("environment");
    String description = request.getParameter("description");

    String issueTypeId = request.getParameter("issueTypeId");
    String priorityLevelId = request.getParameter("priorityLevelId");
    String componentId = request.getParameter("componentId");
    String developerId = request.getParameter("developerId");
    String createDate = StringUtils.toString(new java.util.Date());

    int issueId = Integer.parseInt(id);
    int issueTypeIdInt = Integer.parseInt(issueTypeId);
    IssueTypehbm issueType = new IssueTypeBO().getIssueType(issueTypeIdInt);
    //检查参数
    boolean hasError = false;
    String errMsg = "";
    if (StringUtils.isBlank(issueTypeId)) {
        hasError = true;
        errMsg += "Please choose issue type!";
    }
    if (StringUtils.isBlank(name)) {
        hasError = true;
        errMsg += "Please choose summary!";
    }
    if (StringUtils.isBlank(priorityLevelId)) {
        hasError = true;
        errMsg += "Please choose issue priority!";
    }
    if (StringUtils.isBlank(developerId)) {
        hasError = true;
        errMsg += "Please choose developerId!";
    }
    if (StringUtils.isBlank(reportername)) {
        hasError = true;
        errMsg += "Please choose reporter!";
    }
    if (hasError) {
        
        request.setAttribute("errMsg", errMsg);
%>
<jsp:forward page="updateIssue.jsp">
    <jsp:param name="issueId" value="<%=issueId%>" />
</jsp:forward>
<%
    //response.sendRedirect("updateIssue.jsp?issueId="+issueId);		
    } //endif

    int priorityLevelIdInt = Integer.parseInt(priorityLevelId);
    IssuePriorityhbm issuePriority = new IssuePriorityBO().getIssuePriority(priorityLevelIdInt);//
    int componentIdInt = 0;
    if (StringUtils.isNotBlank(componentId)) {
        componentIdInt = Integer.parseInt(componentId);
    }
    int developerIdInt = Integer.parseInt(developerId);
    Userhbm userD = new UserBO().getUser(developerIdInt); //

    Userhbm user = new UserBO().getUser(reportername);
    IssueBO issueBO = new IssueBO();
    Issuehbm issue = issueBO.getIssue(issueId);

    if (StringUtils.isNotBlank(componentId)) {
        issue.setComponentId(componentIdInt);
    }
    issue.setIssueType(issueType);
    issue.setName(StringUtils.removeHtmlTag(name));
    issue.setPriorityLevel(issuePriority);
    issue.setPlanEndTime(StringUtils.toDate(planEndTime));
    issue.setComponentId(componentIdInt);
    issue.setAssignee(userD);
    issue.setReporter(user);
    issue.setEnvironment(StringUtils.removeHtmlTag(environment));
    issue.setDescription(StringUtils.removeHtmlTag(description));
    issue.setLastUpdateDate(new java.util.Date());
    issue.setIssueStatus(new IssueStatusBO().getIssueStatus(1)); // 状态 1 ，表示待解决

    //保存更改记录
    Issuehbm issue1 = issueBO.getIssue(issueId);
    IssueChangeLogBO iclbo = new IssueChangeLogBO();
    iclbo.checkIfAdd(issue, issue1);

    //更新issue
    issueBO.updateIssue(issue);

    request.setAttribute("issue", issue);
    issueKey = java.net.URLEncoder.encode(issueKey, "UTF-8");
    response.sendRedirect("issueDetailLayout.jsp?issueKey=" + issueKey);//返回到查看单个问题页面
%>
<form>
    <input type="button" value="返回" onclick="window.history.back();" />
</form>

</html>
