<%--
 在dashboard.jsp中  分配给我的问题列表
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="java.util.*"%>
<%
    String path = request.getContextPath();
    User currentUser = (User) session.getAttribute(Global.SESSION_USER);
    int id = currentUser.getId();
    IssueBO issueBO = new IssueBO();
    List<Issue> issueList = issueBO.getIssueListByAssigneeId(id);
%>


<table class="tableBorder maxWidth" width="100%" cellspacing="1" cellpadding="3" border="0">
    <tr class="rowHeader">
        <td class="colHeaderLink" colspan="4">
            开发的问题:
            <b>
                <a href='<%=path%>/jsp/frontend/issue/issueNavigator.jsp?action=forMe'>分配给我的</a>
                <%
                    if (issueList != null) {
                        if (issueList.size() < 10) {
                            out.println("<small>(显示" + issueList.size() + "中的" + issueList.size() + ")");
                        } else {
                            out.println("10/" + issueList.size() + "</small>");
                        }
                    }
                %>
            </b>
        </td>
    </tr>

    <%
        if (issueList != null && issueList.size() > 0) {
            for (int i = 0; i < 10 && i < issueList.size(); i++) {
                Issue issue = issueList.get(i);
    %>
    <tr class="rowNormal DFD-3-tr">
        <td nowrap="" width="1%">
            <a href=" <%=path%>/jsp/frontend/issue/issueDetailLayout.jsp?action=forMe&issueKey=<%=issue.getIssueKey()%>">
                <img height="16" width="16" border="0" align="absmiddle" title="<%=issue.getIssueTypeName()%>" alt="<%=issue.getIssueTypeName()%>" src=" <%=request.getContextPath() + issue.getIssueTypeIcon()%>" />
            </a>
        </td>

        <td nowrap="" width="1%">
            <font size="1">
                <a href=" <%=path%>/jsp/frontend/issue/issueDetailLayout.jsp?action=forMe&issueKey=<%=issue.getIssueKey()%>">
                    <span class="issuekey">
                        <%=issue.getIssueKey()%></span>
                </a>
            </font>
        </td>
        <td width="100%">
            <a style="text-decoration: none;" href=" <%=path%>/jsp/frontend/issue/issueDetailLayout.jsp?action=forMe&issueKey=<%=issue.getIssueKey()%>"><%=issue.getName()%></a>
        </td>
        <td nowrap="" width="1%">
            <img height="16" width="16" border="0" align="absmiddle" title="<%=issue.getPriorityLevel()%>" alt="Major" src=" <%=request.getContextPath() + issue.getPriorityLevelIcon()%> " />
        </td>

    </tr>

    <%
        } //endfor
        } //endif
    %>
</table>
