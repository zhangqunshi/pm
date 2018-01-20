<%-- 
	描述： 删除组信息
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
<head>
</head>
<body>
    <%
        String groupName = request.getParameter("groupName");
        if (StringUtils.isBlank(groupName)) {
            return;
        }
        GroupBO groupBO = new GroupBO(); 
        GroupUserBO groupUserBO = new GroupUserBO();

        Grouphbm moveGroup = groupBO.getGroupInformation(groupName);

        if (groupUserBO.groupUserExit(moveGroup.getId())) {
            groupUserBO.deleteGroupUser(moveGroup.getId());
        }
        groupBO.deleteGroup(moveGroup.getId());
        response.sendRedirect("GroupBrowser.jsp");
    %>
</body>
</html>
