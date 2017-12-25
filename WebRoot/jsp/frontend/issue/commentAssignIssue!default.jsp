<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    String issueKey = request.getParameter("issueKey");
			IssueBO ib = new IssueBO();
			Issue issue = ib.getIssueDetailByKey(issueKey);
			String status = request.getParameter("status");
			User user = (User) session.getAttribute(Global.SESSION_USER);
%>
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
                                <table id="issuedetails" cellspacing="0" cellpadding="3" border="0">
                                    <tbody>
                                        <tr>
                                            <td valign="top">
                                                <b>Key:</b>
                                            </td>
                                            <td valign="top">
                                                <b>
                                                    <a id="issue_key_SMS-2" href="issueDetailLayout.jsp?issueKey=<%=issue.getIssueKey()%>&action=forMe"><%=issue.getIssueKey()%></a>
                                                </b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <b>类型:</b>
                                            </td>
                                            <td valign="top">
                                                <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%><%=issue.getIssueTypeIcon()%>" /><%=issue.getIssueTypeName()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <b>状态:</b>
                                            </td>
                                            <td valign="top">
                                                <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%><%=issue.getIssueStatusIcon()%>" />
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
                                                <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%><%=issue.getPriorityLevelIcon()%>" />
                                                <%=issue.getPriorityLevel()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <b>开发者:</b>
                                            </td>
                                            <td valign="top">
                                                <a href="/secure/ViewProfile.jspa?name=zhang"><%=issue.getAssignee()%></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
                                                <b>报告人:</b>
                                            </td>
                                            <td valign="top">
                                                <a href="/secure/ViewProfile.jspa?name=kris"><%=issue.getReporter()%></a>
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
                <table border="0" width=100%>
                    <tr>
                        <td valign="top">
                            <div id="issueContent" style="padding: 0px 10px;">
                                <form action="commentAssignIssue.jsp">
                                    <table class="simpleform maxWidth">
                                        <tbody>
                                            <tr>
                                                <td class="simpleformheader" colspan="2">
                                                    <h3 class="formtitle">
                                                        <%
                                                            if (status.equals("close")) {
                                                        				out.println("关闭问题");
                                                        			}
                                                        			if (status.equals("resolved")) {
                                                        				out.println("解决问题");
                                                        			}
                                                        			if (status.equals("reopen")) {
                                                        				out.println("恢复开启问题");
                                                        			}
                                                        %>
                                                    </h3>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="simpleformheader" colspan="2">关闭问题表示此问题没有其他的工作要做了,而且已经验证完成了.</td>
                                            </tr>
                                            <tr id="resolutionFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea">
                                                    <label for="resolution">
                                                        <span class="required" title="斜体字是必填的">
                                                            <sup> * </sup>
                                                            解决:
                                                        </span>
                                                    </label>
                                                </td>
                                                <td class="fieldValueArea">
                                                    <select id="newId_select" name="newId">
                                                        <%
                                                            ResolutionBO rb = new ResolutionBO();
                                                        			List resolutionList = rb.getAllResolutions();
                                                        			for (int i = 0; i < resolutionList.size(); i++) {
                                                        				Resolution resolution1 = (Resolution) resolutionList.get(i);
                                                        %>
                                                        <option value=<%=resolution1.getId()%>><%=resolution1.getName()%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr id="resolutionFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea"></td>
                                                <td class="fieldValueArea"></td>
                                            </tr>
                                            <tr id="fixVersionsFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea">
                                                    <label for="fixVersions"> 修复版本: </label>
                                                </td>
                                                <td class="fieldValueArea">未知</td>
                                            </tr>
                                            <tr id="assigneeFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea">
                                                    <label for="assignee"> 开发者: </label>
                                                </td>
                                                <td class="fieldValueArea">
                                                    <script type="text/javascript">
                                                                                                                                                                                                                    function sendTo(
                                                                                                                                                                                                                            name) {
                                                                                                                                                                                                                        //alert(name);
                                                                                                                                                                                                                        document
                                                                                                                                                                                                                                .getElementById("assignee").value = name;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                </script>

                                                    <select id="assignee" name="assignee">
                                                        <option value="-1">
															-自动-
														</option>
                                                        <option value=<%=user.getId()%>><%=user.getName()%></option>
                                                        <optgroup label="---------------">
                                                            <%
                                                                ProjectUserBO pub = new ProjectUserBO();

                                                                UserBO ub = new UserBO();
                                                                List userList = pub.getProjectUserByProjectId(issue.getProjectId());

                                                                for (int j = 0; j < userList.size(); j++) {
                                                                    ProjectUser projectUser = (ProjectUser) userList.get(j);
                                                                    Userhbm puser = ub.getUser(projectUser.getUserId());
                                                                    if (puser.getName().equals(issue.getAssignee())) {
                                                                        out.println("<option selected value=" + puser.getId() + ">");
                                                                        out.println(puser.getName());
                                                                        out.println("</option>");
                                                                    } else {
                                                                        out.println("<option value=" + puser.getId() + ">");
                                                                        out.println(puser.getName());
                                                                        out.println("</option>");
                                                                    }
                                                                }
                                                            %>
                                                        </optgroup>
                                                    </select>
                                                    <a href="javascript:sendTo('<%=user.getId()%>');">分配给我</a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#ffffff" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#f0f0f0" colspan="2">
                                                    <b>备注</b>
                                                    : (可以用一个备注来描述这个更新)
                                                </td>
                                            </tr>
                                            <tr id="commentFieldArea" class="fieldArea">
                                                <td class="fieldLabelArea">
                                                    <label for="comment"> 备注: </label>
                                                </td>
                                                <td class="fieldValueArea">
                                                    <textarea id="comment" class="textarea" cols="10" rows="15" name="comment"></textarea>
                                                </td>
                                            </tr>
                                            <tr class="hidden">
                                                <td>
                                                    <%
                                                        if (status.equals("close")) {
                                                            out.println("<input type=hidden value=close name=status />");
                                                        }
                                                        if (status.equals("resolved")) {
                                                            out.println("<input type=hidden value=resolved name=status />");
                                                        }
                                                        if (status.equals("reopen")) {
                                                            out.println("<input type=hidden value=reopen name=status />");
                                                        }
                                                    %>
                                                    <input id="id" type="hidden" value="<%=issue.getId()%>" name="id" />
                                                    <input id="id" type="hidden" value="<%=issue.getIssueKey()%>" name="issueKey" />
                                                    <input id="id" type="hidden" value="forMe" name="action" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fullyCentered simpleformfooter" colspan="2">
                                                    <%
                                                        if (status.equals("close")) {
                                                            out.println("<input type=submit value=关闭问题 name=status />");
                                                        }
                                                        if (status.equals("resolved")) {
                                                            out.println("<input type=submit value=解决 name=status />");
                                                        }
                                                        if (status.equals("reopen")) {
                                                            out.println("<input type=submit value=恢复开启问题 name=status />");
                                                        }
                                                    %>
                                                    <input id="cancelButton" type="button" onclick="window.history.back();" value="取消" name="/browse/SMS-2" title="取消 (Alt + `)" accesskey="`" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </tbody>
</table>