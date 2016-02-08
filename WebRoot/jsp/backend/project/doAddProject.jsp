<%-- 
	描述： 新建项目
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>

<%
	//获得参数
	System.out.println("=========doAddProject.jsp=============");
	String name = request.getParameter("name");
	String projectKey = request.getParameter("projectKey");

	String description = request.getParameter("description");
	String url = request.getParameter("url");
	String leader = request.getParameter("lead");
	String schemeIdStr = request.getParameter("permission_scheme_id");
	String createDate = StringUtils.toString(new java.util.Date());
	//	String category = request.getParameter("category");  //新建项目时，并不马上选择

	//检查参数
	int schemeId = 0;
	if (StringUtils.isNotBlank(schemeIdStr)) {
		schemeId = Integer.parseInt(schemeIdStr);
	}
	boolean hasError = false;
	String errMsg = "";
	if (StringUtils.isBlank(name)) {
		hasError = true;
		errMsg += "Project name can't be empty!";
	}
	if (StringUtils.isBlank(projectKey)) {
		hasError = true;
		errMsg += "ProjectKey  can't be empty!";
	}
	if (StringUtils.isBlank(leader)) {
		hasError = true;
		errMsg += "Leader  can't be empty!";
	}

	//判断项目是否有重名
	ProjectBO pb = new ProjectBO();
	UserBO user = new UserBO();
	Project project = new Project();
	project.setName(name);
	projectKey = projectKey.toUpperCase();
	project.setProjectKey(projectKey);
	project.setUrl(url);
	project.setCreateDate(createDate);
	project.setDescription(description);
	project.setLeader(leader);
	project.setPermissionSchemeId(schemeId);
	boolean existName = pb.existName(project);
	boolean existKey = pb.existKey(project);
	if (!user.exist(leader)) {
		hasError = true;
		errMsg += "leader no exists!";
	}
	if (existName) {
		hasError = true;
		errMsg += "Project Name already exists!";
	}
	if (existKey) {
		hasError = true;
		errMsg += "Project Key already exists!";
	}
	

	if (hasError) {
	request.setAttribute("error", errMsg);
%>
<jsp:forward page="addProject.jsp"></jsp:forward>
<%
	}

	//保存Project信息
	pb.addProject(project);
	int id = pb.getProjectId(name);
	response.sendRedirect(request.getContextPath()
			+ "/jsp/backend/project/viewProjectDetail.jsp?projectId="
			+ id);
%>

