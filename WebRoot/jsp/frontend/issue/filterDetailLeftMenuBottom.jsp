<%-- 
    Document   : 过滤详情中左侧的导航
    Created on : 2008-12-24
    Author     : 张磊
    
    ChangeLog:
	2009-1-9 use Global.SESSION_FILTER
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%
//未保存的filter不显示操作

	IssueFilter filterOperation = (IssueFilter) session.getAttribute(Global.SESSION_FILTER);
	if (filterOperation != null && filterOperation.isSaved()) {
%>
<table class="tableUnderline" cellspacing="0" cellpadding="3" border="0"
	width="100%">
	<tbody>
		<tr>
			<td bgcolor="#dddddd">
				<b>操作</b>
			</td>
		</tr>
	</tbody>
</table>
<table cellspacing="0" cellpadding="3" border="0" width="100%">
		<tr>
			<td>
				<img height="8" border="0" align="absmiddle" width="8"
					src="<%=request.getContextPath()%>/images/icons/bullet_creme.gif" /> 
				<a href="renameFilter.jsp"><b>重命名</b></a> 当前过滤器
			</td>
		</tr>
		<tr>
			<td>
				<img height="8" border="0" align="absmiddle" width="8"
					src="<%=request.getContextPath()%>/images/icons/bullet_creme.gif" /> 
				<a href="saveAsFilter.jsp"><b>另存为</b></a> 新过滤器
				<br />
			</td>
		</tr>
</table>
<%
	}//endif
%>