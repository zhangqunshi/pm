<%-- 
	描述： 移除用户对应的组
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
<%
    String userIdStr = request.getParameter("userId");
    String groupIdStr = request.getParameter("groupId");

    if (StringUtils.isBlank(userIdStr)) {
        return;
    }
    int userId = Integer.parseInt(userIdStr);

    UserBO userBO = new UserBO();
    GroupUserBO groupUserBO = new GroupUserBO();
    GroupUser groupUser = new GroupUser();
    Userhbm user = userBO.getUser(userId);

    if (StringUtils.isBlank(groupIdStr)) {
        response.sendRedirect("EditUserGroups!default.jsp?name=" + user.getName());
        return;
    }
    int groupId = Integer.parseInt(groupIdStr); 

    groupUser.setUserId(userId);
    groupUser.setGroupId(groupId);

    groupUserBO.deleteUserGroup(groupUser);

    response.sendRedirect("EditUserGroups!default.jsp?name=" + user.getName());
%>