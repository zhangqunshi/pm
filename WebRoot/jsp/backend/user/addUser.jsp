<%-- 
	描述：创建新用户
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>创建新用户</title>
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
            <div class="col-md-12">
                <h3 class="formtitle">Create New User</h3>
                <p>Enter the new user's details below.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <font color="red">
                    <s:property value="fail" />
                </font>
                <form action="doAddUser.jsp" method="post" name="myForm" onsubmit="return test();" class="bs-example bs-example-form" role="form">

                    <div class="input-group">
                        <span class="input-group-addon">用户名</span>
                        <input type="text" name="username" class="form-control" placeholder="username">
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon">密码</span>
                        <input type="password" name="password" class="form-control" placeholder="password">
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon">确认密码</span>
                        <input type="password" name="confirm" class="form-control" placeholder="confirm">
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon">全名</span>
                        <input type="text" name="fullname" class="form-control" placeholder="fullname">
                    </div>

                    <div class="input-group">
                        <span class="input-group-addon">@邮箱地址</span>
                        <input type="text" name="email" size="30" class="form-control" placeholder="email">
                    </div>

                    <div>
                        <input type="submit" value="创建" class="btn btn-info btn-block" />
                        <input type="button" onclick="location.href='viewUser.jsp'" value="取消" class="btn btn-info btn-block" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>