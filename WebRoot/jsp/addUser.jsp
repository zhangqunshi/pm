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
    <br>
    <table cellspacing="0" cellpadding="0" width="400" class="centred borderedBoxBlack" align="center">
        <tbody>
            <tr>
                <td bgcolor="#003366">
                    <table cellspacing="0" cellpadding="6" border="0" width="400">
                        <tbody>
                            <tr>
                                <td bgcolor="#dddddd" colspan="2">
                                    <font color="#000000" size="3">
                                        <b>注册</b>
                                    </font>
                                </td>
                            </tr>

                            <form action="doAddUser.jsp" method="post" name="myForm" onsubmit="return test();">
                                <%@include file="/jsp/showErrorMessage.jsp"%>
                                <tr>
                                    <td class="simpleformheader" colspan="2" bgcolor="#eeeeee">请输入你的详细信息.</td>
                                </tr>

                                <tr>
                                    <td class="fieldLabelArea">用户名:</td>

                                    <td bgcolor="#ffffff" class="fieldValueArea">

                                        <input type="text" size="40" name="username" />

                                    </td>

                                </tr>

                                <tr>

                                    <td class="fieldLabelArea">密码:</td>

                                    <td bgcolor="#ffffff" class="fieldValueArea">


                                        <input type="password" size="40" name="password" />

                                    </td>

                                </tr>

                                <tr>

                                    <td class="fieldLabelArea">确认密码:</td>


                                    <td bgcolor="#ffffff" class="fieldValueArea">

                                        <input type="password" size="40" name="confirm" />

                                    </td>

                                </tr>

                                <tr>


                                    <td class="fieldLabelArea">全名:</td>

                                    <td bgcolor="#ffffff" class="fieldValueArea">


                                        <input type="text" size="40" name="fullname" />


                                    </td>

                                </tr>


                                <tr>

                                    <td class="fieldLabelArea">邮件:</td>

                                    <td bgcolor="#ffffff" class="fieldValueArea">

                                        <input type="text" size="40" name="email" />


                                    </td>

                                </tr>

                                <tr>
                                    <td class="fullyCentered simpleformfooter" colspan="2" bgcolor="#eeeeee">

                                        <input type="submit" class="spaced" title="按 Alt+S 提交" accesskey="S" value="注册" id="注册" name="注册" />

                                        <input type="button" onclick="location.href='/ProjectManagementSoftware/jsp/login.jsp'" value="取消" name="default.jsp" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
                                    </td>
                                </tr>

                                <script language="javascript">
                                                                                                                                    try {
                                                                                                                                        document.simpleform.elements[0]
                                                                                                                                                .focus();
                                                                                                                                    } catch (e) {
                                                                                                                                    }
                                                                                                                                </script>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
