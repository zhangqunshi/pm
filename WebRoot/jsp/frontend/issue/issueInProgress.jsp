<%--
 在dashboard.jsp中 正在进行的问题列表
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="java.util.*"%>
<%
	String contextPath = request.getContextPath();
	User user = (User) session.getAttribute(Global.SESSION_USER);
	int userID = user.getId();
	IssueBO isBO = new IssueBO();
	List<Issue> inprogressList = isBO.getIssueInProgressList(userID);
%>

<table class="tableBorder maxWidth" width="100%" cellspacing="1"
	cellpadding="3" border="0">
	<tr class="rowHeader">
		<td class="colHeaderLink" colspan="4">
			开发的问题:
			<b><a
				href='<%=contextPath%>/jsp/frontend/issue/issueNavigator.jsp?action=inProgress'>进行中</a>
				<%
					if (inprogressList != null) {
					if (inprogressList.size() < 10) {
						out.println("<small>(显示" + inprogressList.size() + "中的"
								+ inprogressList.size() + ")");
					} else {
						out.println("10/" + inprogressList.size() + "</small>");
					}
					}
				%> </b>
		</td>
	</tr>

	<%
		if (inprogressList != null && inprogressList.size() > 0) {
			for (int i = 0; i < 10 && i < inprogressList.size(); i++) {
				Issue issue = inprogressList.get(i);
	%>
	<tr class="rowNormal DFD-3-tr">
		<td nowrap="" width="1%">
			<a
				href="<%=contextPath%>/jsp/frontend/issue/issueDetailLayout.jsp?action=inProgress&issueKey=<%=issue.getIssueKey()%>">
				<img height="16" width="16" border="0" align="absmiddle"
					title="<%=issue.getIssueTypeName()%>"
					alt="<%=issue.getIssueTypeName()%>"
					src="<%=contextPath + issue.getIssueTypeIcon()%>" /> </a>
		</td>

		<td nowrap="" width="1%">
			<font size="1"> <a
				href="<%=contextPath%>/jsp/frontend/issue/issueDetailLayout.jsp?action=inProgress&issueKey=<%=issue.getIssueKey()%>">
					<span class="issuekey"><%=issue.getIssueKey()%></span> </a> </font>
		</td>
		<td width="100%">
			<a style="text-decoration: none;" 
				href="<%=contextPath%>/jsp/frontend/issue/issueDetailLayout.jsp?action=inProgress&issueKey=<%=issue.getIssueKey()%>"><%=issue.getName()%></a>
		</td>
		<td nowrap="" width="1%">
			<img height="16" width="16" border="0" align="absmiddle"
				title="<%= issue.getPriorityLevel() %>" alt="Major"
				src="<%=contextPath + issue.getPriorityLevelIcon()%> " />
		</td>

	</tr>
	<%
		} //endfor
		}//endif
	%>

</table>