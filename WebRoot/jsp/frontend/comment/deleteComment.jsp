<%-- 
	描述：判断是否要删除备注
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<html>
<body>
    <%
        String commentId = request.getParameter("commentId");
        String issueRCKey = request.getParameter("issueRCKey");
        if (StringUtils.isBlank(commentId)) {
            return;
        }
        if (StringUtils.isBlank(issueRCKey)) {
            return;
        }
        int id = Integer.parseInt(commentId);
        CommentBO commentBO = new CommentBO();
        Commenthbm comment = new commentBO().getComment(id);
    %>
    <style>
td#TopMenu {
    height: 20px;
    background-color: #f0f0f0;
}
</style>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tbody>
            <tr>
                <td bgcolor="#f0f0f0" width="200" valign="top">
                    <table cellspacing="0" cellpadding="3" border="0" width="200">
                        <tbody>
                            <tr>
                                <td bgcolor="#dddddd">
                                    <b>备注详情</b>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <img height="1" border="0" width="200" alt="" src="<%=request.getContextPath()%>/images/icons/bluepixel.gif" />
                    <br />
                    <table cellspacing="0" cellpadding="3" border="0">
                        <tbody>
                            <tr>
                                <td nowrap="" width="1%" valign="top">
                                    <b>作者:</b>
                                </td>
                                <td width="100%" valign="top">
                                    <a href="/secure/ViewProfile.jspa?name=<%=comment.getAuthor()%>"><%=comment.getAuthor()%></a>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap="" valign="top">
                                    <b>创建:</b>
                                </td>
                                <td valign="top">
                                    <%=comment.getCreateDate()%>
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
                                    <form onsubmit="if (this.submitted) return false; this.submitted = true; return true" name="simpleform" method="post" action="doDeleteComment.jsp">
                                        <table class="simpleform maxWidth" style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
                                            <tbody>
                                                <tr>
                                                    <td class="simpleformheader" colspan="2" id="TopMenu">
                                                        <h3 class="formtitle">删除备注</h3>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="simpleformheader" colspan="2" id="TopMenu">
                                                        <p>你确定要删除这个备注吗?</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#ffffff" colspan="2">
                                                        <input type="hidden" name="commentId" value="<%=id%>" />
                                                        <input type="hidden" name="issueRCKey" value="<%=issueRCKey%>" />
                                                        <div class="action-box">
                                                            <%=comment.getCommentContent()%>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="fullyCentered simpleformfooter" colspan="2">
                                                        <input id="删除" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="删除" name="删除" />
                                                        <input id="cancelButton" type="button" onclick="window.history.back();" value="取消" name="/browse/DFD-6" title="取消 (Alt + `)" accesskey="`" />
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