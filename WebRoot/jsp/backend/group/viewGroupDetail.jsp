<%-- 
	描述： 显示组信息
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
        Grouphbm groupInformation = groupBO.getGroupInformation(groupName);
    %>
    <table cellspacing="0" cellpadding="0" border="0" width="100%" style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
        <tbody>
            <tr>
                <td>
                    <table class="simpleform maxWidth">
                        <tbody>
                            <tr bgcolor="#dddddd">
                                <td class="simpleformheader">
                                    <h3 class="formtitle">
                                        Group:
                                        <%=groupName%>
                                    </h3>
                                </td>
                            </tr>
                            <tr>
                                <td class="simpleformbody">
                                    <p>
                                        <b>Group Name</b>
                                        <%=groupName%>
                                        <br />
                                        <b>Users: </b>
                                        <%=groupInformation.getUserCount()%>
                                        <font size="1">
                                            (
                                            <a href="../user/viewUser.jsp?group=<%=groupName%>">查看</a>
                                            |
                                            <a id="edit_members_of_ghg" href="BulkEditUserGroups!default.jsp?groupName=<%=groupName%>">Edit Members</a>
                                            )
                                        </font>
                                        <br />
                                        <br />
                                        <b>Permission Schemes:</b>
                                        <br />
                                        <%
                                            PermissionSchemeBO permissionSchemeBO = new PermissionSchemeBO();
                                            List<PermissionScheme> PermissionSchemeList = permissionSchemeBO.getPermissionSchemeList("Group",
                                                    groupName);
                                            if (PermissionSchemeList == null || PermissionSchemeList.size() == 0) {
                                                out.println("<img height='8' border='0' align='absmiddle' width='8'" + "src='"
                                                        + request.getContextPath() + "/images/icons/bullet_blue.gif ' / >"
                                                        + " There are no <b>Permission Schemes</b> associated with this Group.<br />");
                                            } else {
                                                for (int i = 0; i < PermissionSchemeList.size(); i++) {
                                                    PermissionScheme permissionScheme = PermissionSchemeList.get(i);
                                                    out.println("<img height='8' border='0' align='absmiddle' width='8' src='"
                                                            + request.getContextPath() + "/images/icons/bullet_blue.gif'/ > <a href='"
                                                            + request.getContextPath() + "/jsp/backend/permission/editPermissions.jsp?" + "schemeId="
                                                            + permissionScheme.getId() + "'>" + permissionScheme.getName() + "</a><br/>");
                                                }
                                            }
                                        %>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
