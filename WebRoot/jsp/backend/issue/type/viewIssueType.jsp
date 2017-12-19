<%-- 
	描述：显示所有问题类型
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<html>
<head>
</head>
<body>
	<h3 class="formtitle">Manage Issue Types</h3>
	<p>The table below shows the issue types used. The issue types
		below are displayed in alphabetical order.</p>
	<table border='1' width='100%'>
		<tr>
			<th>名称</th>
			<th>描述</th>
			<th>图标</th>
			<th width="100">操作</th>
		</tr>
		<%
			IssueTypeBO issueTypeBO = new IssueTypeBO();
			List list = issueTypeBO.getIssueTypeList();
			for (int i = 0; i < list.size(); i++) {
				IssueType issueType = (IssueType) list.get(i);
				out.println("<tr><td><b>" + issueType.getName() + "</b></td>");
				out.println("<td>" + issueType.getDescription() + "</td>");
				out.println("<td><img src='" + request.getContextPath() + issueType.getIconUrl() + "' /></td>");
				out.println("<td><a href='deleteIssueType.jsp?id=" + issueType.getId()
						+ "' onclick='return confirmDelete();'>删除</a> | <a href='updateIssueType.jsp?id="
						+ issueType.getId() + "' >编辑</a></td></tr>");
			}
		%>
	</table>
	<%@include file="/jsp/backend/issue/type/addIssueType.jsp"%>

</body>
</html>