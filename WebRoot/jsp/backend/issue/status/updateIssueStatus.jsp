<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!-- 功能：更新问题状态-->
<!-- @author 许希光 -->
<%
	IssueStatusBO issueStatusBO = new IssueStatusBO();
	int issueStatusId = Integer.parseInt(request.getParameter("id"));
	IssueStatus issueStatus = issueStatusBO.getIssueStatus(issueStatusId);
%>
<html>
<head>
<script language=javascript>
	function isNull(str) {
		if (str == "")
			return true;
		var regu = "^[ ]+$";
		var re = new RegExp(regu);
		return re.test(str);
	}
	function test() {
		var name = myForm.name.value;

		if (isNull(name)) {
			window.alert("错误：请填写IssueStatuses名称！");
			return false;
		}
	}
</script>
</head>

<body>
	<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
		<h2 class="formtitle">
			Edit Status:
			<%=issueStatus.getName()%>
		</h2>

		<%@include file="/jsp/showErrorMessage.jsp"%>

		<form action="doUpdateIssueStatus.jsp" name="myForm"
			onsubmit="return test();">
			<input type="hidden" name="id" value="<%=issueStatus.getId()%>" />

			<table border="0">
				<tr>
					<td align="right">* 名称：</td>
					<td><input type="text" name="name"
						value="<%=issueStatus.getName()%>" /></td>
				</tr>
				<tr>
					<td align="right">描述：</td>
					<td><input type="text" size="50" name="desc"
						value="<%=issueStatus.getDescription()%>" /></td>
				</tr>
				<script>
					function openWindow(element) {
						var vWinUsers = window
								.open(
										'<c:url value="/jsp/backend/issue/status/statusIconPicker.jsp"/>?element='
												+ element, 'UserPicker',
										'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
						vWinUsers.opener = self;
						vWinUsers.focus();
					}
				</script>
				<tr>
					<td align="right">* Icon URL:</td>
					<td><input type="text" name="filename" id="filename" size="50"
						value="<%=issueStatus.getIconUrl()%>" /> [ <a
						href="javascript:openWindow('filename');">select image</a>]</td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="更新" />
						<input type="button"
						onclick="location.href='viewIssueStatus.jsp?'" value="取消" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>

