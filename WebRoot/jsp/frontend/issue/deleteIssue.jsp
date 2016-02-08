<!-- 功能：删除问题-->
<!-- @author 许希光 -->
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<body>
		<%
			String issueIdStr = request.getParameter("issueId");
			System.out.println("deleteIssue.jsp?issueId=" + issueIdStr);
			int issueId = 0;
			if (StringUtils.isNotBlank(issueIdStr)) {
				issueId = Integer.parseInt(issueIdStr);
			}
			Issue issue = new IssueBO().getIssueDetail(issueId);
		%>
		<table>
			<tr>
				<td bgcolor="#f0f0f0" width="200" valign="top">
					<table cellspacing="0" cellpadding="0" border="0" width="200">
						<tbody>
							<tr>
								<td>
									<table cellspacing="0" cellpadding="3" border="0" width="100%">
										<tbody>
											<tr>
												<td bgcolor="#dddddd">
													<span style="float: left;"> <b>问题详情</b> </span>
													<span class="small" style="float: right;"> </span>
												</td>
											</tr>
										</tbody>
									</table>
									<img height="1" border="0" width="100%" alt=""
										src="<%=request.getContextPath()%>/images/icons/bluepixel.gif" />
									<br />
									<table border="0">
										<tr>
											<td valign="top">
												<b>Key:</b>
											</td>
											<td valign="top">
												<b><a href="#" id="issue_key_TT-9"><%=issue.getIssueKey()%></a>
												</b>
											</td>
										</tr>

										<tr>
											<td valign="top">
												<b>类型:</b>
											</td>
											<td valign="top">
												<img height="16" border="0" align="absmiddle" width="16"
													title="Task - A task that needs to be done." alt="Task"
													src="<%=request.getContextPath()%><%=issue.getIssueTypeIcon()%>" />
												<%=issue.getIssueTypeName()%>
											</td>
										</tr>

										<tr>
											<td valign="top">
												<b>状态:</b>
											</td>
											<td valign="top">
												<img height="16" border="0" align="absmiddle" width="16"
													title="In Progress - This issue is being actively worked on at the moment by the assignee."
													alt="In Progress"
													src="<%=request.getContextPath()%><%=issue.getIssueStatusIcon()%>" />
												<%=issue.getIssueStatusName()%>
											</td>
										</tr>
										<%
											if (issue.getIssueStatus() == Global.CLOSE
													|| issue.getIssueStatus() == Global.RESOLVED) {
										%>
										<tr>
											<td valign="top">
												<b>解决:</b>
											</td>
											<td valign="top">

												<%=issue.getResolution()%>
											</td>
										</tr>
										<%
											}
										%>
										<tr>
											<td valign="top">
												<b>优先级:</b>
											</td>
											<td valign="top">
												<img height="16" border="0" align="absmiddle" width="16"
													title="Major - Major loss of function." alt="Major"
													src="<%=request.getContextPath()%><%=issue.getPriorityLevelIcon()%>" />
												<%=issue.getPriorityLevel()%>
											</td>
										</tr>


										<tr>
											<td valign="top">
												<b>开发者:</b>
											</td>
											<td valign="top">
												<a href="userDeploy.jsp?name=<%=issue.getAssignee()%>"><%=issue.getAssignee()%></a>
											</td>
										</tr>

										<tr>
											<td valign="top">
												<b>报告人:</b>
											</td>
											<td valign="top">
												<a href="userDeploy.jsp?name=<%=issue.getReporter()%>"><%=issue.getReporter()%></a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>

				<td width="100%">
					<form action="doDeleteIssue.jsp?">
						<table style="border: 1px solid rgb(187, 187, 187); padding: 2px;"
							width="100%">
							<tr>
								<td bgcolor="#f0f0f0">
									<H3>
										删除问题
									</H3>
									<br>
									<p>
										请确认你要删除这个问题吗？
										<br>
										<br>
										删除该问题，将会被永久删除。如果你完成了该问题，通常是“解决”或“关闭”，而不是删除
										<br>
										<br>
										if you have completed the issue,it should usually be resolved
										or closed - not deleted
									</p>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="hidden" name="id" value="<%=issueId%>" />
									<input type="submit" value="删除" />
									<input type="button" value="取消"
										onclick="window.history.back();" />

								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>
