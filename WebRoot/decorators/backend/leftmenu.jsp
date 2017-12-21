<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<table border="0" width="100%">
    <tr>
        <td>
            <h3>项目</h3>
            <a href='<c:url value="/jsp/backend/project/viewProject.jsp" />'>项目浏览</a>
            <br>
            <a href='<c:url value="/jsp/backend/project/category/viewProjectCategory.jsp" />'>项目分类</a>
        </td>
    </tr>
    <tr>
        <td>
            <h3>Users,Groups & Roles</h3>
            <a href='<c:url value="/jsp/backend/user/viewUser.jsp" />'>用户浏览</a>
            <br>
            <a href='<c:url value="/jsp/backend/group/GroupBrowser.jsp" />'>组浏览</a>
            <br>
            <a href='<c:url value="/jsp/backend/role/viewRoles.jsp" />'>角色浏览</a>
        </td>
    </tr>
    <tr>
        <td>
            <h3>Issue Settings</h3>
            <a href='<c:url value="/jsp/backend/issue/type/viewIssueType.jsp" />'>Issue Types</a>
            <br>
            <a href='<c:url value="/jsp/backend/issue/priority/viewIssuePriority.jsp" />'>Priority</a>
            <br>
            <a href='<c:url value="/jsp/backend/issue/resolution/viewResolutions.jsp" />'>Resolutions</a>
            <br>
            <a href='<c:url value="/jsp/backend/issue/status/viewIssueStatus.jsp" />'>Status</a>
        </td>
    </tr>
    <tr>
        <td>
            <h3>Schemes</h3>
            <a href='<c:url value="/jsp/backend/permission/viewPermissionSchemes.jsp" />'>Permission Schemes</a>
            <br>
        </td>
    </tr>
</table>