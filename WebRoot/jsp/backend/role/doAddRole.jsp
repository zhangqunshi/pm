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
%>
<jsp:forward page="viewRoles.jsp">
	<jsp:param name="error" value="the name can't be empty" />
</jsp:forward>
<%
	}
	RoleBO rb = new RoleBO();
	System.out.println("====name====" + name);
	Role role = new Role();
	String roleTime = StringUtils.toString(new java.util.Date());
	role.setRoleName(name);
	role.setRoleDesc(desc);
	role.setCreateDate(roleTime);
	if (!rb.checkRole(role)) {
		rb.addRole(role);
		System.out.println("====role===============================");
		System.out.println("add success");
%>
<jsp:forward page="viewRoles.jsp"></jsp:forward>
<%
	} else {
		System.out
				.println("123123123123123123123====role===============================");
%>
<jsp:forward page="viewRoles.jsp">
	<jsp:param name="error" value="the name already exist" />
</jsp:forward>
<%
	}
%>

