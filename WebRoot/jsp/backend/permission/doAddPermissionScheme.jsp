<%--
    Description:Create a new permission scheme.
    Author:Sun Chongyang  
 --%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
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
    <%
        String name = request.getParameter("name");
        if (StringUtils.isBlank(name)) {
            String error = "模板名称不能为空！";
            request.setAttribute("error", error);
    %>
    <jsp:forward page="addPermissionScheme.jsp"></jsp:forward>
    <%
        }
        String description = request.getParameter("description");
        String createDate = StringUtils.getCurrDate();
        PermissionSchemeBO schemeBO = new PermissionSchemeBO();
        if (schemeBO.exist(name)) {
            String error = "模板名已存在，请重新命名。";
            request.setAttribute("error", error);
    %>
    <jsp:forward page="addPermissionScheme.jsp"></jsp:forward>
    <%
        } else {
            PermissionScheme scheme = new PermissionScheme();
            PermissionSchemehbm p = new PermissionSchemehbm();
            scheme.setName(name);
            scheme.setDescription(description);
            
            p.setName(name);
            p.setDescription(description);
            schemeBO.addPermissionScheme(p);
            response.sendRedirect("viewPermissionSchemes.jsp");
        }
    %>
</body>
</html>
