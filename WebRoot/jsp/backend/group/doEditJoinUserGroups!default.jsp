<%-- 
	描述： 添加组到用户中
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

    String errMsg = "";
    if (StringUtils.isBlank(groupIdStr)) {

        errMsg += "Cannot add user '" + user.getName()
                + "', user is already a member of all the selected group(s)";
        response.sendRedirect("EditUserGroups!default.jsp?name=" + user.getName() + "&errMsg=" + errMsg);
        return;
    }
    int groupId = Integer.parseInt(groupIdStr);

    groupUser.setUserId(userId);
    groupUser.setGroupId(groupId);

    if (groupUserBO.groupUserExit(groupUser)) {

    } else {
        groupUserBO.addGroupUser(groupUser);
    }
    response.sendRedirect("EditUserGroups!default.jsp?name=" + user.getName());
%>