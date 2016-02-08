<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.*"%>
<%
	String path = request.getContextPath();
	session.removeAttribute(Global.SESSION_USER);
	session.invalidate();
	response.sendRedirect(path + "/jsp/login.jsp");
%>
