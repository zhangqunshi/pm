<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>

<%
	String name = request.getParameter("name");
	String desc = request.getParameter("desc");
	if (StringUtils.isBlank(name)) {
		request.setAttribute("error", "The name can't be empty");
%>
<jsp:forward page="viewProjectCategory.jsp"></jsp:forward>
<%
	}
	ProjectCategoryBO pb = new ProjectCategoryBO();
	System.out.println("====name====" + name);
	ProjectCategory category = new ProjectCategory();
	category.setName(name);
	category.setDescription(desc);

	if (pb.checkProjectCategory(category)) {
		pb.addProjectCategory(category);
		response.sendRedirect("viewProjectCategory.jsp");
	} else {
		request.setAttribute("error", "The name already exist");
%>
<jsp:forward page="viewProjectCategory.jsp"></jsp:forward>
<%
	}
%>

