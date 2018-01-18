<!-- 判断原密码是否正确，如果正确则修改密码，否则不修改 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

</head>

<body>
    <br>
    <%
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String newpwd = request.getParameter("newpwd");
        UserBO userBO = new UserBO();
        boolean success = userBO.changePassword(id, newpwd);
        if (success) {
            Userhbm user = userBO.getUser(id);
    %>
    <jsp:forward page="changePasswordSuccess.jsp">
        <jsp:param name="name" value="<%=user.getName()%>" />
    </jsp:forward>
    <%
        } //end if
    %>

</body>
</html>
