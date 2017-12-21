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
<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
    <h3>Add Project Role</h3>
    <%
        out.println("<p><font color=red>" + error + "</font></p>");
    %>
    <form action="doAddRole.jsp" name="myForm" onsubmit="return test();">
        <table border="0">
            <tr>
                <td align="right">* 名称：</td>
                <td>
                    <input type="text" name="name" size="20" />
                </td>
            </tr>
            <tr>
                <td align="right">描述：</td>
                <td>
                    <input type="text" name="desc" size="50" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td align="right">
                    <input type="submit" value="AddProjectRole" />
                </td>
            </tr>
        </table>
    </form>
</div>
</html>
