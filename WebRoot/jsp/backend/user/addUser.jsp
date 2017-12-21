<%-- 
	描述：创建新用户
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
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
    <div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
        <h3 class="formtitle">Create New User</h3>
        <p>Enter the new user's details below.</p>
        <%
            String fail = request.getParameter("fail");
            if (StringUtils.isBlank(fail)) {
                fail = "";
            }
            out.println("<font color='red'>" + fail + "</font>");
        %>
        <form action="doAddUser.jsp" method="post" name="myForm" onsubmit="return test();">
            <table border="0" align="center">
                <tr>
                    <td align="right">用户名：</td>
                    <td>
                        <input type="text" name="username">
                    </td>
                </tr>
                <tr>
                    <td align="right">密码：</td>
                    <td>
                        <input type="password" name="password">
                    </td>
                </tr>
                <tr>
                    <td align="right">确认：</td>
                    <td>
                        <input type="password" name="confirm">
                    </td>
                </tr>
                <tr>
                    <td align="right">全名：</td>
                    <td>
                        <input type="text" name="fullname">
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">Email：</td>
                    <td>
                        <input type="text" name="email" size="30">
                        如：zhangqunshi@126.com
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input type="submit" value="创建">
                        <input type="button" onclick="location.href='viewUser.jsp'" value="取消" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
