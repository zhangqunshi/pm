<%-- 
	描述： 处理用户组提交的表单
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%
    String addNameStr = request.getParameter("groupName");
    GroupBO groupBO = new GroupBO();
    if (StringUtils.isBlank(addNameStr)) {
        response.sendRedirect("GroupBrowser.jsp?exitName=group name cann't null ");
        return;
    } else if (groupBO.groupNameExit(addNameStr)) {
        response.sendRedirect("GroupBrowser.jsp?exitName=A group or user with this name already exists. ");
        return;
    }
    groupBO.addGroup(addNameStr);

    response.sendRedirect("GroupBrowser.jsp");
%>
