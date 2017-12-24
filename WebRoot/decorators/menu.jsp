<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.User"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.*"%>

<!DOCTYPE html>

<html>
<head>

<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">


</head>
<body>
  
        <%
            User userinfo = (User) session.getAttribute(Global.SESSION_USER);
        %>
       


</body>
</html>