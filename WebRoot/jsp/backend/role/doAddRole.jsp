<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

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
    Role r = new Role();
    Rolehbm role = new Rolehbm();
    String roleTime = StringUtils.toString(new java.util.Date());
    role.setRoleName(name);
    role.setRoleDesc(desc);
    role.setCreateDate(roleTime);
    if (!rb.checkRole(r)) {
        rb.addRole(role);
%>
<jsp:forward page="viewRoles.jsp"></jsp:forward>
<%
    } else {
%>
<jsp:forward page="viewRoles.jsp">
    <jsp:param name="error" value="the name already exist" />
</jsp:forward>
<%
    }
%>

