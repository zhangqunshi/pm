<!-- 获得更新的用户信息 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
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
<%
    String path = request.getContextPath();
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));

    UserBO userBO = new UserBO();
    Userhbm user = userBO.getUser(id);
%>

<body>
    <h2 class="formtitle">
        Edit Project User:
        <%=user.getName()%></h2>
    Update the user's details below.
    <form action="doUpdateUser.jsp" name="myForm" onsubmit="return test();">
        <input type="hidden" value="<%=user.getId()%>" name="id">

        <table border="0" align="left" width="90%">
            <tr>
                <td align="right">全名:</td>
                <td>
                    <input name='fullname' type='text' size="50" value="<%=user.getFullName()%>">
                </td>
            </tr>
            <tr>
                <td align="right">E-mail:</td>
                <td>
                    <input name='email' type='text' size="50" value="<%=user.getEmail()%>">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type='submit' value='更新'>
                    <input type="button" onclick="window.history.back();" value="取消" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
