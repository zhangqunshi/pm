<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    ProjectComponentBO pb = new ProjectComponentBO();
    String mkd = request.getParameter("idd");
    int pi = Integer.parseInt(mkd);
    pb.deleteProjectComponent(pi);
%>
<jsp:forward page="../viewProjectDetail.jsp" />