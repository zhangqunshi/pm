<%-- 
	描述： 浏览所有用户组
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
    GroupBO groupBO = new GroupBO();
    List<Grouphbm> groupList = groupBO.getViewGroups();
%>

<table id="group_browser_table" class="grid" border="0" width="100%">
    <tbody>
        <tr bgcolor="#f0f0f0">
            <th width="40%">Group Name</th>
            <th width="20%">Users</th>
            <th width="30%">Permission Schemes</th>
            <th nowrap="" width="10%">操作</th>
        </tr>
        <%
            if (groupList == null || groupList.size() == 0) {

            } else {
                for (int i = 0; i < groupList.size(); i++) {
                    Grouphbm groupView = groupList.get(i);
        %>
        <tr bgcolor="#ffffff">
            <td valign="top">
                <a href="viewGroupDetail.jsp?groupName=<%=groupView.getName()%>"><%=groupView.getName()%></a>
            </td>
            <td valign="top"><%=groupView.getUserCount()%>
                <font size="1">
                    (
                    <a href="../user/viewUser.jsp?group=<%=groupView.getName()%>">查看</a>
                    )
                </font>
            </td>
            <td>
                <%
                    
                            PermissionSchemeBO permissionSchemeBO = new PermissionSchemeBO();
                            List<PermissionScheme> permissionSchemeList = permissionSchemeBO.getPermissionSchemeList("Group",
                                    groupView.getName());
                            for (int j = 0; j < permissionSchemeList.size(); j++) {
                                PermissionScheme permissionScheme = permissionSchemeList.get(j);
                                out.println("<img height='8' border='0' align='absmiddle' width='8' src='"
                                        + request.getContextPath() + "/images/icons/bullet_blue.gif'/ > <a href='"
                                        + request.getContextPath() + "/jsp/backend/permission/editPermissions.jsp?"
                                        + "schemeId=" + permissionScheme.getId() + "'>" + permissionScheme.getName()
                                        + "</a><br/>");
                            }
                %>
            </td>
            <td nowrap="" valign="top">
                <a id="del_dsffd" href="<%=request.getContextPath()%>/jsp/backend/group/DeleteGroup!default.jsp?groupName=<%=groupView.getName()%>">删除</a>
                |
                <a id="edit_members_of_dsffd" href="BulkEditUserGroups!default.jsp?groupName=<%=groupView.getName()%>">Edit Members</a>
            </td>
        </tr>
        <%
            }
            }
        %>
    </tbody>
</table>