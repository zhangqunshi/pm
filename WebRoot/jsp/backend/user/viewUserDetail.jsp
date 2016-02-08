<%-- 
	描述：用于显示用户详细信息 
	作者: 张博
	日期: 2009-1-5
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.*"%>
<html>
	<head>
		<link href="<%=request.getContextPath()%>/includes/css/main.css"
			media="all" rel="StyleSheet" type="text/css" />
	</head>

	<%
		request.setCharacterEncoding("UTF-8");
		
		User user = (User) request.getAttribute(Global.SESSION_USER);
		System.out.println("==doAddUser.jsp====user=" + user);
		if (user == null) {
			String username = request.getParameter("name");
			System.out.println("==doAddUser.jsp====username=" + username);
			if (username != null && !username.trim().equals("")) {
				UserBO userBO = new UserBO();
				user = userBO.getUser(username);
			}
		}
		if (user == null) {
			out.println("<html><body>Sorry, The user not found!</body></html>");
			return;
		}
	%>

	<body>


		<form action="#" method="post">
			<table cellspacing="6" cellpadding="0" border="0" width="100%"
				class="centred borderedBoxBlack">
				<tr>
					<td>
						<h3 class="formtitle">
							用户:
							<%=user.getFullName()%>
						</h3>
					</td>
				</tr>

				<%
					out.println("<tr><td align='left'><b>用户名: </b>" + user.getName()
							+ "</td></tr>");
					out.println("<tr><td align='left'><b>全名: </b>" + user.getFullName()
							+ "</td></tr>");
					out.println("<tr><td align='left'><b>E-mail: </b><a href='#'>"
							+ user.getEmail() + "</a></td></tr>");
					out.println("<tr><td align='left'><b>创建时间: </b>"
							+ user.getCreateDate() + "</td></tr>");
				%>
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
													+ "/images/icons/bullet_blue.gif' /> "
													+ secondUserGroupName.getName() + "<br>");
								}
							}
						%>
						<br />
					</td>
				</tr>

			</table>



			<p align="center">
				<b> <a
					href="../../frontend/issue/userDeploy.jsp?name=<%=user.getName()%>">View
						Public Profile</a> | <a
					href="../group/EditUserGroups!default.jsp?name=<%=user.getName()%>"
					id="editgroups_link">Edit Groups</a> | <a
					href="updateUser.jsp?id=<%=user.getId()%>">Edit Details</a> | <a
					href="changePassword.jsp?id=<%=user.getId()%>">Set Password</a> | <a
					href="userDeleteConfirm.jsp?id=<%=user.getId()%>"
					id="deleteuser_link">Delete User</a> </b>
			</p>
		</form>
	</body>
</html>
