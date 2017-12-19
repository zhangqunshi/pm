<%-- 
    Document   : 创建问题第2步骤
    Created on : 2008-12-24
    Author     : Kris
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.List" %>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>

<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%
	String projectIdStr = request.getParameter("projectId");
	String issueTypeIdStr = request.getParameter("issueTypeId");
	System.out.println("projectId=" + projectIdStr);
	System.out.println("issueTypeId=" + issueTypeIdStr);

	boolean hasError = false;
	String errMsg = "";
	if (StringUtils.isBlank(projectIdStr)) {
		hasError = true;
		errMsg += "Please choose a project!";
	}
	if (StringUtils.isBlank(issueTypeIdStr)) {
		hasError = true;
		errMsg += "Please choose a issue type!";
	}
	if (hasError) {
		request.setAttribute("error", errMsg);
%>
<jsp:forward page="addIssueStep1.jsp"></jsp:forward>
<%
	}

	int projectId = Integer.parseInt(projectIdStr);
	int issueTypeId = Integer.parseInt(issueTypeIdStr);

	//获得project信息
	ProjectBO projectBO = new ProjectBO();
	Project project = projectBO.getProject(projectId);

	//获得issueType信息
	IssueTypeBO issueTypeBO = new IssueTypeBO();
	IssueType issueType = issueTypeBO.getIssueType(issueTypeId);

	//获得issue优先级信息
	IssuePriorityBO issuePriorityBO = new IssuePriorityBO();
	List<IssuePriority> issuePriorityList = issuePriorityBO
			.getIssuePriorityList();

	//获得project模块信息
	ProjectComponentBO projectComponentBO = new ProjectComponentBO();
	List projectComponentList = projectComponentBO
			.getProjectComponentList(projectId);  

	//获得project成员信息
	ProjectUserBO projectUserBO = new ProjectUserBO();
	List<ProjectUser> projectUserList = projectUserBO
			.getProjectUserByProjectId(projectId);
%>
<html>
	<head>
		<title>Add Issue</title>
		<script
			src="<%=request.getContextPath()%>/includes/js/calendar/calendar-min.js"
			type="text/javascript"></script>
		<script
			src="<%=request.getContextPath()%>/includes/js/calendar/calendar-setup-min.js"
			type="text/javascript"></script>
		<script
			src="<%=request.getContextPath()%>/includes/js/calendar/calendar-zh.js"
			type="text/javascript"></script>
		<link
			href="<%=request.getContextPath()%>/includes/js/calendar/skins/aqua/calendar.css"
			media="all" rel="styleSheet" type="text/css" />
	</head>

	<body>
		<%@include file="/jsp/showErrorMessage.jsp"%>
		<form action="doAddIssue.jsp">
			<table border="0" width="80%">
				<tr>
					<td colspan="2">
						<h3>
							创建问题
						</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						步骤2（共2）：填写问题的详细信息
					</td>
				</tr>
				<tr>
					<td align="right">
						项目:
						<input type="hidden" name="projectId"
							value="<%=project.getProjectId()%>">
						<input type="hidden" name="projectkey"
							value="<%=project.getProjectKey()%>">
					</td>
					<td><%=project.getName()%></td>
				</tr>
				<tr>
					<td align="right">
						问题类型:
						<input type="hidden" name="issueTypeId"
							value="<%=issueType.getId()%>">
					</td>
					<td><%=issueType.getName()%></td>
				</tr>
				<tr>
					<td align="right">
						概要：
					</td>
					<td>
						<input type="text" name="summary" size="50" />
					</td>
				</tr>
				<tr>
					<td align="right">
						优先级:
					</td>
					<td>
						<select name="priorityLevelId">
							<%
								for (int i = 0; i < issuePriorityList.size(); i++) {
									IssuePriority issuePriority = (IssuePriority) issuePriorityList
											.get(i);
									if(issuePriority.getName().equals("Major")){
										out.println("<option selected value='"+issuePriority.getId()
										+"'>"+issuePriority.getName()+"</option selected>");
									}else{		
							           out.println("<option value='"+issuePriority.getId()+"'>"+issuePriority.getName()
							                       +"</option>");
							       }
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						逾期日期：
					</td>
					<td>
						<input type="text" id="planEndTime" name="planEndTime" size="20" />

						<img height="16" border="0" width="16" title="选择日期" alt="选择日期"
							src="<c:url value='/images/icons/cal.gif'/>"
							id="duedate_trigger_c" />

						<script type="text/javascript">
						    Calendar.setup({
						        firstDay    : 0,              // first day of the week
						        inputField  : "planEndTime",  // id of the input field
						        button      : "duedate_trigger_c", // trigger for the calendar (button ID)
						        align       : "Tl",           // alignment (defaults to "Bl")
						        singleClick : true,
						        ifFormat    : "%Y-%m-%e"      // our date only format
						    });
						</script>
					</td>

				</tr>
				<tr>
					<td align="right">
						模块：
					</td>
					<td>
						<%
							if (projectComponentList == null
									|| projectComponentList.size() <= 0) {
								out.println("未知");
							} else {
								out.println("<select name='componentId' size='5' />");
								for (int i = 0; i < projectComponentList.size(); i++) {
									ProjectComponent projectComponent = (ProjectComponent) projectComponentList
											.get(i);
						%>
						<option value="<%=projectComponent.getId()%>"><%=projectComponent.getName()%></option>
						<%
							}//endfor
								out.println("</select>");
							}//endif
						%>

					</td>
				</tr>
				<tr>
					<td align="right">
						开发者：
					</td>
					<td>
						<select name="developerId" />
							<%
								if (projectUserList != null) {
									System.out.println("projectUserList.size()="
											+ projectUserList.size());
									for (int i = 0; i < projectUserList.size(); i++) {
										ProjectUser projectUser = projectUserList.get(i);
							%>
							<option value="<%=projectUser.getUserId()%>"><%=projectUser.getUsername()%></option>
							<%
								}//endfor
								}//endif
							%>
						</select>
					</td>
				</tr>
				<script>
					function openWindow(element)
					{
		   				 var vWinUsers = window.open('<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element=' + element, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
		    			 vWinUsers.opener = self;
						 vWinUsers.focus();
					}
				</script>
				<tr>
					<td align="right">
						报告人：
					</td>
					<td>
						<input type="text" name="reporter" id="reporter"
							autocomplete="off" />

						<a href="javascript:openWindow('reporter');"> <img hspace="0"
								height="16" border="0" width="16" style="vertical-align: top;"
								src="<c:url value='/images/icons/filter_public.gif'/>"
								name="assigneeImage" alt="选择一个用户" title="选择一个用户"> </a>
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">
						环境：
					</td>
					<td>
						<textarea name="environment" rows="6" cols="100"></textarea>
						<br>
						例如操作系统，软件环境或者相关硬件
					</td>
				</tr>

				<tr>
					<td align="right" valign="top">
						描述：
					</td>
					<td>
						<textarea name="description" rows="12" cols="100"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="创建" />
						<input type="button"
							onclick="location.href='<c:url value="/jsp/frontend/dashboard.jsp"/>'"
							value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
			</table>
		</form>
	</body>
</html>