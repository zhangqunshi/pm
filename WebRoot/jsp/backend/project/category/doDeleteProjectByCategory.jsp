<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%
	ProjectCategoryBO rb = new ProjectCategoryBO();
	String id = request.getParameter("id");
	int i = Integer.parseInt(id);
	rb.deleteProjectCategoryForLinkProject(i);
%>
<jsp:forward page="viewProjectCategory.jsp"></jsp:forward>


