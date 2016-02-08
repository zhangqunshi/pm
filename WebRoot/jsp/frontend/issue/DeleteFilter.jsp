<%--
	删除一个过滤器
	2009-1-9
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
				<!-- 左侧: 过滤导航条 -->
				<td valign="top" width=20%>

					<%@include file="/jsp/frontend/issue/searchIssueTopMenu.jsp"%>

					<%@include file="/jsp/frontend/issue/filterDetailLeftMenu.jsp"%>
				</td>


				<!-- 右侧: 删除过滤器 -->
				<td width="80%" valign="top">


					<form name="simpleform" method="post" action="doDeleteFilter.jsp">

						<table class="simpleform maxWidth">
							<tr>
								<td class="simpleformheader" colspan="2">

									<h3 class="formtitle">
										删除过滤器: <%= request.getParameter("filterName") %>
									</h3>
								</td>
							</tr>
							<tr>
								<td class="simpleformheader" colspan="2">
									<p>
										确认你要删除这个过滤器.
									</p>
								</td>
							</tr>

							<input type="hidden" value="<%= request.getParameter("filterId") %>" name="filterId" id="filterId" />

							<tr>
								<td class="fullyCentered simpleformfooter" colspan="2">

									<input type="submit" class="spaced" title="按 Alt+S 提交"
										accesskey="S" value="删除" id="删除" name="删除" />

									<input type="button"
										onclick="location.href='ManageFilters.jspa'" value="取消"
										name="ManageFilters.jspa" title="取消 (Alt + `)" accesskey="`"
										id="cancelButton" />

								</td>
							</tr>
						</table>
					</form>







				</td>
			</tr>
		</table>
	</body>
</html>