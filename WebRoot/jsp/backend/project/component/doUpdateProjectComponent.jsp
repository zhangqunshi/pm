<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%
	ProjectComponentBO pcbo = new ProjectComponentBO();
	UserBO userbo = new UserBO();
	String name = request.getParameter("name");
	String description = request.getParameter("description");
	String leaderId = request.getParameter("lead");
	String projectId = request.getParameter("projectId");
	int projectId2 = Integer.parseInt(projectId);
	int id = Integer.parseInt(request.getParameter("idd"));

	if (StringUtils.isBlank(name)) {
		String error2 = "You must specify a valid component name.";
		request.setAttribute("error", error2);
	}
	ProjectComponent pc = new ProjectComponent();
	pc.setId(id);
	pc.setName(name);
	pc.setDescription(description);
	pc.setLeaderId(leaderId);
	if (!pcbo.checkProjectComponent(pc)) {
		String error = "A component with this name already exists in this project.";
		request.setAttribute("error", error);
%>
<jsp:forward
	page="/jsp/backend/project/component/updateProjectComponent.jsp">
	<jsp:param name="idd" value="<%=id%>" />
	<jsp:param name="id" value="<%=projectId%>" />
</jsp:forward>
<%
	} else if (StringUtils.isEmpty(leaderId)) {
		pcbo.updateProjectComponent(pc);
		out.println("add success");
%>
<jsp:forward page="../viewProjectDetail.jsp">
	<jsp:param name="projectId" value="<%=projectId%>" />
</jsp:forward>
<%
	} else if (!userbo.exist(leaderId)) {
		String error1 = " The user " + leaderId + " does not exist.";
		request.setAttribute("error", error1);
%>
<jsp:forward page="updateProjectComponent.jsp">
	<jsp:param name="projectId" value="<%=projectId%>" />
	<jsp:param name="id" value="<%=id%>" />
</jsp:forward>
<%
	} else {
		pcbo.updateProjectComponent(pc);
%>
<jsp:forward page="../viewProjectDetail.jsp">
	<jsp:param name="projectId" value="<%=projectId%>" />
</jsp:forward>
<%
	}//endelse
%>
