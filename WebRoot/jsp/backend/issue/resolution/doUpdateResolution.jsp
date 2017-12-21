<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.Resolution"%>
<%@ page import="com.nastation.pm.business.ResolutionBO"%>
<%@ page import="com.nastation.pm.util.StringUtils"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
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
        //get parameters 
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String isDefaultStr = request.getParameter("isDefault");

        //parse parameters 
        int id = 0;
        if (StringUtils.isNotBlank(idStr)) {
            id = Integer.parseInt(idStr);
        }
        int isDefault = 0;
        if (StringUtils.isNotBlank(isDefaultStr)) {
            isDefault = Integer.parseInt(isDefaultStr);
        }
        //set message into Resolution  
        Resolution resolution = new Resolution();
        Resolutionhbm r = new Resolutionhbm();
        ResolutionBO resolutionBO = new ResolutionBO();
        resolution.setDescription(description);
        resolution.setId(id);
        resolution.setIsDefault(isDefault);
        resolution.setName(name);
        
        r.setDescription(description);
        r.setId(id);
        r.setIsDefault(isDefault);
        r.setName(name);
        
        
        if (resolutionBO.checkExistResolution(r)) {
            String error = "错误：该名称已存在，请重新命名！";
            request.setAttribute("error", error);
    %>
    <jsp:forward page="updateResolution.jsp">
        <jsp:param name="id" value="<%=id%>" />
    </jsp:forward>
    <%
        } else {
            resolutionBO.updateResolution(r);
            response.sendRedirect(request.getContextPath() + "/jsp/backend/issue/resolution/viewResolutions.jsp");
        }
    %>
</body>
</html>
