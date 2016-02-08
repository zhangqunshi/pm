<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%
	RoleBO rb = new RoleBO();
	Role role = rb
			.getRole(Integer.parseInt(request.getParameter("id")));
	String error = (String) request.getAttribute("error");
	if (error == null || error.equals("")) {
		error = "";
	}
%>
<html>
	<head>
		<script language=javascript>
		function isNull( str ){
          if ( str == "" ) return true;
          var regu = "^[ ]+$";
          var re = new RegExp(regu);
         return re.test(str);
        } 
            function test()
            {
                var name=myForm.name.value;
                
                if(isNull(name)){
                window.alert("错误：请填写ProjectRole名称！");
                return false;
                }
             }
		</script>
	</head>
	<body>
		<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
			<h2 class="formtitle">
				Edit Project Role:
				<%=role.getRoleName()%></h2>
			<%
				out.println("<p><font color='red'>" + error + "</font></p>");
			%>
			<form action="doUpdateRole.jsp" name="myForm"
				onsubmit="return test();">
				<input type="hidden" value="<%=role.getRoleId()%>" name="id">

				<table border="0">
					<tr>
						<td>
							名称:
						</td>
						<td>
							<input type="text" name="name" value="<%=role.getRoleName()%>" />
						</td>
					</tr>
					<tr>
						<td>
							描述:
						</td>
						<td>
							<input type="text" size="80" name="desc"
								value="<%=role.getRoleDesc()%>" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="更新">
							<input type="button"
								onclick="location.href='<c:url value="viewRoles.jsp"/>'"
								value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>

