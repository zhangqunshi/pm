<%-- 
	描述： 修改备注表单
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.CommentBO"%>
<%@ page import="com.nastation.pm.bean.Comment"%>
<html>
	<head>
	</head>

	<body>
		<%
			String commentId = request.getParameter("commentId");
			String issueRCKey = request.getParameter("issueRCKey");
			String commentContenStr = request.getParameter("commentContent1");

			System.out.println("=====35==commentId======" + commentId);

			int id = Integer.parseInt(commentId);

			if (commentContenStr == null) {
				commentContenStr = "";
			}
			out.println("<font color='red'>" + commentContenStr + "</font>");

			CommentBO commbo = new CommentBO();
			Comment comm = commbo.getComment(id);
		%>
		
<table border="0" width="100%">
	<tr>
	<td valign="top" width="20%">	
		<!-- 左侧: 备注详情 -->
		<table border="0" width="100%">
			<tr>
				<td valign="top" bgcolor="#dddddd">
					备注详情
					<hr>
					作者:<%=comm.getAuthor()%><br>
					创建:<%=comm.getCreateDate()%>
				</td>
			</tr>
		</table>
	</td>
	<td valign="top" align="right">	
	
	<!-- 右侧 -->
					<form action='../comment/doUpdateCommentDetail.jsp'>
						<table border="0" width="95%" align="right">
							<tr>
								<td class="simpleformheader" colspan="2">
									<h3 class="formtitle">Edit Comment</h3>
									<p>Use this form to edit a comments body and security level.</p>
								</td>
							</tr>
							<tr>
								<td valign="top" align="right" class="fieldLabelArea">
									备注:
								</td>
								<td align="left">
									<textarea name='CommentContent' cols='60' rows='15'><%=comm.getCommentContent()%></textarea>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
								    <input type='hidden' name=issueRCKey value='<%=issueRCKey%>' />
									<input type='hidden' name='commentId' value='<%=id%>' />
									<input type='submit' value='更新' />
									<input type='button' value='取消'
										onclick='window.history.back();' />
								</td>
							</tr>
						</table>
					</form>
		
	</td>
	</tr>
	</table>
	</body>
</html>
