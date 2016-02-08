<%-- 
	描述： 移除用户对应的组表单
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
String leaveUserName = request.getParameter("name");

if(StringUtils.isBlank(leaveUserName)){
   System.out.println("==========username is null========");
   return;
}

GroupBO leaveGroupBO = new GroupBO();
UserBO leaveUserBO = new UserBO();

User leaveUser = leaveUserBO.getUser(leaveUserName);
List<Group> leaveGroupList = leaveGroupBO.getUserGroupName(leaveUser.getId());

out.println("<div align='center'><b>组</b><br>");
if(leaveGroupList == null || leaveGroupList.size() == 0){
    out.println("User isn't a member of any groups. ");
}else{
    out.println("<p><form action='doEditLeaveUserGroups!default.jsp'>");
    out.println("<input type='submit' value='<< Leave'/><div><br>");
    out.println("<input type='hidden' name='userId' value='"+leaveUser.getId()+"'/>");
    out.println("<select size='5' name='groupId'>");
    
    for(int i = 0;i < leaveGroupList.size(); i++){
    Group leaveGroup = leaveGroupList.get(i);
        out.println("<option value='"+leaveGroup.getId()+"'>"+leaveGroup.getName()+"</option>");      
    }
    
    out.println("</select>");
    out.println("</form></p>");
    
    
}
%>