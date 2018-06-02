<%-- 
	描述：显示用户列表 
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<html>
<head>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="formtitle">User Browser</h3>
                <p>The User Browser allows you to browse all the users in the system. Filters allow you to limit the users that you see.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p>
                    <!--  <img height="8" border="0" width="8" src="<%=request.getContextPath()%>/images/icons/bullet_creme.gif" />  -->
                    <b>
                        <a href='<c:url value="/jsp/backend/user/addUser.jsp" />' class="btn btn-info btn-block">Add User</a>
                    </b>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <%@ include file="/jsp/showErrorMessage.jsp"%>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>用户名</th>
                            <th>邮件</th>
                            <th>全名</th>
                            <th>组</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            UserBO userBO = new UserBO();
                            GroupBO groupBO = new GroupBO();
                            String group = (String) request.getParameter("group");

                            if (StringUtils.isBlank(group)) { //查询出没有group参数传进来时,显示的组信息

                                List<Userhbm> list = userBO.viewUsers();
                                if (list != null) {
                                    for (int i = 0; i < list.size(); i++) {
                                        Userhbm user = list.get(i);
                                        out.println("<tr>");
                                        out.println("<td><a href='viewUserDetail.jsp?name=" + user.getName() + "'>" + user.getName()
                                                + "</a></td>");
                                        out.println("<td><a href='#'>" + user.getEmail() + "</a></td>");
                                        out.println("<td>" + user.getFullName() + "</td>");

                                        out.println("<td>");

                                        List<Grouphbm> userGroupList = groupBO.getUserGroupName(user.getId());
                                        if (userGroupList == null || userGroupList.size() == 0) {
                                        } else {
                                            for (int j = 0; j < userGroupList.size(); j++) {
                                                Grouphbm firstUserGroupName = userGroupList.get(j);
                                                out.println("<a href='" + request.getContextPath()
                                                        + "/jsp/backend/group/viewGroupDetail.jsp?groupName="
                                                        + firstUserGroupName.getName() + "'>" + firstUserGroupName.getName()
                                                        + "</a><br>");
                                            }
                                        }
                                        out.println("</td>");
                                        out.println("<td colspan='2'>");
                                        out.println("<a href='" + request.getContextPath()
                                                + "/jsp/backend/group/EditUserGroups!default.jsp?name=" + user.getName() + "'>组</a>");
                                        out.println("|<a href='" + request.getContextPath()
                                                + "/jsp/backend/user/userDeleteConfirm.jsp?id=" + user.getId() + "'>删除</a>");
                                        out.println("|<a href='" + request.getContextPath() + "/jsp/backend/user/updateUser.jsp?id="
                                                + user.getId() + "'>编辑</a></td></tr>");

                                    } //endfor  
                                } //endif
                            } else { //查询出有group参数传进来时,显示的组信息
                                Grouphbm userGroup = groupBO.getUserGroup(group);
                                List<Userhbm> userGroupList = new ArrayList<>(userGroup.getUsers());

                                for (int k = 0; k < userGroupList.size(); k++) {
                                    Userhbm groupAndUser = userGroupList.get(k);

                                    if (StringUtils.isBlank(groupAndUser.getName())) {

                                    } else {
                                        out.println("<tr>");
                                        out.println("<td><a href='#'>" + groupAndUser.getName() + "</a></td>");
                                        out.println("<td><a href='#'>" + groupAndUser.getEmail() + "</a></td>");
                                        out.println("<td>" + groupAndUser.getFullName() + "</td>");

                                        out.println("<td>");
                                        List<Grouphbm> secondUserGroupList = groupBO.getUserGroupName(groupAndUser.getId());

                                        if (secondUserGroupList == null || secondUserGroupList.size() == 0) {

                                        } else {
                                            for (int j = 0; j < secondUserGroupList.size(); j++) {
                                                Grouphbm secondUserGroupName = secondUserGroupList.get(j);
                                                out.println("<a href='" + request.getContextPath()
                                                        + "/jsp/backend/group/viewGroupDetail.jsp?groupName="
                                                        + secondUserGroupName.getName() + "'>" + secondUserGroupName.getName()
                                                        + "</a><br>");
                                            }
                                        }
                                        out.println("</td>");
                                        out.println("<td colspan='2'>");
                                        out.println("<a href='" + request.getContextPath()
                                                + "/jsp/backend/group/EditUserGroups!default.jsp?name=" + groupAndUser.getName()
                                                + "'>组</a>");
                                        out.println("|<a href='" + request.getContextPath()
                                                + "/jsp/backend/user/userDeleteConfirm.jsp?id=" + groupAndUser.getId() + "'>删除</a>");
                                        out.println("|<a href='" + request.getContextPath() + "/jsp/backend/user/updateUser.jsp?id="
                                                + groupAndUser.getId() + "'>编辑</a></td></tr>");
                                    }
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>