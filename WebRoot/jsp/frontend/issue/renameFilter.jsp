<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page language="java" import="com.nastation.pm.util.*"%>
<%
    IssueFilter savedFilter = (IssueFilter) session.getAttribute(Global.SESSION_FILTER);
    if (savedFilter == null) {
        out.println("Cannot found a filter in the session");
        return;
    }
%>
<html>
<body>
    <table border="0" width=100%>
        <tr>
            <td valign="top" width=20%>
                <!-- 过滤导航条 -->
                <%@include file="/jsp/frontend/issue/searchIssueTopMenu.jsp"%>

                <%@include file="/jsp/frontend/issue/filterDetailLeftMenu.jsp"%>
            </td>

            <td width=80%>
                <form onsubmit="if (this.submitted) return false; this.submitted = true; return true" name="simpleform" method="post" action="doRenameFilter.jsp">
                    <table class="simpleform maxWidth" width=100%>
                        <tbody>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                    <h3 class="formtitle">保存当前的过滤器</h3>
                                </td>
                            </tr>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                                                               使用给定的名字和描述保存当前的过滤器.
                                    <p>如果你不确定你当前的过滤器是那个, 你可以通过左边的导航栏查看他的概要.</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                    <%@include file="/jsp/showErrorMessage.jsp"%>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldLabelArea">名称:</td>
                                <td class="fieldValueArea" bgcolor="#ffffff">
                                    <input type="text" size="30" name="filterName" value="<%=savedFilter.getFilterName()%>" />
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldLabelArea">描述:</td>
                                <td class="fieldValueArea" bgcolor="#ffffff">
                                    <textarea style="width: 90%;" wrap="virtual" rows="3" cols="40" name="description"><%=savedFilter.getDescription()%></textarea>
                                </td>
                            </tr>
                            <input type="hidden" name="saveName" value="<%=savedFilter.getFilterName()%>">
                            <tr>
                                <td class="fullyCentered simpleformfooter" colspan="2">
                                    <input id="保存" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="保存" name="保存" />
                                    <input id="cancelButton" type="button" onclick="location.href='issueNavigator.jsp?mode=hide'" value="取消" name="issueNavigator.jsp" title="取消 (Alt + b)" accesskey="b" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</body>
</html>