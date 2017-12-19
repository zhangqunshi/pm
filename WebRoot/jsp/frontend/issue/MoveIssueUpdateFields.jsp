<%-- 
	描述： 移动问题第三步
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
	</head>

	<body>
	<%
			//从session中获得issue信息;
			Issuehb newIssue = (Issuehb)session.getAttribute("moveIssue");
            
			//判断参数是否为空
			if (newIssue == null) {
				System.out.println("问题信息为null");
				System.out.println("=======step3==issue=========="+newIssue);
				return;
			}
			
			System.out.println("=======step3==newIssue.getProjectName=========="+newIssue.getProjectId().getName());
			System.out.println("=======step3==newIssue.getIssueTypeName=========="+newIssue.getIssueTypeId().getName());
			
            //通过issueKey获得另一个issue对象moveIssue 
			IssueBO issueBo = new IssueBO();
			Issuehb oldIssue = issueBo.getIssueByKey(newIssue.getIssueKey());
            
			//获得project对象
			ProjectBO projectBo = new ProjectBO();
			Project project = oldIssue.getProjectId();  //xxx

			//获得IssueType对象
			IssueTypeBO issueTypeBo = new IssueTypeBO();
			IssueType issueType = oldIssue.getIssueTypeId();
			
			
		%>
		<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<tbody>
			<tr>
				<td bgcolor="#f0f0f0" width="200" valign="top">
					<table cellspacing="0" cellpadding="3" border="0" width="100%">
						<tbody>
							<tr>
								<td bgcolor="#dddddd">
									<b>移动问题: TT-1</b>
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
													<a href="MoveIssue!default.jsp?issueKey=<%=newIssue.getIssueKey()%>"
				                                        id="move_issue" onclick='window.history.back();'>选择项目和问题类型</a>
												</td>
											</tr>
											<tr>
												<td />
												<td />
												<td nowrap="">
													项目:
													<b><%=newIssue.getProjectId().getName() %></b>
												</td>
											</tr>
											<tr>
												<td />
												<td />
												<td nowrap="">
													问题类型:
													<b><%=newIssue.getIssueTypeId().getName() %></b>
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
													<b><%=newIssue.getIssueStatusName() %></b>
												</td>
											</tr>
											<tr>
												<td>
													<img alt="" src="<%=request.getContextPath() %>/images/icons/bullet_done.gif" />
												</td>
												<td width="1%">
													3.
												</td>
												<td>
													<a href="#" onclick='window.history.back();'>更新字段</a>
												</td>
											</tr>
											<tr>
												<td>
													<img alt="" src="<%=request.getContextPath() %>/images/icons/bullet_inprogress.gif" />
												</td>
												<td width="1%">
													<b>4.</b>
												</td>
												<td>
													<b>确认</b>
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
										name="simpleform" method="post" action="MoveIssueConfirm.jsp">
										<table class="simpleform maxWidth">
											<tbody>
												<tr>
													<td class="simpleformheader" colspan="2">
														<h3 class="formtitle">
															移动问题: 确认
														</h3>
													</td>
												</tr>
												<tr>
													<td class="simpleformheader" colspan="2">
														<b>步骤4(共4)</b> : 确认你填写的内容正确,然后移动.
													</td>
												</tr>
												<tr>
													<td bgcolor="#ffffff" colspan="2">
														<br />
														<table id="move_confirm_table" class="gridTabBox"
															cellspacing="1" cellpadding="3" align="center"
															width="95%">
															<tbody>
																<tr>
																	<td bgcolor="#dddddd" width="20%">
																		<b> </b>
																	</td>
																	<td bgcolor="#dddddd" width="40%">
																		<b>原值 (移动前)</b>
																	</td>
																	<td bgcolor="#dddddd" width="40%">
																		<b>新值 (移动后)</b>
																	</td>
																</tr>
																<tr>
																	<td bgcolor="#f0f0f0" width="20%" valign="top">
																		<b>项目</b>
																	</td>
																	<td bgcolor="#ffffff" width="40%" valign="top">
																		<span class="red-highlight"><%=project.getName() %></span>
																	</td>
																	<td bgcolor="#ffffff" width="40%" valign="top">
																		<span class="green-highlight"><%=newIssue.getProjectId().getName() %></span>
																	</td>
																</tr>
																<tr>
																	<td bgcolor="#f0f0f0" width="20%" valign="top">
																		<b>类型</b>
																	</td>
																	<td bgcolor="#ffffff" width="40%" valign="top">
																		<%=issueType.getName() %>
																	</td>
																	<td bgcolor="#ffffff" width="40%" valign="top">
																		<%=newIssue.getIssueTypeId().getName() %>
																	</td>
																</tr>
															</tbody>
														</table>
														<input id="confirm" type="hidden" value="true"
															name="confirm" />
														<input id="id" type="hidden" value="10000" name="id" />
													</td>
												</tr>
												<tr>
													<td class="fullyCentered simpleformfooter" colspan="2">
														<input id="移动" class="spaced" type="submit"
															title="按 Alt+S 提交" accesskey="S" value="移动" name="移动" />
														<input id="cancelButton" type="button"
															onclick="location.href='<c:url value="/jsp/frontend/issue/issueDetailLayout.jsp"/>?issueKey=<%=newIssue.getIssueKey() %>'" value="取消"
															name="/browse/TT-1" title="取消 (Alt + `)" accesskey="`" />
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
	</body>
</html>
