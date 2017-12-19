<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%
	String name = request.getParameter("name");
	String description = request.getParameter("description");
	String leader = request.getParameter("lead");
	int id = Integer.parseInt(request.getParameter("projectId"));
	if (StringUtils.isBlank(name)) {
		String error2 = "The component name specified is invalid - cannot be an empty string.";
		request.setAttribute("error", error2);
%>
<jsp:forward page="addProjectComponent.jsp"></jsp:forward>
<%
	}
	System.out.println("===name===" + name);
	System.out.println("===id===" + id);
	ProjectComponentBO pcbo = new ProjectComponentBO();
	ProjectComponent pc = new ProjectComponent();
	ProjectBO pBO = new ProjectBO();  //修改
	UserBO userbo = new UserBO();
	User user = new User();
	String CreateDate = StringUtils.toString(new java.util.Date());
	
	pc.setProjectId(pBO.getProject(id));  //修改
	pc.setName(name);
	pc.setDescription(description);
	pc.setLeaderId(leader);
	//pc.setCreateDate(CreateDate);   //修改
	System.out.println("===leader===" + leader);
	if (!pcbo.checkProjectComponent(pc)) {
		String error = "A component with the name fd already exists in this project.";
		request.setAttribute("error", error);
%>
<jsp:forward page="addProjectComponent.jsp"></jsp:forward>
<%
	} else if (StringUtils.isEmpty(leader)) {
		pcbo.addProjectComponent(pc);
		out.println("add success");
%>
<jsp:forward page="../viewProjectDetail.jsp"></jsp:forward>
<%
	} else if (!userbo.exist(leader)) {
		String error1 = " The user " + leader + " does not exist.";
		request.setAttribute("error", error1);
%>
<jsp:forward page="addProjectComponent.jsp"></jsp:forward>
<%
	} else {
		pcbo.addProjectComponent(pc);
		out.println("add success");
%>
<jsp:forward page="../viewProjectDetail.jsp"></jsp:forward>
<%
	}
%>

