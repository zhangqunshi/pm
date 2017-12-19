<%-- 
	描述：查看单个项目详细信息
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>  
	<%  String path=request.getContextPath();
		String projectId = request.getParameter("projectId");
		System.out.println("===============projectId======" + projectId);
		int pid = Integer.parseInt(projectId);
		System.out.println(pid+"========= 项目id");
		ProjectBO pb = new ProjectBO();
		Project project = pb.getProject(pid);
		PermissionSchemeBO psBO = new PermissionSchemeBO();
		PermissionScheme ps=psBO.getScheme(project.getPermissionSchemeId().getId()); //修改 
	%>

	<body>
		<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
			<table border="0">
				<tr>
					<td>
						<h3 class="formtitle">
							项目:
							<%=project.getName()%></h3>
					</td>
				</tr>
				<tr>
					<td>

						<b>Key: </b><%=project.getProjectKey()%>
						<br>
						<b>网址: </b>
						<% 
						String url = project.getUrl();
						if (url.equals("http://")) {
							out.println("没有网址");
						}else{
							out.println("<a href='"	+ project.getUrl() + "'>" + project.getUrl()+ "</a>");
						}%><br>
						<b>负责人: </b><%=project.getLeader()%>
						<br>
						<b>Project Roles : </b>
						<a
							href="<%=request.getContextPath()%>/jsp/backend/project/user/viewProjectUser.jsp?projectId=<%=pid%>">
							View members </a>
						<br>
						<b>Permission Scheme: </b> <%=ps.getName() %> (
						<a href="<%=path %>/jsp/backend/permission/selectProjectPermissionScheme.jsp?projectId=<%=pid %>">选择</a>
						|
						<a href="<%=path %>/jsp/backend/permission/editPermissions.jsp?schemeId=<%=ps.getId() %>">编辑</a> )
						<br />
						<b>描述: </b><%=project.getDescription()%> 
						<br>
						
						<%
							//判断项目类型是否为空
							if (project.getCategoryId() == null) {
								out.println("<b>Category: </b> 无(<a href='"+path+"/jsp/backend/project/category/viewProjectCategoryForProject.jsp?projectId="
												+ project.getProjectId()
												+ "'> Select Category</a>)");
							} else {
								ProjectCategoryBO pc = new ProjectCategoryBO();
								ProjectCategory category = pc.getProjectCategory(project
										.getCategoryId().getId()); 							//getId()修改
								out.println("<b>Project Category: </b>"
												+ category.getName()
												+ "(<a href='"+path+"/jsp/backend/project/category/viewProjectCategoryForProject.jsp?projectId="
												+ project.getProjectId()
												+ "'> Select Category</a>)");
							}
						%>
					</td>

				</tr>
			</table>
		</div>
		<table>
			<tr>
				<td>
					<a href="<%=path %>/jsp/backend/project/viewProject.jsp">浏览项目</a> |
					<a
						href="<c:url value='/jsp/backend/project/updateProject.jsp'/>?projectId=<%=projectId%>">Edit
						Project</a> |
					<a
						href="<c:url value='/jsp/backend/project/deleteProject.jsp'/>?projectId=<%=projectId%>">Delete
						Project</a>
				</td>
			</tr>
		</table>

		<table>
			<tr>
				<td>
					<%@ include file="/jsp/backend/project/component/viewComponents.jsp" %>
				</td>
			</tr>
		</table>

	</body>
</html>
