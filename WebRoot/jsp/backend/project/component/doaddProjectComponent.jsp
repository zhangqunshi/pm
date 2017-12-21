<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
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
    ProjectBO pBO = new ProjectBO();
    ProjectComponentBO pcbo = new ProjectComponentBO();
    ProjectComponent pc = new ProjectComponent();
    UserBO userbo = new UserBO();
    User user = new User();
    pc.setProjectId(id);
    pc.setName(name);
    pc.setDescription(description);
    pc.setLeaderId(leader);
    pc.setCreateDate(new java.util.Date());
    ProjectComponenthbm p = new ProjectComponenthbm();
    p.setProject(pBO.getProject(id));
    p.setName(name);
    p.setDescription(description);
    p.setLeader(leader);
    p.setCreateDate(new java.util.Date());
    

    if (!pcbo.checkProjectComponent(p)) {
        String error = "A component with the name fd already exists in this project.";
        request.setAttribute("error", error);
%>
<jsp:forward page="addProjectComponent.jsp"></jsp:forward>
<%
    } else if (StringUtils.isEmpty(leader)) {
        pcbo.addProjectComponent(p);
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
        pcbo.addProjectComponent(p);
        out.println("add success");
%>
<jsp:forward page="../viewProjectDetail.jsp"></jsp:forward>
<%
    }
%>

