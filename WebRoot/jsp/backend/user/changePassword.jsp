<%-- 
	描述：用于修改用户密码 
	作者: 张博
	日期: 2009-1-5
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>

<title>My JSP 'changePassword.jsp' starting page</title>
<script type="text/javascript">
    function test() {
        var confirm = myForm.confirm.value;
        var newpwd = myForm.newpwd.value;

        if (newpwd == "" || newpwd == null) {
            window.alert("错误：请填写新密码！");
            return false;
        }

        if (confirm == "" || confirm == null) {
            window.alert("错误：请填写确认密码！");
            return false;
        }

        if (confirm != newpwd) {
            window.alert("错误：密码输入不一致！");
            return false;
        }
    }
</script>
</head>

<body>
    <form name="myForm" action="doChangePassword.jsp" method="post" onsubmit="return test();">
    <input type="hidden" name="id" value="<s:property value="id"/>"/>
        
        新密码：
        <input type="password" name="newpwd">
        <br>
        确&nbsp;&nbsp;认
        <input type="password" name="confirm">
        <br>
        <input type="submit" value="确认" />
        <input type="button" value="取消" onclick="window.history.back();" />
    </form>
</body>
</html>
