<%-- 
	描述： 新建项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>

<html>
<head>
</head>
<body>
    <h1>册除一条备注</h1>
    <%
        String id = request.getParameter("commentId");
        String issueRCKey = request.getParameter("issueRCKey");
        int commentId = Integer.parseInt(id);

        CommentBO commbo = new CommentBO();
        commbo.deleteComment(commentId);
<<<<<<< HEAD
=======
        
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
        issueRCKey = java.net.URLEncoder.encode(issueRCKey, "UTF-8");
        response.sendRedirect("../issue/issueDetailLayout.jsp?issueKey=" + issueRCKey);
    %>
</body>
</html>