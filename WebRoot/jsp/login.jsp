<%-- 
    Document   : login
    Created on : 2008-12-18
    Author     : 孙重阳
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/includes/css/main.css" media="all" rel="StyleSheet" type="text/css" />
<script type="text/javascript">
    function check() {
        var username = myForm.username.value;
        var password = myForm.password.value;
        if (username == "") {
            window.alert("错误:请填写用户名！");
            return false;
        }
        if (password == "") {
            window.alert("错误：请填写密码！");
            return false;
        }
    }
</script>

<style type="text/css">

.top { margin-top: 200px; }
</style>


</head>
<body style="background-image: url(/pmhb/images/bg3.jpg); background-repeat: no-repeat;background-size: 100% 100%; background-size: 50xp 50xp;">
    <div>&nbsp;</div>



    <%
        String choice = request.getParameter("choice");
    %>

    <div class="container top">
        <div class="row">
            <div class="form-group">
                <h3 class="form-title text-center">项目管理软件</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-1 col-md-offset-5">
                <a class="btn btn-link btn-lg" href="<%=path%>/jsp/login.jsp?choice=ok" style='color: #9e9e9e'>注册</a>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <a class="btn btn-link btn-lg" href="<%=path%>/jsp/login.jsp" style='color: #9e9e9e'> 登入 </a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <%
                    if (choice != null) {
                %>
                <jsp:include page="${path}/jsp/addUser.jsp" />
                <%
                    } else {
                %>

                <form class="form-horizontal" action="<%=path%>/jsp/checkLogin.jsp" method="post" name="myForm" onsubmit="return check()">
                    <%@include file="/jsp/showErrorMessage.jsp"%>
                    <div class="form-group">
                        <input type="text" id="inputSuccess" class="form-control " name="username" placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <input type="password" id="inputWarning" class="form-control" name="password" placeholder="密码">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary col-md-12">Login</button>
                    </div>
                </form>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <script type="text/javascript" language="javascript">
                    document.loginform.elements[0].focus();
                </script>


</body>
</html>

