<%-- 
	描述：创建新用户
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
<title>创建新用户</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/includes/css/main.css" media="all" rel="StyleSheet" type="text/css" />
<script language=javascript>
    function isNull(str) {
        if (str == "")
            return true;
        var regu = "^[ ]+$";
        var re = new RegExp(regu);
        return re.test(str);
    }
    function test() {
        var email = myForm.email.value;
        var username = myForm.username.value;
        var password = myForm.password.value;
        var confirm = myForm.confirm.value;
        var fullname = myForm.fullname.value;

        if (isNull(username)) {
            window.alert("错误：请填写用户名！");
            return false;
        }

        if (isNull(password)) {
            window.alert("错误：请填写密码！");
            return false;
        }

        if (isNull(confirm)) {
            window.alert("错误：请填写确认密码！");
            return false;
        }

        if (confirm != password) {
            window.alert("错误：密码输入不一致！");
            return false;
        }

        if (isNull(fullname)) {
            window.alert("错误：请填写全名！");
            return false;
        }

        if (isNull(email)) {
            window.alert("错误：请填写email！");
            return false;
        }
        if (!/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(email)) {
            window.alert("错误：mail格式不对，请重新输入！");
            myForm.email.focus();
            return false;
        }
    }
</script>

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <form class="form-horizontal" action="<%=path%>/jsp/doAddUser.jsp" method="post" name="myForm" onsubmit="return test()">
                    <%@include file="/jsp/showErrorMessage.jsp"%>
                    <div class="form-group">
                        <input type="text" class="form-control " name="username" placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" placeholder="密码">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="密码">
                    </div>

                    <div class="form-group">
                        <input type="text" class="form-control" name="fullname" placeholder="全名">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="email" placeholder="邮箱">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary col-md-12">注册</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script language="javascript">
                    try {
                        document.simpleform.elements[0].focus();
                    } catch (e) {
                    }
                </script>

</body>
</html>
