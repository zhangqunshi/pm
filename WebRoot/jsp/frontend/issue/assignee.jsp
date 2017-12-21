<%-- 
	描述： 分配问题
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
<head>

</head>
<%
    User user = (User) session.getAttribute(Global.SESSION_USER);
			String issueIdStr = request.getParameter("issueId");
			String error = request.getParameter("error");

			int issueId = 0;
			if (StringUtils.isBlank(issueIdStr)) {
				return;
			}
			if (StringUtils.isBlank(error)) {
				error = "";
			}

			issueId = Integer.parseInt(issueIdStr);
			Issue issue = new IssueBO().getIssueDetail(issueId);
			int projectId = issue.getProjectId();
			ProjectUserBO projectUserBO = new ProjectUserBO();
			List<ProjectUser> projectUsers = projectUserBO.getProjectUserByProjectId(projectId);
%>
<body>

    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tbody>
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
                <td bgcolor="#ffffff" valign="top">
                    <div id="issueContent" style="padding: 10px;">
                        <form onsubmit="if (this.submitted) return false; this.submitted = true; return true" name="simpleform" method="post" action="doAssignee.jsp">
                            <table class="simpleform maxWidth" style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
                                <tbody>
                                    <tr>
                                        <td class="simpleformheader" colspan="2" bgcolor="#f0f0f0">
                                            <h3 class="formtitle">分配问题</h3>
                                            <br>
                                            利用这个表单你可以把此问题分配给另外的开发者.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td align="left">
                                            <%
                                                if (StringUtils.isNotBlank(error)) {
                                            				out.println("<font color='red'>问题已经分配给 <b>" + error + " (" + error + ")<b>.</font>");
                                            			}
                                            %>
                                        </td>
                                    </tr>
                                    <tr id="assigneeFieldArea" class="fieldArea">
                                        <td class="fieldLabelArea">

                                            <label for="assignee"> 开发者: </label>
                                        </td>
                                        <td class="fieldValueArea">
                                            <%
                                                if (projectUsers == null || projectUsers.size() == 0) {

                                            			} else {
                                            				out.println("<select name='assigneeId'>");
                                            				for (ProjectUser pUser : projectUsers) {
                                            					if (pUser.getUsername().equals(issue.getAssignee())) {
                                            						out.println("<option  selected value='" + pUser.getUserId() + "'>" + pUser.getUsername()
                                            								+ "</option>");
                                            					}
                                            					out.println("<option value='" + pUser.getUserId() + "'>" + pUser.getUsername() + "</option>");
                                            				}
                                            				out.println("</select>");
                                            			}
                                            %>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td bgcolor="#f0f0f0" colspan="2" width="100%">
                                            <b>备注</b>
                                            : (可以用一个备注来描述这个更新)
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" valign="top">
                                            <label> 备注: </label>
                                        </td>
                                        <td>
                                            <textarea name="content" rows="5" cols="60"></textarea>
                                        </td>
                                    </tr>

                                    <tr class="hidden">
                                        <td>
                                            <input type="hidden" value="<%=projectId%>" name="projectId" />
                                            <input type="hidden" value="<%=issueId%>" name="issueId" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="fullyCentered simpleformfooter" colspan="2">
                                            <input id="分配" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="分配" name="分配" />
                                            <input value="取消" type="button" onclick="location.href='<c:url value="/jsp/frontend/issue/issueDetailLayout.jsp"/>?issueKey=<%=issue.getIssueKey()%>'" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <script language="javascript">
                                                                                                    try {
                                                                                                        document.simpleform.elements[0]
                                                                                                                .focus();
                                                                                                    } catch (e) {
                                                                                                    }
                                                                                                </script>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
