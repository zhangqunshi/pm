<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.User"%>
<%@ page import="com.nastation.pm.*"%>
<table width="100%" border="0" bgcolor="#F0F0F0">
    <tr>
        <td align="left">项目管理软件 v1.0</td>
        <td align="right">
            用户名:
            <%
            User user = (User) session.getAttribute(Global.SESSION_USER);
            if (user != null) {
                out.print(user.getName());
            }
        %>
            |
            <a href="<%=request.getContextPath()%>/jsp/logout.jsp">注销</a>
        </td>
    </tr>
</table>