<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
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
				comment.setAuthor(user.getName());
				comment.setCommentContent(content);
				comment.setCreateDate(createDate);
				comment.setIssueId(issueId);
				commentBO.addComment(comment);
			}
			//assignee issue
			IssueBO issueBO = new IssueBO();
			Issue issue = issueBO.getIssueDetail(issueId);
			if (issue.getAssigneeId() == assigneeId) {
				System.out
						.println("======52=====issue.getAssignee============="
								+ issue.getAssignee());
		%>
		<jsp:forward page="assignee.jsp">
			<jsp:param name="error" value="<%=issue.getAssignee()%>" />
			<jsp:param name="issueId" value="<%=issueId%>" />
		</jsp:forward>
		<%
			}
			issueBO.setAssignee(issueId, assigneeId);
			response.sendRedirect(request.getContextPath()
					+ "/jsp/frontend/issue/issueDetailLayout.jsp?issueKey="
					+ issue.getIssueKey());
		%>
	</body>
</html>
