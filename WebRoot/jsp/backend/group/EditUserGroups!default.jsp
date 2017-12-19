<%-- 
	描述： 编辑用户组
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
<head>

</head>

<body>
	<%
		String name = request.getParameter("name");
		String errMsg = request.getParameter("errMsg");
		if (StringUtils.isBlank(name)) {
			System.out.println("==============name id null=========");
			return;
		}
		if (StringUtils.isBlank(errMsg)) {
			System.out.println("==============errMsg id null=========");
			errMsg = "";
		}
	%>
	<table width="100%"
		style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
		<tr>
			<td bgcolor="#f0f0f0" colspan="2"><b>Edit User Groups</b><br>
				This page lets you edit group memberships for a user.</td>
		</tr>
		<tr>
			<td colspan="2"><font color='red'><b><%=errMsg%></b></font></td>
		</tr>
		<tr>
			<td align="center" colspan="2"><a
				href="<%=request.getContextPath()%>/jsp/backend/user/viewUserDetail.jsp?name=<%=name%>">
					<< Return to viewing user '<%=name%>'
			</a></td>
		</tr>
		<tr>
			<td><%@ include file="EditJoinUserGroups!default.jsp"%></td>
			<td><%@ include file="EditLeaveUserGroups!default.jsp"%></td>
		</tr>
	</table>
</body>
</html>
