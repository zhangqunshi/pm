<%-- 
	描述： 新建项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>

<%
	ProjectUserBO pub = new ProjectUserBO();
	String projectId = request.getParameter("projectUserId");
	System.out.println("=====8=projectId===" + projectId);
	int projectId2 = Integer.parseInt(projectId);
	ProjectUser projectUser = pub.getProjectUser(projectId2);
	ProjectBO projectBo = new ProjectBO();
	UserBO userBo = new UserBO();
	RoleBO roleBo = new RoleBO();
	Project project = new Project();
	project = projectBo.getProject(projectUser.getProjectId());
	System.out.println("===========project===" + project);
	System.out.println("===========projectName===" + project.getName());
	List<User> userList = new ArrayList<User>();
	List<Role> roleList = new ArrayList<Role>();
	userList = userBo.viewUsers();
	roleList = roleBo.getRoleList();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<body>
		<form action="doUpdateProjectUser.jsp">
			project Name:
			<input type="text" name="name" value="<%=project.getName()%>"
				readonly="readonly" />
			<input type="hidden" name="projectId"
				value="<%=projectUser.getProjectId()%>" />
			<br>
			<br>
			User Name:
			<%
				if (userList == null || userList.size() == 0) {
					out.println("<select name='userId'><option></option></select>");
					out.println("<a href='../../user/addUser.jsp'>Add User</a>");
				} else {
					out.println("<select name='userId'>");
					for (int i = 0; i < userList.size(); i++) {
						User user = new User();
						user = userList.get(i);
						if (user.getId() == projectUser.getUserId()) {
							out.println("<option selected value='" + user.getId()
									+ "'>" + user.getName() + "</option selected>");
						} else {
							out.println("<option value='" + user.getId() + "'>"
									+ user.getName() + "</option>");
						}
					}
					out.println("</select>");
				}
			%>
			<br>
			<br>
			Role Name:
			<%
				if (roleList == null || roleList.size() == 0) {
					out.println("<select name='roleId'><option></option></select>");
					out.println("<a href='../../user/addRole.jsp'>Add Role</a>");
				} else {
					out.println("<select name='roleId'>");
					for (int i = 0; i < roleList.size(); i++) {
						Role role = new Role();
						role = roleList.get(i);
						if (role.getRoleId() == projectUser.getUserId()) {
							out.println("<option selected value='"
									+ role.getRoleId() + "'>" + role.getRoleName()
									+ "</option selected>");
						} else {
							out.println("<option value='" + role.getRoleId() + "'>"
									+ role.getRoleName() + "</option>");
						}
					}
					out.println("</select>");
				}
			%>
			<br>
			<br>
			<input type="hidden" value=<%=projectUser.getProjectUserId()%>
				name="projectUserId">
			<input type="submit" value="更新">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset" value="取消">
		</form>
	</body>
</html>
