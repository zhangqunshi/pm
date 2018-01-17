<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%
    RoleBO rb = new RoleBO();
			Rolehbm role = rb.getRole(Integer.parseInt(request.getParameter("id")));
			String error = (String) request.getAttribute("error");
			if (error == null || error.equals("")) {
				error = "";
			}
%>
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
            window.alert("错误：请填写ProjectRole名称！");
            return false;
        }
    }
</script>
</head>
<body>

    <h2 class="formtitle">
        Edit Project Role:
        <s:property value="name"/></h2>
    <%
        out.println("<p><font color='red'>" + error + "</font></p>");
    %>
    <form action="doUpdateRole.jsp" name="myForm" onsubmit="return test();" class="bs-example bs-example-form" role="form">
        <input type="hidden" value="<s:property value="id"/>" name="id">


        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input type="text" name="name" value="<s:property value="name"/>" class="form-control" placeholder="twitterhandle" />
        </div>

        <div class="input-group">
            <span class="input-group-addon">描述</span>
            <input type="text" size="80" name="desc" value="<s:property value="desc"/>" class="form-control" placeholder="twitterhandle" />
        </div>

        <input type="submit" value="更新" class="btn btn-info btn-block">
        <input type="button" onclick="location.href='<c:url value="viewRoles.jsp"/>'" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" class="btn btn-warning btn-block" />
    </form>
</body>
</html>