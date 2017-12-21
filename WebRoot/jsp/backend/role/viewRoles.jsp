<%-- 
	描述：查看角色
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<html>
<head>
<script language="javascript">
    function confirmDelete() {
        var x = confirm("是否要删除此条记录");
        if (x) {
            return true;
        }
        return false;
    }
</script>
</head>
<body>
    <div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
        <h3 class="formtitle">Project Role Browser</h3>
        <p>You can use project roles to associate users and/or groups with specific projects.</p>
    </div>
    <p></p>
    <table border='1' width='100%'>
        <th>Project Role Name</th>
        <th>描述</th>
        <th>操作</th>
        <%
            RoleBO rb = new RoleBO();
            List<Rolehbm> list = rb.getRoleList();
            for (int i = 0; i < list.size(); i++) {
                Rolehbm role = list.get(i);
                out.println("<tr><td>" + role.getRoleName() + "</td><td>" + role.getRoleDesc()
                        + "</td><td><a href='deleteRole.jsp?id=" + role.getId()
                        + "'>删除</a> | <a href='updateRole.jsp?id=" + role.getId() + "' >编辑</a></td></tr>");
            }
        %>
    </table>
    <%@include file="/jsp/backend/role/addRole.jsp"%>
</body>
</html>