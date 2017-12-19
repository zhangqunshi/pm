<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
<head>
<title>Add a Component</title>
</head>
<body>
	<%
		int id = Integer.parseInt(request.getParameter("projectId"));
		ProjectBO pb = new ProjectBO();
		Project pc = pb.getProject(id);
	%>
	<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
		<h2 class="formtitle">Add a Component</h2>
		<br> Use this page to create a new component in the project <a
			href="../viewProjectDetail.jsp?projectId=<%=id%>"><%=pc.getName()%></a>。
		<%@include file="/jsp/showErrorMessage.jsp"%>

		<form action="doaddProjectComponent.jsp">
			<input type="hidden" value=<%=pc.getProjectId()%> name="projectId">
			<table width="80%">

				<tr>
					<td align="right">项目&nbsp;:</td>
					<td><b><%=pc.getName()%></b></td>
				</tr>

				<tr>
					<td align="right">*名称:</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td align="right" valign="top">描述&nbsp;:</td>
					<td><textarea name="description" rows="6" cols="120"></textarea>
					</td>
				</tr>
				<script>
					function openWindow(element) {
						var vWinUsers = window
								.open(
										'<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element='
												+ element, 'UserPicker',
										'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
						vWinUsers.opener = self;
						vWinUsers.focus();
					}
				</script>
				<tr>
					<td align="right">Component Lead:</td>
					<td><input name="lead" id="lead" type="text"
						autocomplete="off" /> <a href="javascript:openWindow('lead');">
							<img hspace="0" height="16" border="0" width="16"
							style="vertical-align: top;"
							src="<c:url value='/images/icons/filter_public.gif'/>"
							name="assigneeImage" alt="选择一个用户" title="选择一个用户">
					</a></td>
				</tr>
				<tr>
					<td></td>
					<td align="left">
						<p>Start typing to get a list of possible matches.</p>
						<p>Enter the username of the component lead.</p>
					</td>
				</tr>

				<tr>
					<td align="center" colspan="2"><input type="submit" value="增加">
						<input type="button"
						onclick="location.href='../viewProjectDetail.jsp?projectId=<%=pc.getProjectId()%>'"
						value="取消" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>



