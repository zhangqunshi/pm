<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%
	ProjectCategoryBO rb = new ProjectCategoryBO();
	ProjectCategory category = rb.getProjectCategory(Integer.parseInt(request.getParameter("id")));
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
	<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
		<h2 class="formtitle">
			Edit ProjectCategory:
			<%=category.getName()%>
		</h2>
		<br>
		<%
			String errMsg = (String) request.getAttribute("error");
			if (errMsg != null && errMsg != "") {
		%>
		<%=errMsg%>
		<%
			}
		%>
		</br>
		<form action="doUpdateCategory.jsp" name="myForm"
			onsubmit="return test();">
			&nbsp;&nbsp;&nbsp;&nbsp;名称: <input type="text" name="name"
				value=<%=category.getName()%>></input> <br> <br>
			&nbsp;&nbsp;&nbsp;&nbsp;描述: <input type="text" size="50" name="desc"
				value=<%=category.getDescription()%>></input> <br> <br> <input
				type="hidden" value=<%=category.getId()%> name="id"> <input
				type="submit" value="更新"> &nbsp;&nbsp;&nbsp;&nbsp; <input
				type="button" value="取消"
				onclick="location.href='viewProjectCategory.jsp'">
		</form>
	</div>
</body>
</html>

