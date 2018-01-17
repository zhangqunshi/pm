<%-- 
	描述：查看单个项目详细信息
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<%
    String path = request.getContextPath();
%>

<body>
    <div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
        <table border="0">
            <tr>
                <td>
                    <h3 class="formtitle">
                        项目:
                        <s:property value="#project.name" />
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Key: </b>
                    <s:property value="#project.projectKey" />

                    <br>
                    <b>网址: </b>

                    <s:if test="#project.url == http://">
                        没有网址
                    </s:if>
                    <s:else>
                        <a href="#project.url">
                            <s:property value="#project.url" />
                        </a>
                    </s:else>

                    <br>
                    <b>负责人: </b>
                    <s:property value="#project.leader" />

                    <br>
                    <b>Project Roles : </b>
                    <a href="<%=request.getContextPath()%>/jsp/backend/project/user/viewProjectUser.jsp?projectId=<s:property value="#project.projectId" />"> View members </a>
                    <br>
                    <b>Permission Scheme: </b>
                    <s:property value="#ps.name" />
                    (
                    <a href="<%=path%>/jsp/backend/permission/selectProjectPermissionScheme.jsp?projectId=<s:property value="#project.projectId" />">选择</a>
                    |
                    <a href="<%=path%>/jsp/backend/permission/editPermissions.jsp?schemeId=<s:property value="#ps.id" />">编辑</a>
                    )
                    <br />
                    <b>描述: </b>
                    <s:property value="#project.description" />
                    <br>

                    <s:if test="#project.categoryId == 0">
                        <b>Category: </b>
                        <a href="<%=request.getContextPath()%>/jsp/backend/project/category/viewProjectCategoryForProject.jsp?projectId=<s:property value="#project.projectId" />"> Select Category</a>
                    </s:if>
                    <s:else>
                        <b>Project Category: </b>
                        <s:property value="#category.name" />
                        <a href="<%=request.getContextPath()%>/jsp/backend/project/category/viewProjectCategoryForProject.jsp?projectId=<s:property value="#project.projectId" />"> Select Category</a>
                    </s:else>

                </td>

            </tr>
        </table>
    </div>
    <table>
        <tr>
            <td>
                <a href="<%=path%>/jsp/backend/project/viewProject.jsp">浏览项目</a>
                |
                <a href="<c:url value='/jsp/backend/project/updateProject.jsp'/>?projectId=<s:property value="#project.projectId" />">Edit Project</a>
                |
                <a href="<c:url value='/jsp/backend/project/deleteProject.jsp'/>?projectId=<s:property value="#project.projectId" />">Delete Project</a>
            </td>
        </tr>
    </table>

    <table>
        <tr>
            <td><%@ include file="/jsp/backend/project/component/viewComponents.jsp"%>
            </td>
        </tr>
    </table>

</body>
</html>
