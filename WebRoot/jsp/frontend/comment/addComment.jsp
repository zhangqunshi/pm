<%-- 
	描述： 新建备注表单
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    String issueKeyCommnt = request.getParameter("issueKey");
    String commentStr = request.getParameter("comment");

    if (StringUtils.isBlank(issueKeyCommnt)) {
        System.out.println("The issue key is null");
        return;
    }
    if (StringUtils.isBlank(commentStr)) {
        commentStr = "";
    }

    Issue issueRB = new IssueBO().getIssueDetailByKey(issueKeyCommnt);

    out.println("<font color='red'>" + commentStr + "</font>");
%>
<form action="<%=request.getContextPath()%>/jsp/frontend/comment/doAddComment.jsp" method="post" name="form1">
    <input type="hidden" name="issueId" value="<%=issueRB.getId()%>" />
    <input type="hidden" name="issueKey" value="<%=issueRB.getIssueKey()%>" />
    <%
        User curUser = (User) session.getAttribute(Global.SESSION_USER);
        int projectId = issueRB.getProjectId();
        if (curUser.validate(projectId, PermissionConstants.ADD_COMMENTS)) {
    %>
    <table border="0" width="100%">
        <tr>
            <td colspan="2">
                <h3>增加备注</h3>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" width="50">备注:</td>
            <td>
                <textarea name="commentContent" rows="5" cols="60"></textarea>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="增加" />
                <input type="button" value="取消" onclick="location.href='<c:url value="/jsp/frontend/issue/issueDetailLayout.jsp"/>?issueKey=<%=issueKeyCommnt%>'" />
            </td>
        </tr>
    </table>
    <%
        }
    %>
</form>
