<%-- 
	描述：显示用户列表 
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<html>
	<head>

	</head>

	<body>
		<h3 class="formtitle">
			User Browser
		</h3>
		<p>
			The User Browser allows you to browse all the users in the system.
			Filters allow you to limit the users that you see.
		</p>

		<p>
			<img height="8" border="0" width="8"
				src="<%=request.getContextPath()%>/images/icons/bullet_creme.gif" />
			<b><a href='<c:url value="/jsp/backend/user/addUser.jsp"/>'>Add
					User</a> </b>
		</p>

		<%@ include file="/jsp/showErrorMessage.jsp"%>

		<table border="1" width="100%">
			<tr>
				<th>
					用户名
				</th>
				<th>
					邮件
				</th>
				<th>
					全名
				</th>
				<th>
					组
				</th>
				<th clospan="2">
					操作
				</th>

			</tr>
			<%
				UserBO userBO = new UserBO();
				GroupBO groupBO = new GroupBO();
				String group = (String) request.getParameter("group");
				//System.out.println(group+"zu----------------");  
				if (StringUtils.isBlank(group)) { //查询出没有group参数传进来时,显示的组信息

					System.out.println("================group is null==========");
					List<User> list = userBO.viewUsers();
					if (list != null) {
						for (int i = 0; i < list.size(); i++) {
							User user = (User) list.get(i);
							out.println("<tr>");
							out.println("<td><a href='viewUserDetail.jsp?name="
									+ user.getName() + "'>" + user.getName()
									+ "</a></td>");
							out.println("<td><a href='#'>" + user.getEmail()
									+ "</a></td>");
							out.println("<td>" + user.getFullName() + "</td>");

							out.println("<td>");
							System.out.println("=================userId===="
									+ user.getId());

							List<Group> userGroupList = groupBO
									.getUserGroupName(user.getId());
							if (userGroupList == null || userGroupList.size() == 0) {
							} else {
								for (int j = 0; j < userGroupList.size(); j++) {
									Group firstUserGroupName = userGroupList.get(j); 
									out
											.println("<a href='"
													+ request.getContextPath()
													+ "/jsp/backend/group/viewGroupDetail.jsp?groupName="
													+ firstUserGroupName.getName()
													+ "'>"
													+ firstUserGroupName.getName()
													+ "</a><br>");
								}  
							}
							out.println("</td>");
							out.println("<td colspan='2'>");
							out
									.println("<a href='"
											+ request.getContextPath()
											+ "/jsp/backend/group/EditUserGroups!default.jsp?name="
											+ user.getName() + "'>组</a>");
							out.println("|<a href='" + request.getContextPath()
									+ "/jsp/backend/user/userDeleteConfirm.jsp?id="
									+ user.getId() + "'>删除</a>");
							out.println("|<a href='" + request.getContextPath()
									+ "/jsp/backend/user/updateUser.jsp?id="
									+ user.getId() + "'>编辑</a></td></tr>");

						} //endfor  
					}//endif
				} else { //查询出有group参数传进来时,显示的组信息
					Group userGroup = groupBO.getUserGroup(group);
					List<User> userGroupList = new ArrayList<>(userGroup.getUsers());
					
					System.out.println("===================93=userGroupList===="
							+ userGroupList); 
					for (int k = 0; k < userGroupList.size(); k++) {
						User groupAndUser = userGroupList.get(k); 						
																	
						if (StringUtils.isBlank(groupAndUser.getName())) {   //改
							System.out
									.println("===================93=groupAndUser.getUserName() is null====");
						} else {
							out.println("<tr>");
							out.println("<td><a href='#'>"
									+ groupAndUser.getName() + "</a></td>"); 
							out.println("<td><a href='#'>"
									+ groupAndUser.getEmail() + "</a></td>");
							out.println("<td>" + groupAndUser.getFullName()
									+ "</td>");
 
							out.println("<td>");
							List<Group> secondUserGroupList = groupBO
									.getUserGroupName(groupAndUser.getId());

							if (secondUserGroupList == null
									|| secondUserGroupList.size() == 0) {
								System.out
										.println("====================secondUserGroupList is null====");
							} else {
								for (int j = 0; j < secondUserGroupList.size(); j++) {
									Group secondUserGroupName = secondUserGroupList
											.get(j);
									out
											.println("<a href='"
													+ request.getContextPath()
													+ "/jsp/backend/group/viewGroupDetail.jsp?groupName="
													+ secondUserGroupName.getName()
													+ "'>"
													+ secondUserGroupName.getName()
													+ "</a><br>");
								}
							}
							out.println("</td>");
							out.println("<td colspan='2'>");
							out
									.println("<a href='"
											+ request.getContextPath()
											+ "/jsp/backend/group/EditUserGroups!default.jsp?name="
											+ groupAndUser.getName()
											+ "'>组</a>");
							out.println("|<a href='" + request.getContextPath()
									+ "/jsp/backend/user/userDeleteConfirm.jsp?id="
									+ groupAndUser.getId() + "'>删除</a>");
							out.println("|<a href='" + request.getContextPath()
									+ "/jsp/backend/user/updateUser.jsp?id="
									+ groupAndUser.getId()
									+ "'>编辑</a></td></tr>");
						}
					}
				}
			%>

		</table>
	</body>
</html>
