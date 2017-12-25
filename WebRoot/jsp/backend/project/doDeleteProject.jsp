<%-- 
	描述：删除项目相关操作
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>

<html>
<body>
    <%
        String id = (String) request.getParameter("projectId");
        int projectId = Integer.parseInt(id);

        //删除项目中的用户

        UserBO userBO = new UserBO();
        if (userBO.checkProjectUser(projectId)) {
            userBO.deleteAllProjectUser(projectId);
        }

        //删除项目中的projectIssueSequence
        ProjectIssueSequenceBO pis = new ProjectIssueSequenceBO();
        if (pis.checkProjectLinkProjectIssueSequence(projectId)) {
            pis.deleteAllProjectIssueSequence(projectId);
        }

        //删除项目
        ProjectBO pb = new ProjectBO();
        pb.deleteProject(projectId);
    %>
    <jsp:forward page="viewProject.jsp"></jsp:forward>
</body>
</html>
