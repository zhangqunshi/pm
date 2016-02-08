<%-- 
    Document   : login
    Created on : 2008-12-18
    Author     : 孙重阳
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登陆页面</title>
		<link href="<%=request.getContextPath()%>/includes/css/main.css"
			media="all" rel="StyleSheet" type="text/css" />
		<script type="text/javascript">
            function check(){
                var username=myForm.username.value;
                var password=myForm.password.value;
                if(username==""){
                   window.alert("错误:请填写用户名！");
                   return false;
                }
                if(password==""){
                  window.alert("错误：请填写密码！");
                  return false;
                }
            }
        </script>
	</head>
	<body>
		<div>
			&nbsp;
		</div>

		<table cellspacing="0" cellpadding="6" border="0" width="400"
			class="centred borderedBoxBlack">
			<tr>
				<td bgcolor="#dddddd" align="left">
					<font color="#000000" size="3"><b>项目管理软件</b> </font>
				</td>
			</tr>
			<tr>
				<td bgcolor="#ffffff">



					<form action="<%=path%>/jsp/checkLogin.jsp" method="post"
						name="myForm" onsubmit="return check()">
						<%@include file="/jsp/showErrorMessage.jsp"%>
						<table cellspacing="0" cellpadding="4" border="0" align="center">
							<tr>
								<td align="right" width="25%" valign="middle">
									<b>用户名</b>
								</td>
								<td valign="middle">
									<input type="text" accesskey="u" tabindex="1" size="25"
										name="username" style="width: 12em;" />
								</td>
							</tr>

							<tr>
								<td align="right" width="25%" valign="middle">
									<b>密码</b>
								</td>
								<td valign="middle">
									<input type="password" accesskey="p" tabindex="2" size="25"
										name="password" style="width: 12em;" />
									 
								</td>
							</tr>

							<tr>
								<td align="center" valign="middle" colspan="2">
									<input type="submit" tabindex="4" value="登录" name="submit" "/>
								</td>
							</tr>

							<tr>
								<td valign="middle" colspan="2">
									<br />
									<br />

									还没注册?
									<b><a
										href="/ProjectManagementSoftware/jsp/addUser.jsp"
										id="signup">注册</a> </b> 帐号.

								</td>
							</tr>
						</table>

					</form>


					<script type="text/javascript" language="javascript">
						document.loginform.elements[0].focus();
					</script>

				</td>
			</tr>
		</table>
	</body>
</html>

