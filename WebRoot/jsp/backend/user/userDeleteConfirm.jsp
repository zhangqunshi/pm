<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html>
<head>
</head>
<body>
    <%
        String idStr = request.getParameter("id");
        int id = 0;
        if (StringUtils.isNotBlank(idStr)) {
            id = Integer.parseInt(idStr);
        }
        IssueBO issueBO = new IssueBO();
    %>
    <form action="deleteUser.jsp" method="post">
        <table>
            <tbody>
                <tr>
                    <td>

                        <h3>Delete User: test</h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">

                        <p>用户在没有被分配任务和报告的情况下可以被删除。</p>
                        <p>
                            <font color="#cc0000"> 注意：如果该用户被删除，将该用户设置为负责人的模块中，负责人项将变为空。 </font>
                        </p>

                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" value="<%=id%>" name="id" />
                    </td>
                </tr>
                <tr>
                    <td align="right" width="50%">Assigned Issues:</td>
                    <td>
                        <a align="left"><%=issueBO.assigneeCount(id)%></a>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="50%">Reported Issues:</td>
                    <td align="left">
                        <%=issueBO.reporterCount(id)%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="删除" />
                        <input type="button" value="取消" onclick="window.history.back();" />
                    </td>
                </tr>

            </tbody>
        </table>
    </form>
</body>
</html>
