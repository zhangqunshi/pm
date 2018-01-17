<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.User"%>
<%@ page import="com.nastation.pm.*"%>
<!DOCTYPE html>
<html>
<head>

<script src="/pmhb/includes/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body >


    <%
        User user = (User) session.getAttribute(Global.SESSION_USER);
        if (user != null) {

        }
    %>


    <nav class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">项目管理软件 v1.0</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="<%=request.getContextPath()%>/jsp/frontend/dashboard.jsp">
                            <span class="glyphicon glyphicon-home"></span>
                            首页
                        </a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/jsp/frontend/issue/issueNavigator.jsp?createNew=false">查找问题</a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/jsp/frontend/issue/addIssueStep1.jsp">创建问题</a>
                    </li>

                    <%
                        if (user.isAdmin()) {
                    %>
                    <li>
                        <a href="<%=request.getContextPath()%>/jsp/backend/project/viewProject.action">管理</a>
                    </li>
                    <%
                        }
                    %>



                </ul>
            </div>

            <div class="col-md-offset-10">

                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/pmhb/images/su1.jpg" height="30" width=30>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">我的主页</a>
                            </li>


                            <li>
                                <a href="<%=request.getContextPath()%>/jsp/logout.jsp" class="btn btn-default btn-lg">
                                    <span class="glyphicon glyphicon-off"></span>
                                </a>
                            </li>
                        </ul>

                    </li>
                    <li></li>

                </ul>


            </div>
        </div>
    </nav>
























</body>
</html>