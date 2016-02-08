<%-- 
	描述： 操作修改后的备注
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>

<html>
	<head>

	</head>

	<body>
		<h1>
			操作修改备注
		</h1>
		<%
			String id = request.getParameter("commentId");
			String issueRCKey = request.getParameter("issueRCKey");
			String CommentContent = request.getParameter("CommentContent");
			
			System.out.println("=========31==id==" + id);
			
			int commentId = Integer.parseInt(id);
			
			if (StringUtils.isBlank(CommentContent)) {
				System.out.println("备注不能为空");
		    %>
		    <jsp:forward page="updateCommentDetail.jsp">
			<jsp:param name="commentId" value="<%=commentId%>" />
			<jsp:param name="commentContent1"
				value="CommentContent cann't is null" />
		    </jsp:forward>
		    <%
			}
			CommentBO commbo = new CommentBO();
			Comment comm = new Comment();
			comm.setCommentContent(StringUtils.removeHtmlTag(CommentContent));
			comm.setId(commentId);
			commbo.updateComment(comm);
			out.println("修改成功");
			issueRCKey =java.net.URLEncoder.encode(issueRCKey,"UTF-8");
			response.sendRedirect("../issue/issueDetailLayout.jsp?issueKey="+issueRCKey);		
		%>

	</body>
</html>
