<%-- 
	描述：修改项目类型
	作者: 张磊
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>

<html>
<body>
	<%
		ProjectBO pb = new ProjectBO();
		ProjectCategoryBO pcBO = new ProjectCategoryBO();
		String str = request.getParameter("projectId");
		System.out.println(str);
		int id = Integer.parseInt(str);
		String category = request.getParameter("categoryId");
		int categoryId = Integer.parseInt(category);
		Project project = pb.getProject(id);
		project.setCategoryId(pcBO.getProjectCategory(categoryId));
		System.out.println("============categoryId=======" + project.getCategoryId().getId());
		pb.updateProject1(project);
	%>
	<jsp:forward page="viewProjectDetail.jsp"></jsp:forward>
</body>
</html>
