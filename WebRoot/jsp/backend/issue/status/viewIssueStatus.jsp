<%-- 
	描述：显示所有问题状态
	作者: Kris
	日期: 2008-12-25
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.*"%>
<html>
<body>
	<h3 class="formtitle">View Statuses</h3>
	<p>The table below shows the statuses used</p>
	<table border='1' width='100%'>
		<tr>
			<th>Status Details</th>
			<th>操作</th>
		</tr>
		<%
			IssueStatusBO issueStatusBO = new IssueStatusBO();
			List list = issueStatusBO.getIssueStatusList();
			for (int i = 0; i < list.size(); i++) {
				IssueStatus issueStatus = (IssueStatus) list.get(i);
				out.println("<tr><td>");
				out.println("<img src='" + request.getContextPath() + issueStatus.getIconUrl() + "' />");
				out.println("<b>" + issueStatus.getName() + "</b><br>");
				out.println(issueStatus.getDescription());
				out.println("</td>");
				out.println("<td width='100'>");
				out.println("<a href='updateIssueStatus.jsp?id=" + issueStatus.getId() + "' >编辑</a>");
				//如果是系统默认的状态，则不可以删除
				int sid = issueStatus.getId();
				if (sid == Global.OPEN || sid == Global.CLOSE || sid == Global.IN_PROGRESS || sid == Global.REOPEN
						|| sid == Global.RESOLVED) {
					out.println("");
				} else {
					out.println("|<a href='deleteIssueStatus.jsp?id=" + issueStatus.getId() + "'>删除</a>");

				}

				out.println("</td></tr>");
			}
		%>
	</table>
	<%@include file="/jsp/backend/issue/status/addIssueStatus.jsp"%>
</body>
</html>