<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("path==" + path + "basepath==" + basePath);
%>

<!-- 用于判断新建用户是否符合添加条件，添加成功后显示新建用户详细信息 -->
<html>
	<head>

	</head>

	<body>
		<%
			User user = new User();
			UserBO userBO = new UserBO();
			GroupBO groupBO = new GroupBO();
			String userName = request.getParameter("username");
			String password = request.getParameter("password");
			String fullName = request.getParameter("fullname");
			String email = request.getParameter("email");
			String createDate = StringUtils.toString(new java.util.Date());
			if (StringUtils.isBlank(userName) || StringUtils.isEmpty(userName)) {
				out.println("用户名不能为空<a href='" + basePath
						+ "jsp/addUser.jsp'>重新填写</a>");
			}
			if (StringUtils.isBlank(password) || StringUtils.isEmpty(password)) {
				out.println("密码不能为空<a href='" + basePath
						+ "jsp/addUser.jsp'>重新填写</a>");
			}
			user.setName(userName);
			user.setEmail(email);
			//user.setCreateDate(createDate);
			user.setFullName(fullName);
			user.setPassword(password);
			if (userBO.addUser(user)) { 
				if (groupBO.groupNameExit("users")) {
					Group group = groupBO.getGroup("users");
					User secondUser = userBO.getUser(userName);

					GroupUserBO groupUserBO = new GroupUserBO();
					GroupUser groupUser = new GroupUser();
					groupUser.setGroupId(group.getId());
					groupUser.setUserId(secondUser.getId());
					groupUserBO.addGroupUser(groupUser);
				}
				response.sendRedirect(path + "/jsp/login.jsp");
			} else {
				String error = "  用户名已存在.";
				request.setAttribute("error", error);
		%>
		<jsp:forward page="addUser.jsp"></jsp:forward>
		<%
			}
		%>
	</body>
</html>
