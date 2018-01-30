<%-- 
	描述： 移动问题第一步
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
<head>
</head>

<body>
    <%
        //获得参数 
        String moveIssueKey = request.getParameter("issueKey");
        String error = request.getParameter("error");

        //判断参数是否为空
        if (StringUtils.isBlank(moveIssueKey)) {
            return;
        }
        if (StringUtils.isBlank(error)) {
            error = "";
        }

        //通过issueKey获得issue对象 
        IssueBO issueBo = new IssueBO();
        Issue issueW = new Issue();
        Issuehbm issue = issueBo.getIssueByKey(moveIssueKey);

        //获得project对象和project对象集合projectList
        ProjectBO projectBo = new ProjectBO();
        //Project project = projectBo.getProject(issue.getProjectId());
        Projecthbm project = issue.getProject();
        List projectList = projectBo.getProjectList();

        //获得IssueType对象和IssueType集合issueTypeList
        IssueTypeBO issueTypeBo = new IssueTypeBO();
        IssueTypehbm issueType = issue.getIssueType();

        List issueTypeList = issueTypeBo.getIssueTypeList();

        //获得projectCategory对象
        IssueStatusBO issueStatusBo = new IssueStatusBO();
        IssueStatushbm issueStatus = issue.getIssueStatus();

        issue.setIssueStatusName(issueStatus.getName());
    %>
    <form action="MoveIssueUpdateFields!default.jsp">
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
                        <img height="1" border="0" width="100%" alt="" src="<%=request.getContextPath()%>/images/icons/bluepixel.gif" />

                        <table cellpadding="5" border="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <table border="0">
                                            <tbody>
                                                <tr>
                                                    <td valign="top">
                                                        <img alt="" src="<%=request.getContextPath()%>/images/icons/bullet_inprogress.gif" />
                                                    </td>
                                                    <td width="1%">
                                                        <b>1.</b>
                                                    </td>
                                                    <td nowrap="">
                                                        <b> 选择项目和问题类型 </b>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img alt="" src="<%=request.getContextPath()%>/images/icons/bullet_notdone.gif" />
                                                    </td>
                                                    <td width="1%">2.</td>
                                                    <td>选择新的状态</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img alt="" src="<%=request.getContextPath()%>/images/icons/bullet_notdone.gif" />
                                                    </td>
                                                    <td width="1%">3.</td>
                                                    <td>更新字段</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img alt="" src="<%=request.getContextPath()%>/images/icons/bullet_notdone.gif" />
                                                    </td>
                                                    <td width="1%">4.</td>
                                                    <td>确认</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <p></p>
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
                                        <form onsubmit="if (this.submitted) return false; this.submitted = true; return true" name="simpleform" method="post" action="MoveIssue.jspa">
                                            <table class="simpleform maxWidth" border="0" style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
                                                <tbody>
                                                    <tr>
                                                        <td class="simpleformheader" colspan="2" bgcolor="#f0f0f0">
                                                            <h3 class="formtitle">移动问题: TT-1</h3>
                                                            <br>
                                                            <b>步骤1(共4)</b>
                                                            : 选择要移到的项目和问题类型 ...
                                                        </td>
                                                    </tr>
                                                    <tr bgcolor="#ffffff">
                                                        <td bgcolor="#ffffff" align="left" colspan="5">
                                                            <font color="red">
                                                                <b><%=error%></b>
                                                                <font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#ffffff" align="center">
                                                            <table class="centred" align="absmiddle" width="75%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <div style="border: 1px solid rgb(187, 187, 187); padding: 2px;" width="80%">
                                                                                <table width="100%">
                                                                                    <tbody>

                                                                                        <tr bgcolor="#f0f0f0">
                                                                                            <td bgcolor="#f0f0f0" align="left" colspan="5">
                                                                                                <b>选择项目</b>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td nowrap="" align="absmiddle" width="20%">
                                                                                                <b>当前项目</b>
                                                                                                :
                                                                                            </td>
                                                                                            <td nowrap="" align="absmiddle">
                                                                                                <%=project.getName()%>
                                                                                            </td>
                                                                                            <td nowrap="" align="absmiddle">
                                                                                                <img height="16" border="0" align="absmiddle" width="16" src="<%=request.getContextPath()%>/images/icons/arrow_right_small.gif" />
                                                                                            </td>
                                                                                            <td nowrap="" align="absmiddle" width="20%">
                                                                                                <b>新项目</b>
                                                                                                :
                                                                                            </td>
                                                                                            <td id="project_container">
                                                                                                <select id="project" name="pid">
                                                                                                    <%
                                                                                                        for (int i = 0; i < projectList.size(); i++) {
                                                                                                            Project projectMove = (Project) projectList.get(i);
                                                                                                            if (project.getId() == projectMove.getProjectId()) {
                                                                                                                out.println("<option selected value=" + projectMove.getProjectId() + ">" + projectMove.getName()
                                                                                                                        + "</option selected>");
                                                                                                            } else {
                                                                                                                out.println(
                                                                                                                        "<option value=" + projectMove.getProjectId() + ">" + projectMove.getName() + "</option>");
                                                                                                            }
                                                                                                            // issue.setProjectId(projectMove.getProjectId());
                                                                                                            //  issue.setProjectName(projectMove.getName());
                                                                                                        }
                                                                                                    %>

                                                                                                </select>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                        </tr>
                                                                                        <tr bgcolor="#f0f0f0">
                                                                                            <td bgcolor="#f0f0f0" align="left" colspan="5">
                                                                                                <b>选择问题类型</b>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td nowrap="" align="absmiddle" width="20%">
                                                                                                <b>当前问题类型</b>
                                                                                                :
                                                                                            </td>
                                                                                            <td nowrap="" align="absmiddle">
                                                                                                <%=issueType.getName()%>
                                                                                            </td>
                                                                                            <td nowrap="" align="absmiddle">
                                                                                                <img height="16" border="0" align="absmiddle" width="16" src="<%=request.getContextPath()%>/images/icons/arrow_right_small.gif" />
                                                                                            </td>
                                                                                            <td nowrap="" align="absmiddle" width="20%">
                                                                                                <b>新问题类型</b>
                                                                                                :
                                                                                            </td>
                                                                                            <td id="issuetype_container">
                                                                                                <select id="issuetype" class="imagebacked" name="issuetype">
                                                                                                    <%
                                                                                                        for (int i = 0; i < issueTypeList.size(); i++) {
                                                                                                            IssueType issueTypeMove = (IssueType) issueTypeList.get(i);
                                                                                                            if (issueType.getId() == issueTypeMove.getId()) {
                                                                                                                out.println("<option selected value=" + issueTypeMove.getId() + ">" + issueTypeMove.getName()
                                                                                                                        + "</option selected>");
                                                                                                            } else {
                                                                                                                out.println("<option value=" + issueTypeMove.getId() + ">" + issueTypeMove.getName() + "</option>");
                                                                                                            }

                                                                                                        }
                                                                                                    %>
                                                                                                </select>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr class="hidden">
                                                                        <td>
                                                                            <input id="id" type="hidden" value="10000" name="id" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="fullyCentered simpleformfooter" colspan="2">
                                                                            <input class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="下一步 >>" name="下一步 >>" />
                                                                            <input type='button' value='取消' onclick="location.href='<c:url value="/jsp/frontend/issue/issueDetailLayout.jsp"/>?issueKey=<%=moveIssueKey%>'" />
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
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
            <%
                //request.setAttribute("moveIssue",issue);
                session.setAttribute("moveIssue", issue);
            %>
        </table>
    </form>


</body>
</html>
