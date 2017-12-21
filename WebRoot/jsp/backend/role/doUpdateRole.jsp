<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
    String name = request.getParameter("name");
    String desc = request.getParameter("desc");
    int id = Integer.parseInt(request.getParameter("id"));

    RoleBO rb = new RoleBO();
    Role role = new Role();

    //检查参数
    boolean hasError = false;
    String errMsg = "";
    if (StringUtils.isBlank(name)) {
        hasError = true;
        errMsg += "<li>Role Name can't be empty!</li>";
    } else {
        role.setRoleName(name);
        if (rb.checkRole(role)) {
            Rolehbm newRole = rb.getRole(id);
            if (newRole.getRoleName().equals(name)) {
            } else {
                hasError = true;
                errMsg += "<li><font color='red'>Role Name already exists!</font></li>";
            }
        }
    }
    if (hasError) {
        request.setAttribute("error", errMsg);
%>
<jsp:forward page="updateRole.jsp"></jsp:forward>
<%
    }
    Rolehbm newRole = new Rolehbm();
    newRole.setId(id);
    newRole.setRoleName(name);
    newRole.setRoleDesc(desc);
    rb.updateRole(newRole);
%>
<jsp:include page="viewRoles.jsp"></jsp:include>
