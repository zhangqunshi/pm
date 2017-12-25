<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<p></p>
<html>
<head>
<%
    String error = (String) request.getParameter("error");
			if (error == null || error.equals("")) {
				error = "";
			}
%>
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
            window.alert("错误：请填写角色名称！");
            return false;
        }

    }
</script>
</head>
<div class="container">

    <div class="row">
        <div class="col-md-12">
            <h3>Add Project Role</h3>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <%
                out.println("<p><font color=red>" + error + "</font></p>");
            %>
            <form action="doAddRole.jsp" name="myForm" onsubmit="return test();" class="bs-example bs-example-form" role="form">

                <div class="input-group">
                    <span class="input-group-addon">* 名称</span>
                    <input type="text" name="name" class="form-control" placeholder="name" />
                </div>


                <div class="input-group">
                    <span class="input-group-addon">描述</span>
                    <input type="text" name="desc" class="form-control" placeholder="descript" />
                </div>

                <input type="submit" value="AddProjectRole" class="btn btn-info btn-block" />

            </form>

        </div>

    </div>

</div>





</html>
