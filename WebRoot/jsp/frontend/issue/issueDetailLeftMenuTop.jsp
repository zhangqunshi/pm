<%-- 
    Document   : 问题详情中左侧的导航顶部 (问题详情)
    Created on : 2008-12-24
    Author     : Kris
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
    //由于在其他页面也需要issue信息，所以把issue信息保存在request中，供所有页面使用
    Issue issueLT = (Issue) request.getAttribute("issue");
    UserBO ubo = new UserBO();
    Userhbm user = ubo.getUser("username");
    if (issueLT == null) {
        out.println("问题信息为null");
        return;
    }
%>
<table border="0">
    <tr>
        <td valign="top">
            <b>Key:</b>
        </td>
        <td valign="top">
            <b>
                <a href="#" id="issue_key_TT-9"><%=issueLT.getIssueKey()%></a>
            </b>
        </td>
    </tr>

    <tr>
        <td valign="top">
            <b>类型:</b>
        </td>
        <td valign="top">
            <img height="16" border="0" align="absmiddle" width="16" title="<%=issueLT.getIssueTypeName()%>" alt="<%=issueLT.getIssueTypeName()%>" src="<%=request.getContextPath()%><%=issueLT.getIssueTypeIcon()%>" />
            <%=issueLT.getIssueTypeName()%>
        </td>
    </tr>

    <tr>
        <td valign="top">
            <b>状态:</b>
        </td>
        <td valign="top">
            <img height="16" border="0" align="absmiddle" width="16" title="<%=issueLT.getIssueStatusName()%>" alt="<%=issueLT.getIssueStatusName()%>" src="<%=request.getContextPath()%><%=issueLT.getIssueStatusIcon()%>" />
            <%=issueLT.getIssueStatusName()%>
        </td>
    </tr>
    <%
        if (issueLT.getIssueStatus() == Global.CLOSE || issueLT.getIssueStatus() == Global.RESOLVED) {
    %>
    <tr>
        <td valign="top">
            <b>解决:</b>
        </td>
        <td valign="top">

            <%=issueLT.getResolution()%>
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
            <img height="16" border="0" align="absmiddle" width="16" title="<%=issueLT.getPriorityLevel()%>" alt="<%=issueLT.getPriorityLevel()%>" src="<%=request.getContextPath()%><%=issueLT.getPriorityLevelIcon()%>" />
            <%=issueLT.getPriorityLevel()%>
        </td>
    </tr>


    <tr>
        <td valign="top">
            <b>开发者:</b>
        </td>
        <td valign="top">
            <a href="userDeploy.jsp?name=<%=issueLT.getAssignee()%>"><%=issueLT.getAssignee()%></a>
        </td>
    </tr>

    <tr>
        <td valign="top">
            <b>报告人:</b>
        </td>
        <td valign="top">
            <a href="userDeploy.jsp?name=<%=issueLT.getReporter()%>"><%=issueLT.getReporter()%></a>
        </td>
    </tr>
</table>