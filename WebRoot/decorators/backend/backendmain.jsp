<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>

<!DOCTYPE html>
<html>
<head>
<title><decorator:title default="项目管理软件 v0.1" /></title>
<link href="<%=request.getContextPath()%>/includes/css/main.css" media="all" rel="StyleSheet" type="text/css" />
<decorator:head />

<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body onload="load()">
    <%@include file="../top.jsp"%>
    <%@include file="../menu.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <%@include file="leftmenu.jsp"%>

            </div>
            <div class="col-md-6">
                <decorator:body />
            </div>
        </div>

    </div>










</body>
</html>
