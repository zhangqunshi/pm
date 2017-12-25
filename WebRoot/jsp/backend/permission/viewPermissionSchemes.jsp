<%--
    Description:View all permission schemes here.
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
        PermissionSchemeBO permissionSchemeBO = new PermissionSchemeBO();
        List<PermissionSchemehbm> schemeList = permissionSchemeBO.getSchemeList();
    %>

    <div class="container">

        <div class="row">
            <div class="col-md-12">

                

                                <h3 class="formtitle">Permission Schemes</h3>
                        
                     
                                <p>Permission Schemes allow you to create a set of permissions and apply this set of permissions to any project.</p>
                                <p>All permissions within a scheme will apply to all projects that are associated with that scheme.</p>
                                The table below shows the permission schemes currently configured for this server.
                       
           

            </div>

        </div>

        <div class="row">
            <div class="col-md-12">

              
                   
                      
                        
                                <table class="table table-hover">
                                   <thead>
                                    <tr bgcolor="#f0f0f0">
                                        <td class="colHeaderLink">
                                            <b>名称</b>
                                        </td>
                                        <td class="colHeaderLink">
                                            <b>项目</b>
                                        </td>
                                        <td class="colHeaderLink">
                                            <b>操作</b>
                                        </td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (PermissionSchemehbm scheme : schemeList) {
                                                if (scheme.getProjectList().size() > 0) {
                                        %>
                                        <tr bgcolor="#ffffff">
                                            <td valign="top">
                                                <b>
                                                    <a href="editPermissions.jsp?schemeId=<%=scheme.getId()%>"><%=scheme.getName()%></a>
                                                </b>
                                                <br />
                                                <%=scheme.getDescription()%></td>
                                            <td nowrap="" valign="top">
                                                <%
                                                    Set<Projecthbm> list = scheme.getProjectList();

                                                            for (Projecthbm project : list) {
                                                %>
                                                <img height="8" border="0" width="8" src="<%=request.getContextPath()%>/images/icons/bullet_blue.gif" />
                                                <a href="<%=request.getContextPath()%>/jsp/backend/project/viewProject.jsp?projectId=<%=project.getId()%>"><%=project.getName()%></a>
                                                <br />
                                                <%
                                                    } //endfor
                                                %>
                                            </td>
                                            <td nowrap="" valign="top" align="left">
                                                <a id="0_edit" title="Change permissions for this scheme" href="editPermissions.jsp?schemeId=<%=scheme.getId()%>">Permissions</a>
                                                |
                                                <a title="Create a copy of this scheme" href="copyPermissionScheme.jsp?schemeId=<%=scheme.getId()%>">Copy</a>
                                                |
                                                <a title="Edit the name and description of this scheme" href="updatePermissionScheme.jsp?schemeId=<%=scheme.getId()%>">编辑</a>
                                                <%
                                                    if (scheme.getId() != 1) {
                                                %>
                                                |
                                                <a id="del_SchemeTest" title="Delete this scheme" href="deletePermissionScheme.jsp?schemeId=<%=scheme.getId()%>">删除</a>
                                                <%
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <%
                                            } else {
                                        %>

                                        <tr bgcolor="#fffff0">
                                            <td valign="top">
                                                <b>
                                                    <a href="editPermissions.jsp?schemeId=<%=scheme.getId()%>"><%=scheme.getName()%></a>
                                                </b>
                                                <br />
                                                <%=scheme.getDescription()%></td>
                                            <td nowrap="" valign="top"></td>
                                            <td nowrap="" valign="top" align="left">
                                                <a id="10000_edit" title="Change permissions for this scheme" href="editPermissions.jsp?schemeId=<%=scheme.getId()%>">Permissions</a>
                                                |
                                                <a title="Create a copy of this scheme" href="copyPermissionScheme.jsp?schemeId=<%=scheme.getId()%>">Copy</a>
                                                |
                                                <a title="Edit the name and description of this scheme" href="updatePermissionScheme.jsp?schemeId=<%=scheme.getId()%>">编辑</a>
                                                <%
                                                    if (scheme.getId() != 1) {
                                                %>
                                                |
                                                <a id="del_SchemeTest" title="Delete this scheme" href="deletePermissionScheme.jsp?schemeId=<%=scheme.getId()%>">删除</a>
                                                <%
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <%
                                            } //endelse
                                            } //endfor
                                        %>

                                    </tbody>
                                </table>
                   
               
              


            </div>

        </div>

        <div class="row">
            <div class="col-md-12">

                <table width="100%">
                    <tr>
                        <td align="center">
                            <a href="addPermissionScheme.jsp" class="btn btn-info btn-block">Add Permission Scheme</a>
                        </td>
                    </tr>
                </table>

            </div>

        </div>

    </div>
</html>
