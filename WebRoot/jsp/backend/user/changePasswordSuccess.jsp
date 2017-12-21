<%@ page language="java" contentType="text/html;chaset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


</head>

<body>
    <%
        String name = request.getParameter("name");
    %>
    <table class="simpleform maxWidth" width="100%">
        <tbody>
            <tr>
                <td class="simpleformheader" colspan="2">
                    <h3 class="formtitle">
                        Successfully set new password for:<%=name%>
                    </h3>
                </td>
            </tr>
            <tr>
                <td class="simpleformheader" colspan="2">Password for user sun has successfully been set</td>
            </tr>
            <tr>
                <td class="fullyCentered simpleformfooter" colspan="2" align="center">
                    <input id="ok" type="button" onclick="window.location='<%=path%>/jsp/backend/user/viewUserDetail.jsp?name=<%=name%>'" value="OK" />
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
