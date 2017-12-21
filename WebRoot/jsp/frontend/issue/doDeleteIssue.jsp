<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<!-- 功能：删除问题-->
<!-- @author 许希光 -->
<%
    IssueBO issueBO = new IssueBO();
    String id = request.getParameter("id");

    int issueId = Integer.parseInt(id);
    Issue issue = issueBO.getIssueDetail(issueId);

    int projectId = issue.getProjectId();

    String projectName = issue.getProjectName();
    issueBO.deleteIssue(issueId);

    String path = request.getContextPath();
    String action = (String) session.getAttribute("action");

    if (action.equals("all")) {
        response.sendRedirect(path + "/jsp/frontend/issue/issueNavigator.jsp?action=all&projectId=" + projectId
                + "&projectName=" + projectName);
    } else if (action.equals("forMe")) {
        response.sendRedirect(path + "/jsp/frontend/issue/issueNavigator.jsp?action=forMe");
    } else {
        response.sendRedirect(path + "/jsp/frontend/issue/issueNavigator.jsp?action=inProgress");
    }
%>

