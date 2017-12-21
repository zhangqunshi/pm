<%-- 
	描述： 编辑问题
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
<head>
<script>
    function openWindow(element) {
        var vWinUsers = window
                .open(
                        '<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element='
                                + element, 'UserPicker',
                        'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
        vWinUsers.opener = self;
        vWinUsers.focus();
    }
</script>
<script src="<%=request.getContextPath()%>/includes/js/calendar/calendar-min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/includes/js/calendar/calendar-setup-min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/includes/js/calendar/calendar-zh.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/includes/js/calendar/skins/aqua/calendar.css" media="all" rel="styleSheet" type="text/css" />

</head>
<%
    //用问题ID获得Issue对象 

			String issueKey = request.getParameter("issueKey");

			if (StringUtils.isBlank(issueKey)) {

				out.println("<body>The issue key is null</body>");
				return;
			}
			Issue issue = new IssueBO().getIssueDetailByKey(issueKey); //得到问题对象
			request.setAttribute("issue", issue);
			//String issueKey = request.getParameter("issueKey");
			//Issue issue = new IssueBO().getIssueByKey(issueKey);
			//用问题ID获得Project对象  
			Projecthbm project = new ProjectBO().getProject(issue.getProjectId());
			List<IssuePriorityhbm> issuePriorityList = new IssuePriorityBO().getIssuePriorityList();

			//用问题ID获得ProjectComponent对象 
			ProjectComponentBO projectComponentBO = new ProjectComponentBO();
			List projectComponentList = projectComponentBO.getProjectComponentList(issue.getProjectId());
			//用问题ID获得User对象 
			Userhbm user = new UserBO().getUser(issue.getReporterId());

			//获得projectUser类集合List
			ProjectUserBO projectUserBO = new ProjectUserBO();
			List projectUserList = projectUserBO.getProjectUser();
			//获得IIssueType的List    
			List<IssueTypehbm> issueTypeList = new IssueTypeBO().getIssueTypeList();

			String errMsg = (String) request.getAttribute("errMsg");
			if (errMsg == null || errMsg.equals("")) {
				errMsg = "";
			}
			//out.println("<font color='red'>"+errMsg+"</font>");
%>

<body>
    <table>
        <tr>
            <td>
            <td bgcolor="#f0f0f0" width="200" valign="top">
                <table cellspacing="0" cellpadding="0" border="0" width="200">
                    <tbody>
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="3" border="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td bgcolor="#dddddd">
                                                <span style="float: left;">
                                                    <b>问题详情</b>
                                                </span>
                                                <span class="small" style="float: right;"> </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <img height="1" border="0" width="100%" alt="" src="<%=request.getContextPath()%>/images/icons/bluepixel.gif" />
                                <br />
                                <table border="0">
                                    <tr>
                                        <td valign="top">
                                            <b>Key:</b>
                                        </td>
                                        <td valign="top">
                                            <b>
                                                <a href="#" id="issue_key_TT-9"><%=issue.getIssueKey()%></a>
                                            </b>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td valign="top">
                                            <b>类型:</b>
                                        </td>
                                        <td valign="top">
                                            <img height="16" border="0" align="absmiddle" width="16" title="Task - A task that needs to be done." alt="Task" src="<%=request.getContextPath()%><%=issue.getIssueTypeIcon()%>" />
                                            <%=issue.getIssueTypeName()%>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td valign="top">
                                            <b>状态:</b>
                                        </td>
                                        <td valign="top">
                                            <img height="16" border="0" align="absmiddle" width="16" title="In Progress - This issue is being actively worked on at the moment by the assignee." alt="In Progress" src="<%=request.getContextPath()%><%=issue.getIssueStatusIcon()%>" />
                                            <%=issue.getIssueStatusName()%>
                                        </td>
                                    </tr>
                                    <%
                                        if (issue.getIssueStatus() == Global.CLOSE || issue.getIssueStatus() == Global.RESOLVED) {
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
                                            <img height="16" border="0" align="absmiddle" width="16" title="Major - Major loss of function." alt="Major" src="<%=request.getContextPath()%><%=issue.getPriorityLevelIcon()%>" />
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
                <table bgcolor="#ffffff" valign="top" width="100%">
                    <tr>
                        <td>
                            <div align="left">
                                <p>
                                    <font color="red"><%=errMsg%></font>
                                </p>
                            </div>
                            <form action="doUpdateIssue.jsp">
                                <table border="0" align="left" width="100%" style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
                                    <tr>
                                        <td colspan="2" bgcolor="#f0f0f0">
                                            <h3 class="formtitle">编辑问题</h3>
                                            <br>
                                            使用这个表单修改问题. 修改的同时你也可以增加一个备注说明你的修改.
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right">概要：</td>
                                        <td>
                                            <input type="text" name="name" size="30" value="<%=issue.getName()%>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">问题类型:</td>
                                        <td>
                                            <select name="issueTypeId">
                                                <%
                                                    for (int i = 0; i < issueTypeList.size(); i++) {
                                                				IssueTypehbm issueType = issueTypeList.get(i);
                                                				if (issue.getIssueTypeId() == issueType.getId()) {
                                                					out.println("<option selected value='" + issue.getIssueTypeId() + "'>" + issueType.getName()
                                                							+ "</option selected>");
                                                				} else {
                                                					out.println("<option  value='" + issue.getIssueTypeId() + "'>" + issueType.getName() + "</option>");
                                                				}
                                                			}
                                                			out.println("</select>");
                                                %>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">优先级:</td>
                                        <td>
                                            <select name="priorityLevelId">
                                                <%
                                                    for (int i = 0; i < issuePriorityList.size(); i++) {
                                                				IssuePriorityhbm issuePriority = issuePriorityList.get(i);
                                                				if (issuePriority.getId() == issue.getPriorityLevelId()) {
                                                					out.println("<option selected value='" + issuePriority.getId() + "'>" + issuePriority.getName()
                                                							+ "</option selected>");
                                                				} else {
                                                					out.println(
                                                							"<option  value='" + issuePriority.getId() + "'>" + issuePriority.getName() + "</option>");
                                                				}
                                                			}
                                                			out.println("</select>");
                                                %>
                                            
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right">计划结束日期：</td>
                                        <td>
                                            <input type="text" name="planEndTime" id="planEndTime" size="20" value="<%=issue.getPlanEndTime()%>" />
                                            <img height="16" border="0" width="16" title="选择日期" alt="选择日期" src="<c:url value='/images/icons/cal.gif'/>" id="duedate_trigger_c" />

                                            <script type="text/javascript">
                                                                                                                                                                                    Calendar
                                                                                                                                                                                            .setup({
                                                                                                                                                                                                firstDay : 0, // first day of the week
                                                                                                                                                                                                inputField : "planEndTime", // id of the input field
                                                                                                                                                                                                button : "duedate_trigger_c", // trigger for the calendar (button ID)
                                                                                                                                                                                                align : "Tl", // alignment (defaults to "Bl")
                                                                                                                                                                                                singleClick : true,
                                                                                                                                                                                                ifFormat : "%Y-%m-%e" // our date only format
                                                                                                                                                                                            });
                                                                                                                                                                                </script>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right">模块:</td>
                                        <td>
                                            <%
                                                if (projectComponentList.size() == 0 || projectComponentList == null) {
                                                    out.println("末知");
                                                } else {
                                                    out.println("<select name='priorityLevelId'");
                                                    for (int i = 0; i < projectComponentList.size(); i++) {
                                                        ProjectComponent projectComponent = (ProjectComponent) projectComponentList.get(i);
                                                        if (projectComponent.getId() == issue.getComponentId()) {
                                                            out.println("<option selected value='" + projectComponent.getId() + "'>"
                                                                    + projectComponent.getName() + "</option selected>");
                                                        } else {
                                                            out.println("<option  value='" + projectComponent.getId() + "'>" + projectComponent.getName()
                                                                    + "</option>");
                                                        }
                                                    }
                                                    out.println("</select>");
                                                }
                                            %>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td align="right">影响版本:</td>
                                        <td>例如操作系统，软件环境或者相关硬件</td>
                                    </tr>
                                    <tr>
                                        <td align="right">开发者：</td>
                                        <td>
                                            <%
                                                out.println("<select name='developerId'");
                                                for (int i = 0; i < projectUserList.size(); i++) {
                                                    ProjectUser projectUser = (ProjectUser) projectUserList.get(i);
                                                    Userhbm user2 = new UserBO().getUser(projectUser.getUserId());

                                                    if (projectUser.getUserId() == issue.getAssigneeId()) {
                                                        out.println("<option selected value='" + projectUser.getUserId() + "'>" + user2.getName()
                                                                + "</option selected>");
                                                    } else {
                                                        out.println("<option  value='" + projectUser.getUserId() + "'>" + user2.getName() + "</option>");
                                                    }
                                                }
                                                out.println("</select>");
                                            %>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right">报告人：</td>
                                        <td>
                                            <input type="text" name="reporter" size="20" value="<%=user.getName()%>" / readonly="true">
                                            <a href="javascript:openWindow('reporter');">
                                                <img hspace="0" height="16" border="0" width="16" style="vertical-align: top;" src="<c:url value='/images/icons/filter_public.gif'/>" name="assigneeImage" alt="选择一个用户" title="选择一个用户">
                                            </a>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" valign="top">环境：</td>
                                        <td>
                                            <textarea name="environment" rows="3" cols="80"><%=issue.getEnvironment()%></textarea>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" valign="top">描述：</td>
                                        <td>
                                            <textarea name="description" rows="8" cols="80"><%=issue.getDescription()%></textarea>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="right" valign="top">备注 :</td>
                                        <td>
                                            <textarea rows="10" name="changelog"></textarea>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td>
                                            <input type="hidden" name="id" value="<%=issue.getId()%>" />
                                            <input type="hidden" name="issueKey" value="<%=issueKey%>" />
                                        </td>
                                        <td></td> 
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="submit" value="提交" />
                                            <input type='button' value='取消' onclick="location.href='<c:url value="/jsp/frontend/issue/issueDetailLayout.jsp"/>?issueKey=<%=issueKey%>'" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>