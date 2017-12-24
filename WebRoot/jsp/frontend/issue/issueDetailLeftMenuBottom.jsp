<%-- 
    Document   : 问题详情中左侧的导航底部(操作)
    Created on : 2008-12-24
    Author     : Kris
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="java.util.*"%>
<script>
    function showOrHiddenBox() {
        var selfNode = document.getElementById("lhscalinner_my");
        if (selfNode.style.display == 'none') {
            selfNode.style.display = 'block';
            document.getElementById("clst_my").className = 'calHeader normalText goog-zippy-expanded';
        } else if (selfNode.style.display == 'block') {
            selfNode.style.display = 'none';
            document.getElementById("clst_my").className = 'calHeader normalText goog-zippy-collapsed';
        }
    }
</script>
<%
    //由于在其他页面也需要issue信息，所以把issue信息保存在request中，供所有页面使用
    String path = request.getContextPath();
    String action = request.getParameter("action");
    if (StringUtils.isNotBlank(action)) {
        session.setAttribute("action", action);
    }

    Issue issueLCMB = (Issue) request.getAttribute("issue");
    if (issueLCMB == null) {
        
        return;
    }
    User currentUser = (User) session.getAttribute(Global.SESSION_USER);
%>
<table border="0">
    <tr>
        <td>
            <%
                if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.ASSIGN_ISSUES)) {
            %>
            <img height="8" border="0" align="absmiddle" width="8" src="<%=path%>/images/icons/bullet_creme.gif" />
            <b>
                <a rel="lazyLink" href="<%=path%>/jsp/frontend/issue/assignee.jsp?issueId=<%=issueLCMB.getId()%>">分配</a>
            </b>
            问题
            <%
                }
            %>
        </td>
    </tr>
    <tr>
        <td>
            <%
                if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.EDIT_ISSUES)) {
            %>
            <img height="8" border="0" align="absmiddle" width="8" src="<%=path%>/images/icons/bullet_creme.gif" />
            <strong>
                <a href="cloneIssueDetails!default.jsp?issueKey=<%=issueLCMB.getIssueKey()%>" id="clone_issue">复制</a>
            </strong>
            问题
            <%
                }
            %>
        </td>
    </tr>
    <tr>
        <td>
            <%
                if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.ADD_COMMENTS)) {
            %>
            <img height="8" border="0" align="absmiddle" width="8" src="<%=path%>/images/icons/bullet_creme.gif" />
            <strong>
                <!--  <a
				onclick="try {return showComment();}catch(e){return true;};"
				href="/secure/AddComment!default.jspa?id=10008" id="comment_issue">写备注</a> 
				-->
                <a href="#" onclick="showOrHiddenBox();">写备注</a>
            </strong>
            <a href="/secure/AddComment!default.jspa?id=10008" onclick="try {return showComment();}catch(e){return true;};" accesskey="m" />
            <%
                }
            %>
        </td>
    </tr>
    <tr>
        <td>
            <%
                if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.DELETE_ALL_COMMENTS)
                        || currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.DELETE_OWN_COMMENTS)) {
            %>
            <img height="8" border="0" align="absmiddle" width="8" src="<%=path%>/images/icons/bullet_creme.gif" />
            <strong>
                <a href="<%=path%>/jsp/frontend/issue/deleteIssue.jsp?issueId=<%=issueLCMB.getId()%>">删除</a>
            </strong>
            问题
            <%
                }
            %>
        </td>
    </tr>
    <tr>
        <td>
            <%
                if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.EDIT_ISSUES)) {
            %>
            <img height="8" border="0" align="absmiddle" width="8" src="<%=path%>/images/icons/bullet_creme.gif" />
            <strong>
                <a rel="lazyLink" href="updateIssue.jsp?issueKey=<%=issueLCMB.getIssueKey()%>">编辑</a>
            </strong>
            问题
            <%
                }
            %>
        </td>
    </tr>
    <tr>
        <td>
            <%
                if (currentUser.validate(issueLCMB.getProjectId(), PermissionConstants.MOVE_ISSUES)) {
            %>
            <img height="8" border="0" align="absmiddle" width="8" src="<%=path%>/images/icons/bullet_creme.gif" />
            <strong>
                <a href="MoveIssue!default.jsp?issueKey=<%=issueLCMB.getIssueKey()%>" id="move_issue">移动</a>
            </strong>
            问题
            <%
                }
            %>
        </td>
    </tr>
</table>