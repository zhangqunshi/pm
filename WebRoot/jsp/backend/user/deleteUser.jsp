<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!-- 删除用户 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

</head>

<body>
    <%
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        UserBO userBO = new UserBO();
        boolean hasForeignKey = userBO.hasForeignKey(id);
        System.out.println("has foreign key?" + hasForeignKey);
        if (hasForeignKey) {
            String errMsg = "该用户与项目相关联。要想删除该用户，请先删除项目中的关联！";
            request.setAttribute("error", errMsg);
            System.out.println(errMsg);
        } else {
            userBO.deleteUser(id);
        }
    %>
    <jsp:forward page="/jsp/backend/user/viewUser.jsp"></jsp:forward>
</body>
</html>
