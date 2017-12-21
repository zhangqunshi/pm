<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<html>
<head>
<title><decorator:title default="项目管理软件 v0.1" /></title>
<link href="<%=request.getContextPath()%>/includes/css/main.css" media="all" rel="StyleSheet" type="text/css" />
<decorator:head />
</head>
<body>
    <%@include file="/decorators/top.jsp"%>
    <%@include file="/decorators/menu.jsp"%>

    <decorator:body />

</body>
</html>
