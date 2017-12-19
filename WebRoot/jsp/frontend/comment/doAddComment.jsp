<%-- 
	描述： 操作提交后的问题备注
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%
	String issueId = request.getParameter("issueId");
	String issueKey = request.getParameter("issueKey");
	issueKey=java.net.URLEncoder.encode(issueKey,"UTF-8");
	if (StringUtils.isBlank(issueId) || StringUtils.isBlank(issueKey)) {
	    String errMsg="The issue id or key is null";
		request.setAttribute("error",errMsg);
	}
	User author = (User) session.getAttribute(Global.SESSION_USER);
	String commentContent = request.getParameter("commentContent");

	System.out.println("==========author===16====" + author.getName());
	System.out.println("========17=commentContent=" + commentContent);

	if (StringUtils.isBlank(commentContent)) {
	      System.out.println("The commentContent id or key is null"); 
%>
		 <jsp:forward page="../comment/addComment.jsp">
		 <jsp:param name="issueKey" value="<%=issueKey %>" />
		 <jsp:param name="comment" value="commentContent cann't null" />
		 </jsp:forward>
		 
<% 
        return ;
	}
	    Comment c = new Comment();
		c.setCommentContent(StringUtils.removeHtmlTag(commentContent));
		c.setIssueId(new IssueBO().getIssue(Integer.parseInt(issueId)));
		c.setAuthor(author.getName());
		
		CommentBO bo = new CommentBO();		
		bo.addComment(c);
		System.out.println("添加备注成功");
	    response.sendRedirect(request.getContextPath() + "/jsp/frontend/issue/issueDetailLayout.jsp?issueKey=" + issueKey);
%>
