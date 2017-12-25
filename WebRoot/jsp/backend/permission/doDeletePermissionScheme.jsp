<%--
    Description:Delete a permission scheme.
    Author:Sun Chongyang 
 --%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

</head>

<body>
    <%
        String idStr = request.getParameter("schemeId");
        int schemeId = 0;
        if (StringUtils.isNotBlank(idStr)) {
            schemeId = Integer.parseInt(idStr);
        }
        ProjectBO projectBO = new ProjectBO();
        List<Project> list = projectBO.getProjectListByScheme(schemeId);
        if (list.size() > 0) {
            for (Project project : list) {
                
                projectBO.changeScheme(project.getProjectId(), 1);
             
            }
        }
        PermissionAssigneeBO paBO = new PermissionAssigneeBO();
        paBO.deleteSchemePermission(schemeId);
        PermissionSchemeBO schemeBO = new PermissionSchemeBO();
        schemeBO.deletePermissionScheme(schemeId);
        response.sendRedirect("viewPermissionSchemes.jsp");
    %>
</body>
</html>
