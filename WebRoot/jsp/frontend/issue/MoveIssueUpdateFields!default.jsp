<%-- 
	描述： 移动问题第二步
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<html>
	<head>
		<%
			//从session中获得issue信息;
			Issuehb issue = (Issuehb)session.getAttribute("moveIssue");
			String pidStr = request.getParameter("pid");
			String issueTypeStr = request.getParameter("issuetype");

			//判断参数是否为空
			if (issue == null) {
				System.out.println("问题信息为null");
				System.out.println("=======step2==issue=========="+issue);
				return;
			}
			if (pidStr == null) {
				System.out.println("pidStr信息为null");
				System.out.println("=======step2==issue=========="+pidStr);
				return;
			}
			if (issueTypeStr == null) {
				System.out.println("issueTypeStr信息为null");
				System.out.println("=======step2==issue=========="+issueTypeStr);
				return;
			}
			
			//转换类型
			int pidInt = Integer.parseInt(pidStr);
			int issueTypeInt = Integer.parseInt(issueTypeStr);
			
			//获得project对象
			ProjectBO projectBo = new ProjectBO();
			Project project = projectBo.getProject(pidInt);

			//获得IssueType对象
			IssueTypeBO issueTypeBo = new IssueTypeBO();
			IssueType issueType = issueTypeBo.getIssueType(issueTypeInt);
		%>
	</head>
	<body>
	  <%
	   if(issue.getProjectId().getProjectId() == pidInt && issue.getIssueTypeId().getId() == issueTypeInt){
	  %>
	       <jsp:forward page="MoveIssue!default.jsp">
	       <jsp:param name="error" value="错误<br>你必须选择一个不同的项目或者问题类型."/>
	       <jsp:param name="issueKey" value="<%=issue.getIssueKey() %>"/>
	       </jsp:forward>
	  <%
	   }
      %>
	  <form action="MoveIssueUpdateFields.jsp">
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
			<tbody>
				<tr>
					<td bgcolor="#f0f0f0" width="200" valign="top">
						<table cellspacing="0" cellpadding="3" border="0" width="100%">
							<tbody>
								<tr>
									<td bgcolor="#dddddd">
										<b>移动问题: TT-2</b>
									</td>
								</tr>
							</tbody>
						</table>
						<img height="1" border="0" width="100%" alt=""
							src="<%=request.getContextPath() %>/images/icons/bluepixel.gif" />
						
						<table cellpadding="5" border="0">
							<tbody>
								<tr>
									<td>
										<table border="0">
											<tbody>
												<tr>
													<td>
														<img alt="" src="<%=request.getContextPath() %>/images/icons/bullet_done.gif" />
													</td>
													<td width="1%">
														1.
													</td>
													<td nowrap="">
														<a href="MoveIssue!default.jsp?issueKey=<%=issue.getIssueKey()%>"
				                                        id="move_issue" onclick='window.history.back();'>选择项目和问题类型</a>
													</td>
												</tr>
												<tr>
													<td />
													<td />
													<td nowrap="">
														项目:
														<%=project.getName() %>
													</td>
												</tr>
												<tr>
													<td />
													<td />
													<td nowrap="">
														问题类型:
														<%=issueType.getName() %>
													</td>
												</tr>
												<tr>
													<td>
														<img alt="" src="<%=request.getContextPath() %>/images/icons/bullet_done.gif" />
													</td>
													<td width="1%">
														2.
													</td>
													<td>
														选择新的状态
													</td>
												</tr>
												<tr>
													<td />
													<td />
													<td nowrap="">
														状态:
														<%=issue.getIssueStatusName() %>
													</td>
												</tr>
												<tr>
													<td>
														<img alt="" src="<%=request.getContextPath() %>/images/icons/bullet_inprogress.gif" />
													</td>
													<td width="1%">
														<b>3.</b>
													</td>
													<td>
														<b>更新字段</b>
													</td>
												</tr>
												<tr>
													<td>
														<img alt="" src="<%=request.getContextPath() %>/images/icons/bullet_notdone.gif" />
													</td>
													<td width="1%">
														4.
													</td>
													<td>
														确认
													</td>
												</tr>
											</tbody>
										</table>
										<p>
										<table cellspacing="0" cellpadding="1" border="0"
											bgcolor="#bbbbbb" width="80%">
											<tbody>
												<tr>
													<td>
														<table cellspacing="0" cellpadding="4" border="0"
															bgcolor="#666666" width="100%">
															<tbody>
																<tr>
																	<td bgcolor="#fffff0">
																		<b>注意:</b> 选择上面的链接返回到上一步.
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
										
										<p>
										
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td bgcolor="#ffffff" valign="top">
						<table cellspacing="0" cellpadding="10" border="0" width="100%">
							<tbody>
								<tr>
									<td>
										<form
											onsubmit="if (this.submitted) return false; this.submitted = true; return true"
											name="simpleform" method="post"
											action="MoveIssueUpdateFields.jsp">
											<table class="simpleform maxWidth">
												<tbody>
													<tr>
														<td class="simpleformheader" colspan="2">
															<h3 class="formtitle">
																移动问题: 更新字段
															</h3>
														</td>
													</tr>
													<tr>
														<td class="simpleformheader" colspan="2">
															<b>步骤3(共4)</b> : 更新和新项目相关的问题的字段.
															<p>
																<span class="red-highlight"> <b>注意</b> </span> :
																第2步不是必须的.
															</p>
														</td>
													</tr>
													<tr bgcolor="#fffff0">
														<td>
															所有的字段将会被自动更新.
														</td>
													</tr>
													<tr class="hidden">
														<td>
															<input id="id" type="hidden" value="10001" name="id" />
														</td>
													</tr>
													<tr>
														<td class="fullyCentered simpleformfooter" colspan="2">
															<input id="下一步 >>" class="spaced" type="submit"
																title="按 Alt+S 提交" accesskey="S" value="下一步 >>"
																name="下一步 >>" />
															<input id="cancelButton" type="button"
																onclick="location.href='<c:url value="/jsp/frontend/issue/issueDetailLayout.jsp"/>?issueKey=<%=issue.getIssueKey() %>'" value="取消"
																name="/browse/TT-2" title="取消 (Alt + `)" accesskey="`" />
														</td>
													</tr>
												</tbody>
											</table>
										</form>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	<%
	//把新的项目和问题类型放放issue中;
	//再把issue放入session中;
        issue.setProjectId(project);
		issue.setProjectName(project.getName()); 
		issue.setIssueTypeId(issueType);
		issue.setIssueTypeName(issueType.getName());   
		System.out.println("===============issue==="+issue);
		//request.setAttribute("moveIssue",issue);
        session.setAttribute("moveIssue",issue);
   %>
	</body>
</html>
