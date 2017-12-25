<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
    ProjectCategoryBO rb = new ProjectCategoryBO();
			ProjectCategoryhbm category = rb.getProjectCategory(Integer.parseInt(request.getParameter("id")));
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
            window.alert("错误：请填写ProjectCategory名称！");
            return false;
        }
    }
</script>
</head>
<body>

    <h2 class="formtitle">
        Edit ProjectCategory:
        <%=category.getName()%>
    </h2>

    <%
        String errMsg = (String) request.getAttribute("error");
        if (errMsg != null && errMsg != "") {
    %>
    <%=errMsg%>
    <%
        }
    %>

    <form action="doUpdateCategory.jsp" name="myForm" onsubmit="return test();" class="bs-example bs-example-form" role="form">

        <div class="input-group">
            <span class="input-group-addon">名称</span>
            <input type="text" name="name" value=<%=category.getName()%> class="form-control" placeholder="twitterhandle"></input>
        </div>


        <div class="input-group">
            <span class="input-group-addon">描述</span>
            <input type="text" name="desc" value=<%=category.getDescription()%> class="form-control" placeholder="twitterhandle"></input>
        </div>

        <input type="hidden" value=<%=category.getId()%> name="id">
        <input type="submit" value="更新" class="btn btn-info btn-block">

        <input type="button" value="取消" onclick="location.href='viewProjectCategory.jsp'" class="btn btn-warning btn-block">
    </form>

</body>
</html>

