<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.User"%>
<%@ page import="com.nastation.pm.*"%>
<%
    String loginPage = request.getContextPath() + "/jsp/login.jsp";
    if (session == null) {
        response.sendRedirect(loginPage);
    }

    User user = (User) session.getAttribute(Global.SESSION_USER);
    if (user == null || user.getName() == null || user.getName().equals("")) {
        response.sendRedirect(loginPage);
    }
%>