<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>


<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h3 class="text-primary">项目</h3>
            <ul class="nav nav-pills nav-stacked">
                <li >
                    <a href='<c:url value="/jsp/backend/project/viewProject.jsp" />'>项目浏览</a>
                </li>
                <li>
                    <a href='<c:url value="/jsp/backend/project/category/viewProjectCategory.jsp" />'>项目分类</a>
                </li>

            </ul>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <h3 class="text-primary">Users,Groups & Roles</h3>
            <ul class="nav nav-pills nav-stacked">
                <li >
                    <a href='<c:url value="/jsp/backend/user/viewUser.jsp" />'>用户浏览</a>
                </li>
                <li>
                    <a href='<c:url value="/jsp/backend/group/GroupBrowser.jsp" />'>组浏览</a>
                </li>
                <li>
                    <a href='<c:url value="/jsp/backend/role/viewRoles.jsp" />'>角色浏览</a>
                </li>

            </ul>

        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <h3 class="text-primary">Issue Settings</h3>
            <ul class="nav nav-pills nav-stacked">
                <li >
                    <a href='<c:url value="/jsp/backend/issue/type/viewIssueType.jsp" />'>Issue Types</a>
                </li>
                <li>
                    <a href='<c:url value="/jsp/backend/issue/priority/viewIssuePriority.jsp" />'>Priority</a>
                </li>
                <li>
                    <a href='<c:url value="/jsp/backend/issue/resolution/viewResolutions.jsp" />'>Resolutions</a>
                </li>
                <li>
                    <a href='<c:url value="/jsp/backend/issue/status/viewIssueStatus.jsp" />'>Status</a>
                </li>

            </ul>

        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <h3 class="text-primary">Schemes</h3>
            <ul class="nav nav-pills nav-stacked">
                <li >
                    <a href='<c:url value="/jsp/backend/permission/viewPermissionSchemes.jsp" />'>Permission Schemes</a>
                </li>

            </ul>
  
        </div>

    </div>
</div>