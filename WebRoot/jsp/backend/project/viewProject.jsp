<%-- 
	描述：查看所有项目
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.List"%>

<html>
	<body>
		<h3 class="formtitle">
			Administration
		</h3>
		<p>
			Below is the list of all projects
		</p>
		<p>
			<img height="8" border="0" width="8"
				src="<%=request.getContextPath() %>/images/icons/bullet_creme.gif" />
			<b><a href="addProject.jsp" id="add_project">Add Project</a>
			</b>
		</p>
		<table border='1' width='100%'>
			<tr>
				<th>
					 项目
				</th>
				<th>
					Key
				</th>
				<th>
					网址
				</th>
				<th>
					项目负责人
				</th>
				<th>
					建立时间
				</th>
				<th>
					操作
				</th>
			</tr>
			<%
			ProjectBO pb = new ProjectBO();
			List list = pb.getProjectList();
			if (list != null) {
			for (int i = 0; i < list.size(); i++) {
				Project project = (Project) list.get(i);

				//判断URL是否是初始值，是的话把url的值改为'没有网页'
				String url = project.getUrl();
				out.println("<tr><td>");
				out.println("<a href='viewProjectDetail.jsp?projectId="+project.getProjectId()+"'>" + project.getName() + "</a>");
				out.println("</td>");
				out.println("<td>" + project.getProjectKey() + "</td>");
				if (url.equals("http://")) {
					out.println("<td>没有网址</td>");
				}else{
					out.println("<td><a href='"	+ project.getUrl() + "'>" + project.getUrl()+ "</a></td>");
				}
				
				out.println("<td><a href='#'>"	+ project.getLeader() + "</a></td>");
				out.println("<td>"	+ project.getCreateDate() + "</td>");
				out.println("<td width='150'>");
				out.println("<a href='viewProjectDetail.jsp?projectId=" + project.getProjectId() + "'>查看</a> | ");
				out.println("<a href='deleteProject.jsp?projectId=" + project.getProjectId() + "' onclick='return confirmDelete();'>删除</a> | ");
				out.println("<a href='updateProject.jsp?projectId=" + project.getProjectId() + "'>编辑</a>");
				out.println("</td></tr>");
			}
			}//endif
		%>
		</table>
	</body>
</html>
