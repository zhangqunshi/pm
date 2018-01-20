<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%
    RoleBO rb = new RoleBO();
    String id = request.getParameter("id");
    int i = Integer.parseInt(id);
<<<<<<< HEAD
=======
    
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
    if (rb.checkRoleByLink(i)) {
        ProjectUserBO pjb = new ProjectUserBO();
        pjb.deleteAllProjectUser(i);
    }
    rb.deleteRole(i);
%>
<jsp:forward page="viewRoles.jsp"></jsp:forward>
