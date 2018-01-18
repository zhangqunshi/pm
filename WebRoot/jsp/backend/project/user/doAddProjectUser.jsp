<%-- 
	描述： 新建项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<html>
<body>
    <%
        String projectId = request.getParameter("projectId");
        String roleId = request.getParameter("roleId");
        int pId = Integer.parseInt(projectId);
        int rId = Integer.parseInt(roleId);
        String typeStr = request.getParameter("users");
        if (typeStr == null || typeStr.equals("")) {
    %>
    <jsp:forward page="addProjectUser.jsp">
        <jsp:param name="projectId" value="<%=pId%>" />
        <jsp:param name="roleId" value="<%=rId%>" />
    </jsp:forward>
    <%
        } else {
            String[] type1 = (typeStr).split(",");
            String type = "";

            if (type1 != null) {
                UserBO userBo = new UserBO();
                ProjectUserBO pb = new ProjectUserBO();

                for (int i = 0; i < type1.length; i++) {

                    type = type1[i];
                    Userhbm user = userBo.getUser(type);

                    if (user != null) {
                        ProjectUser projectUser = new ProjectUser();
                        String createTime = StringUtils.toString(new java.util.Date());
                        projectUser.setProjectId(pId);
                        projectUser.setUserId(user.getId());
                        projectUser.setRoleId(rId);
                        projectUser.setCreateDate(createTime);
                        pb.addProjectUser(projectUser);
                    }
                }
            }
    %>
    <jsp:forward page="addProjectUser.jsp">
        <jsp:param name="projectId" value="<%=pId%>" />
        <jsp:param name="roleId" value="<%=rId%>" />
    </jsp:forward>
    <%
        }
    %>

</body>
</html>
