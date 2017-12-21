<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>

<html>
<body>
    <%
        String id = (String) request.getParameter("IssuePriorityId");

        int issuePriorityId = Integer.parseInt(id);

        IssuePriorityBO ipb = new IssuePriorityBO();
        ipb.deleteIssuePriority(issuePriorityId);
    %>
    <jsp:forward page="viewIssuePriority.jsp"></jsp:forward>
</body>
</html>
