<%-- 
	描述： 添加组到用户中表单
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
    String userName = request.getParameter("name");

    if (StringUtils.isBlank(userName)) {
        
        return;
    }

    GroupBO groupBO = new GroupBO();
    UserBO joinUserBO = new UserBO();

    Userhbm joinUser = joinUserBO.getUser(userName);
    if (joinUser != null) {
        List<Grouphbm> joinGroupList = groupBO.getUserGroupList(joinUser.getId());

        out.println("<div align='center'><b>Available Groups</b><br>");
        if (joinGroupList == null || joinGroupList.size() == 0) {
            out.println("User is a member of all groups. ");
        } else {
            out.println("<p><form action='doEditJoinUserGroups!default.jsp'>");
            out.println("<input type='submit' value='Join >>'/><div><br>");
            out.println("<input type='hidden' name='userId' value='" + joinUser.getId() + "'/>");
            out.println("<select size='5' name='groupId'>");

            for (int i = 0; i < joinGroupList.size(); i++) {
                Grouphbm joinGroup = joinGroupList.get(i);
                out.println("<option value='" + joinGroup.getId() + "'>" + joinGroup.getName() + "</option>");
            }

            out.println("</select>");
            out.println("</form></p>");

        }
    }
%>