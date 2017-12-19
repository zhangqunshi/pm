<%-- 
	描述： 查看项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%
	String projectIdStr = request.getParameter("projectId");
	if (projectIdStr == null || projectIdStr.equals("")) {
		out.println("项目ID不能为空");
		return;
	}
	int projectId = Integer.parseInt(projectIdStr);
	System.out.println("====18===projectId===" + projectId);

	ProjectBO projectbo = new ProjectBO();
	Project project = new Project();
	project = projectbo.getProject(projectId);
%>
<html>
	<head>

	</head>
	<body>
		<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
			<h3>
				Manage Project Role Membership for Project:
				<%=project.getName()%></h3>
			<p>
				On this page you can manage project role membership for the
				<a href="<%=request.getContextPath()%>/jsp/backend/project/viewProjectDetail.jsp?projectId=<%=projectId%>"><b><%=project.getName()%></b></a> project.
			</p>
		</div>
		<p></p>
		<table border='1' width='100%'>
			<tr>
				<th width="200">
					Role
				</th>
				<th>
					Users
				</th>
			</tr> 
			<%
				//get all roles
				RoleBO rb = new RoleBO();
				List<Role> list = rb.getRoleList();

				if (list != null) {

					//显示所有的角色
					for (int i = 0; i < list.size(); i++) {
						Role role = (Role) list.get(i);
						out.println("<tr>");
						out.println("<td><b>" + role.getRoleName() + "</b>");
						out.println("<br>" + role.getRoleDesc() + "</td>");
						out.println("<td>");

						//根据角色查找 属于这个项目的 用户
						ProjectUserBO projectUserBO = new ProjectUserBO();
						List<ProjectUser> projectUserList = projectUserBO
								.getProjectUserByProjectIdRoleId(project
										.getProjectId(), role.getRoleId());

						if (projectUserList == null || projectUserList.size() == 0) {
							out.println("None selected. ");
						} else {

							//显示所有属于这个项目的用户
							for (int j = 0; j < projectUserList.size(); j++) {
								ProjectUser projectUser = projectUserList.get(j);
								if (j == 0) {
									out.println(projectUser.getUsername());
								} else {
									out.println("," + projectUser.getUsername());
								}
							}
						}
						out.println("<a href='addProjectUser.jsp?projectId="
								+ project.getProjectId() + "&roleId="
								+ role.getRoleId() + "'>编辑</a>");
						out.println("</td></tr>");
					}
				}//endif
			%>
		</table>
	</body>
</html>