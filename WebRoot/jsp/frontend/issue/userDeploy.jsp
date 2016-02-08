<%-- 
	描述： 用户配置
	作者: 张博
	日期: 2008-12-31
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
	<%
		String username = request.getParameter("name");
		UserBO userBO = new UserBO();
		User user = userBO.getUser(username);
	%>

	<body>
		<table class="menu" border="0" cellpadding="0" cellspacing="0"
			width="100%">
			<tr>
				<td bgcolor="#3c78b5">

				</td>
			</tr>
		</table>

		<!--This should always be included as it is not part of a themable plugin, instead it is core functionality-->
		<table cellpadding="4" cellspacing="0" border="0" width="100%"
			bgcolor="#bbbbbb" style="border-bottom: 1px solid #bbb;">
			<tr>
				<td bgcolor="#f0f0f0" colspan="2">
					<h3 class="formtitle">
						用户配置 :
						<%=user.getName()%>
					</h3>
				</td>

			</tr>
		</table>
		<table cellpadding="0" cellspacing="0" border="0" width="20%">
			<tr>
				<td width="200" bgcolor="#f0f0f0" valign="top"
					style="border-right: 1px solid #cccccc;">
					<div class="vcard">
						<table cellpadding="3" cellspacing="0" border="0">
							<tr>
								<td valign=top>
									<b>用户名:</b>
									<br>
									<%=user.getName()%>
								</td>
							</tr>
							<tr>
								<td valign=top>
									<b>全名:</b>
									<br>
									<span class="fn"><%=user.getFullName()%></span>
								</td>
							</tr>
							<tr>
								<td valign=top>
									<b>邮件:</b>
									<br>
									<span class="email"><a
										href=mailto:<%=user.getEmail()%>><%=user.getEmail()%></a>
									</span>
								</td>
							</tr>
							<tr>
								<td align="left" valign="top">
									<br />
									<b>组:</b>
									<%
										out.println("<br />");
										GroupBO groupBO = new GroupBO();
										List<Group> secondUserGroupList = groupBO.getUserGroupName(user
												.getId());

										if (secondUserGroupList == null || secondUserGroupList.size() == 0) {
											System.out
													.println("====================secondUserGroupList is null====");
										} else {
											for (int j = 0; j < secondUserGroupList.size(); j++) {
												Group secondUserGroupName = secondUserGroupList.get(j);
												out
														.println("<img height='8' border='0' align='absmiddle' width='8' alt='' src='"
																+ request.getContextPath()
																+ "/images/icons/bullet_blue.gif' />"
																+ secondUserGroupName.getName() + "<br>");
											}
										}
									%>
									<br />
								</td>
							</tr>
						</table>
					</div>
	</body>
</html>