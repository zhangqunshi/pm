<%-- 
	描述： 查看问题对应的所有备注
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>

<%
	//由于在其他页面也需要issue信息，所以把issue信息保存在request中，供所有页面使用
	Issue issueRC = (Issue) request.getAttribute("issue");
	if (issueRC == null) {
		System.out.println("问题信息为null");
		return;
	}
%>
<table cellspacing="0" cellpadding="2" border="0" align="center"
	width="100%">
	<tr>
		<td nowrap="" bgcolor="#bbbbbb" align="center" width="1%">
			<font color="#ffffff"><b>备注</b> </font> 
		</td>
		<td align="right">

		</td>
	</tr>
</table>

<script>
/**
*toggleDivsWithCookie被hide和show调用;来显示或隐藏div
*
*/
   function toggleDivsWithCookie(open,closed) {
	   var openSD = document.getElementById(open);
	   var closedSD = document.getElementById(closed);
	   if (openSD.style.display == 'none') {
	      openSD.style.display = 'block';
	      closedSD.style.display = 'none';
	
	   } else if (closedSD.style.display = 'none') {
	      closedSD.style.display = 'block';
	      openSD.style.display = 'none';
	   }
}
</script>
<div id="issue_actions_container" class="issuePanelContainer">
<%

//显示所有的注释
	CommentBO bo = new CommentBO();
	List<Comment> commentlist = bo
			.getCommentLists(issueRC.getId());
	if (commentlist == null || commentlist.size() == 0) {
		out.println("这个问题没有备注. ");
	} else {
		for (int i = 0; i < commentlist.size(); i++) {
			Comment comm = (Comment) commentlist.get(i);
%>



	<div id="comment-<%=comm.getId()%>-open" style="display: block;">
		<div class="actionContainer">
			<div class="action-links subText smallgrey">
				[
				<a class="smallgrey"
					href="<%=request.getContextPath()%>/jsp/frontend/comment/updateCommentDetail.jsp?commentId=<%=comm.getId()%>&issueRCKey=<%=issueRC.getIssueKey()%>"
					id="edit_comment_<%=comm.getId()%>">编辑</a> |
				<a class="smallgrey" href="<%=request.getContextPath()%>/jsp/frontend/comment/deleteComment.jsp?commentId=<%=comm.getId()%>&issueRCKey=<%=issueRC.getIssueKey()%>" 
				    id="delete_comment_<%=comm.getId()%>">删除</a> |
				<a class="smallgrey"
					onclick="toggleDivsWithCookie('comment-<%=comm.getId()%>-closed', 'comment-<%=comm.getId()%>-open'); return false;"
					href="#">« Hide</a> ]
			</div>
			<div class="action-details">
				<a href="#"><%=comm.getAuthor()%></a> -
				<span class="subText"><span class="date"><%=comm.getCreateDate()%></span>
				</span>
			</div>
			<div class="action-body">
				<%= StringUtils.replaceNewLineToBr(comm.getCommentContent())%>
			</div>
		</div>
	</div>
	
	<div id="comment-<%=comm.getId()%>-closed" style="display: none;">
		<div class="actionContainer">
			<div class="action-links subText smallgrey">
				[<a class="smallgrey"
					onclick="toggleDivsWithCookie('comment-<%=comm.getId()%>-open', 'comment-<%=comm.getId()%>-closed'); return false;"
					href="#">show »</a> ]
			</div>
			<div class="action-details">
				<a href="#"><%=comm.getAuthor()%></a> -
				<span class="subText"><span class="date"><%=comm.getCreateDate()%> 
				<font color="#000000"><b><%=comm.getCommentContent()%></b></font></span>
				</span>
			</div>
		</div>
	</div>
	
	<br />

<%
	}//endfor
	}//endif
%>
</div>