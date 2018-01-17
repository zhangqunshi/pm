<!-- 获得更新的用户信息 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
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
        var fullname = myForm.fullname.value;

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
                <h2 class="formtitle">
                    Edit Project User:
                    <s:property value="name"/></h2>
                Update the user's details below.
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <form action="doUpdateUser.jsp" name="myForm" onsubmit="return test();" class="bs-example bs-example-form" role="form">
                    <input type="hidden" value="<s:property value="id"/>" name="id">



                    <div class="input-group">
                        <span class="input-group-addon">全名</span>
                        <input name='fullname' type='text' size="50" value="<s:property value="name"/>" class="form-control" placeholder="twitterhandle">
                    </div>


                    <div class="input-group">
                        <span class="input-group-addon">邮箱地址</span>
                        <input name='email' type='text' size="50" value="<s:property value="email"/>" class="form-control" placeholder="twitterhandle">
                    </div>


                    <input type='submit' value='更新' class="btn btn-info btn-block">
                    <input type="button" onclick="window.history.back();" value="取消" class="btn btn-warning btn-block" />

                </form>

            </div>

        </div>

    </div>





</body>
</html>
