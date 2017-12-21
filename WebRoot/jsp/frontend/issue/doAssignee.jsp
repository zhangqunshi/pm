<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>

<body>
    <%
        //get parameters
        String issueIdStr = request.getParameter("issueId");
        String projectIdStr = request.getParameter("projectId");
        String assigneeIdStr = request.getParameter("assigneeId");
        String content = request.getParameter("content");
        User user = (User) session.getAttribute(Global.SESSION_USER);

        //parse parameters
        int issueId = 0;
        int projectId = 0;
        int assigneeId = 0;
        String createDate = StringUtils.getCurrDate();
        if (StringUtils.isNotBlank(issueIdStr)) {
            issueId = Integer.parseInt(issueIdStr);
        }
        if (StringUtils.isNotBlank(projectIdStr)) {
            projectId = Integer.parseInt(projectIdStr);
        }
        if (StringUtils.isNotBlank(assigneeIdStr)) {
            assigneeId = Integer.parseInt(assigneeIdStr);
        }
        //add comment
        if (StringUtils.isNotBlank(content)) {
            CommentBO commentBO = new CommentBO();
            Comment comment = new Comment();
            Commenthbm c = new Commenthbm();
            comment.setAuthor(user.getName());
            comment.setCommentContent(content);
            comment.setCreateDate(new java.util.Date());
            comment.setIssueId(issueId);
            
            c.setAuthor(user.getName());
            c.setCommentContent(content);
            c.setCreateDate(new java.util.Date());
            c.setIssue(new IssueBO().getIssue(issueId));
            
            commentBO.addComment(c);
        }
        //assignee issue
        IssueBO issueBO = new IssueBO();
        Issue issue = issueBO.getIssueDetail(issueId);
        if (issue.getAssigneeId() == assigneeId) {
    %>
    <jsp:forward page="assignee.jsp">
        <jsp:param name="error" value="<%=issue.getAssignee()%>" />
        <jsp:param name="issueId" value="<%=issueId%>" />
    </jsp:forward>
    <%
        }
        issueBO.setAssignee(issueId, assigneeId);
        response.sendRedirect(request.getContextPath() + "/jsp/frontend/issue/issueDetailLayout.jsp?issueKey="
                + issue.getIssueKey());
    %>
</body>
</html>
