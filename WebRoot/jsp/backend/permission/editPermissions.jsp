<%--
    Descripton:Edit the permissions you assigneed . 
    Author:Sun Chongyang
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>
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
        String idStr = request.getParameter("schemeId");
        int schemeId = Integer.parseInt(idStr);
        PermissionSchemeBO schemeBO = new PermissionSchemeBO();
        PermissionSchemehbm scheme = schemeBO.getScheme(schemeId);
        PermissionAssigneeBO paBO = new PermissionAssigneeBO();
        PermissionBO pBO = new PermissionBO();
        HashMap<String, List> hm = pBO.getAllTypeList(schemeId);
    %>
    <table class="simpleform maxWidth">
        <tbody>
            <tr>
                <td class="simpleformheader">

                    <h3 class="formtitle">
                        Edit Permissions —
                        <%=scheme.getName()%>
                    </h3>
                </td>
            </tr>
            <tr>
                <td class="simpleformbody">
                    <p>
                        On this page you can edit the permissions for the "<%=scheme.getName()%>
                        " permission scheme.
                    </p>
                    <ul class="square">
                        <li>
                            <img height="8" border="0" width="8" src="<%=request.getContextPath()%>/images/icons/bullet_creme.gif" />
                            <a href="addPermission.jsp?schemeId=<%=scheme.getId()%>">
                                <b>Grant permission</b>
                            </a>
                        </li>
                        <li>
                            <img height="8" border="0" width="8" src="<%=request.getContextPath()%>/images/icons/bullet_creme.gif" />
                            View all
                            <a href="viewPermissionSchemes.jsp">
                                <b>permission schemes</b>
                            </a>
                        </li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
    <br />
    <%
        Set keySet = hm.keySet();
        Iterator it = keySet.iterator();
        while (it.hasNext()) {
            String type = (String) it.next();
    %>
    <table width="90%" cellspacing="0" cellpadding="0" border="0" align="center">
        <tbody>
            <tr>
                <td>
                    <table id="edit_project_permissions" width="100%" cellspacing="1" bgcolor="#bbbbbb" cellpadding="3" border="0">
                        <tbody>
                            <tr bgcolor="#f0f0f0">
                                <td class="colHeaderLink">
                                    <b><%=type%></b>
                                </td>
                                <td class="colHeaderLink" width="25%">Users / Groups / Project Roles</td>
                                <td class="colHeaderLink" width="10%">
                                    <b>操作</b>
                                </td>
                            </tr>
                            <%
                                List<Permission> permissionlist = (List) hm.get(type);
                                    for (Permission permission : permissionlist) {
                            %>
                            <tr bgcolor="#ffffff">
                                <td valign="top">
                                    <b><%=permission.getName()%>
                                    </b>
                                    <br />
                                    <font size="1"><%=permission.getDescription()%></font>
                                </td>
                                <td valign="top">
                                    <%
                                        List<PermissionAssigneehbm> list = paBO.getAssigneeTypeList(permission.getId(), schemeId);
                                                for (PermissionAssigneehbm assignee : list) {
                                    %>
                                    <img height="8" border="0" width="8" src="<%=request.getContextPath()%>/images/icons/bullet_blue.gif" />
                                    <%=assignee.getAssigneeType()%>(
                                    <b><%=assignee.getAssignee()%></b>
                                    )
                                    <font size="1">
                                        (
                                        <a id="del_perm_23_10002" href="deletePermission.jsp?id=<%=assignee.getId()%>&schemeId=<%=scheme.getId()%>">删除</a>
                                        )
                                    </font>
                                    <br />
                                    <%
                                        } //endfor
                                    %>
                                </td>
                                <td nowrap="" valign="top">
                                    <img height="8" border="0" width="8" src="<%=request.getContextPath()%>/images/icons/bullet_creme.gif" />
                                    <a id="add_perm_23" href="addPermission.jsp?schemeId=<%=schemeId%>&permissionId=<%=permission.getId()%>">增加</a>
                                </td>
                            </tr>
                            <%
                                } //endfor
                            %>
                        </tbody>
                    </table>
                    <br />
                </td>

            </tr>

        </tbody>
    </table>
    <%
        } //endwhile
    %>
</body>
</html>
