<%-- 
	描述： 浏览用户组信息
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>Group Browser</h3>
                <p>The Group Browser allows you to browse all the groups in the system. You can also add and remove groups from here.</p>
                <p>Only System Administrators are allowed to delete or edit members of groups with the 'System Administrators' permission.</p>
                <a id="bulk_edit_groups" href="BulkEditUserGroups!default.jsp" class="btn btn-info btn-block">Bulk Edit Group Members</a>
            </div>
        </div>
        <div class=" row">
            <div class="col-md-12"><%@ include file="viewGroup.jsp"%></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <%@ include file="addGroup.jsp"%>
            </div>
        </div>
    </div>
</body>
</html>