<%-- 
	描述： 操作修改后的备注
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<html>
<head>

</head>

<body>
    <h1>操作修改备注</h1>
    <%
        String id = request.getParameter("commentId");
        String issueRCKey = request.getParameter("issueRCKey");
        String CommentContent = request.getParameter("CommentContent");

        int commentId = Integer.parseInt(id);

        if (StringUtils.isBlank(CommentContent)) {
    %>
    <jsp:forward page="updateCommentDetail.jsp">
        <jsp:param name="commentId" value="<%=commentId%>" />
        <jsp:param name="commentContent1" value="CommentContent cann't is null" />
    </jsp:forward>
    <%
        }
        CommentBO commbo = new CommentBO();
        Commenthbm c = new Commenthbm();
        Comment comm = new Comment();
        comm.setCommentContent(StringUtils.removeHtmlTag(CommentContent));
        comm.setId(commentId);
        
        c.setCommentContent(StringUtils.removeHtmlTag(CommentContent));
        c.setId(commentId);
        commbo.updateComment(c);
        out.println("修改成功");
        issueRCKey = java.net.URLEncoder.encode(issueRCKey, "UTF-8");
        response.sendRedirect("../issue/issueDetailLayout.jsp?issueKey=" + issueRCKey);
    %>

</body>
</html>
