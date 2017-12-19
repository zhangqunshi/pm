<%-- 
    Description：添加权限模板,可以创建一个新的权限模板。
    Author:孙重阳
 --%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

</head>

<body>
	<%@include file="/jsp/showErrorMessage.jsp"%>
	<form action="doAddPermissionScheme.jsp" method="post">
		<table class="simpleform maxWidth">
			<tbody>
				<tr>
					<td class="simpleformheader" colspan="2">

						<h3 class="formtitle">Add Permission Scheme</h3>

					</td>
				</tr>
				<tr>
					<td class="fieldLabelArea">名称:</td>
					<td class="fieldValueArea" bgcolor="#ffffff"><input
						type="text" size="30" name="name" /></td>
				</tr>
				<tr>
					<td class="fieldLabelArea">描述:</td>
					<td class="fieldValueArea" bgcolor="#ffffff"><textarea
							style="width: 90%;" wrap="virtual" rows="3" cols="30"
							name="description"></textarea></td>
				</tr>
				<tr>
					<td class="fullyCentered simpleformfooter" colspan="2"><input
						id="增加" class="spaced" type="submit" title="按 Alt+S 提交"
						accesskey="S" value="增加" name="增加" /> <input id="cancelButton"
						type="button" onclick="location.href='viewPermissionSchemes.jsp'"
						value="取消" name="cancel" title="取消 (Alt + `)" accesskey="`" /></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
