<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>

<body>
    <%
        String pid = request.getParameter("projectId");
        String schemeIdStr = request.getParameter("schemeId");
        int projectId = Integer.parseInt(pid);
        int schemeId = Integer.parseInt(schemeIdStr);
        
        
        ProjectBO projectBO = new ProjectBO();
        projectBO.changeScheme(projectId, schemeId);
    %>
    <jsp:forward page="../project/viewProjectDetail.jsp">
        <jsp:param name="projectId" value="<%=projectId%>" />
    </jsp:forward>
</body>
</html>
