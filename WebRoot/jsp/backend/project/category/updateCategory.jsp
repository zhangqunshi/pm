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
        var name = myForm.name.value;

        if (isNull(name)) {
            window.alert("错误：请填写ProjectCategory名称！");
            return false;
        }
    }
</script>
</head>
<body>
    <h2 class="formtitle">
        Edit ProjectCategory:
        <s:property value="name" />
    </h2>
    <form action="doUpdateCategory.jsp" name="myForm" onsubmit="return test();" class="bs-example bs-example-form" role="form">
        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input type="text" name="name" value=<s:property value="name"/> class="form-control" placeholder="twitterhandle"></input>
        </div>
        <div class="input-group">
            <span class="input-group-addon">描述</span>
            <input type="text" name="desc" value=<s:property value="description"/> class="form-control" placeholder="twitterhandle"></input>
        </div>
        <input type="hidden" value=<s:property value="id"/> name="id">
        <input type="submit" value="更新" class="btn btn-info btn-block">
        <input type="button" value="取消" onclick="location.href='viewProjectCategory.jsp'" class="btn btn-warning btn-block">
    </form>
</body>
</html>