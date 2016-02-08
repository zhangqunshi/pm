<%--
	某个用户的filter管理界面
	author: Kris

--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page language="java" import="com.nastation.pm.util.*"%>

<html>
	<body>
		<table border="0" width=100%>
			<tr>
				<td valign="top" width=20%>
<!-- 左侧: 过滤导航条 -->
					<%@include file="/jsp/frontend/issue/searchIssueTopMenu.jsp"%>

					<%@include file="/jsp/frontend/issue/filterDetailLeftMenu.jsp"%>
				</td>


<!-- 右侧: 管理过滤配置 -->
				<td valign="top" width=80%>
					<table class="simpleform maxWidth" width=100%>
						<tr>
							<td class="simpleformheader" colspan="2">
								<h3 class="formtitle">
									管理过滤配置
								</h3>
							</td>
						</tr>
						<tr>
							<td class="simpleformheader" colspan="2">
								这是你目前保存的过滤.你可以查看或者删除它们. 
							</td>
						</tr>
					</table>
					
					<br>
					
					<table class="simpleform" width="100%" border="1">
						<tr bgcolor="#f0f0f0">
							<th class="colHeaderLink" width="50%" height="30">
								你的过滤器
							</th>
							<th class="colHeaderLink" width="50%">
								操作
							</th>
						</tr>
						
						<%
						
						IssueFilterBO issueFilterBO = new IssueFilterBO();
						User user = (User) session.getAttribute(Global.SESSION_USER);
						List filterList = issueFilterBO.getFiltersByUser(user.getName());
						if (filterList != null) {
							String color = null;
							for (int i = 0; i < filterList.size(); i++) {
								IssueFilter filter = (IssueFilter) filterList.get(i);
		
								if (i % 2 == 0) {
									color = "#ffffff";
								} else {
									color = "#fffff0";
								}
						%>
						<tr bgcolor="<%= color %>">
							<td>
								<a href="issueNavigator.jsp?mode=hide&amp;filterId=<%= filter.getId() %>"><%= filter.getFilterName() %></a>
								<br/>
								<font size="1"><%= filter.getDescription() %></font>
							</td>
							
							<td>
								<a href="issueNavigator.jsp?mode=hide&amp;filterId=<%= filter.getId() %>">查看</a>
								|
								<a href="issueNavigator.jsp?mode=show&amp;filterId=<%= filter.getId() %>">编辑</a>
								|
								<a href="DeleteFilter.jsp?filterId=<%= filter.getId() %>&filterName=<%= filter.getFilterName() %>">删除</a>
			
							</td>
						</tr>
						
						<%
						
							}//endfor
						}//endif 
						%>
					</table>
					
					
					
					
				</td>
			</tr>
		</table>
	</body>
</html>