<%-- 
	描述：添加问题优先级
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<p></p>
<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
	<h3>Add New Priority</h3>
	<%@include file="/jsp/showErrorMessage.jsp"%>
	<form action="doAddIssuePriority.jsp">
		<table border="0">
			<tr>
				<td align="right">* 名称：</td>
				<td colspan=2><input type="text" name="name" size="20" /></td>
			</tr>
			<tr>
				<td align="right">描述：</td>
				<td colspan=2><input type="text" name="description" size="50" />
				</td>
			</tr>
			<script>
				function openWindow(element) {
					var vWinUsers = window
							.open(
									'<c:url value="/jsp/backend/issue/priority/priorityIconPicker.jsp"/>?element='
											+ element, 'UserPicker',
									'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
					vWinUsers.opener = self;
					vWinUsers.focus();
				}
			</script>
			<tr>
				<td align="right">* Icon URL:</td>
				<td colspan=2><input type="text" name="iconUrl" id="filename"
					size="50" /> [ <a href="javascript:openWindow('filename');">select
						image</a>]</td>
			</tr>
			<script>
				function openWindowColor(element, defaultColor) {
					var vWinUsers = window
							.open('<c:url value="/jsp/backend/issue/priority/colorPicker.jsp"/>?element='
									+ element + '&defaultColor=' + defaultColor);
					vWinUsers.opener = self;
					vWinUsers.focus();
				}
			</script>
			<tr>
				<td align="right">* Priority Color:</td>
				<td><input type="text" id="color" name="color" size=40 /></td>
				<td bgcolor="#000000" id="myColor"><a
					href="javascript:openWindowColor('color','myColor');"><img
						height="16" border="0" width="16" alt=""
						src="<%=request.getContextPath()%>/images/border/spacer.gif" /> </a>
				</td>

			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan=2><input type="submit" value="增加" /></td>
			</tr>
		</table>
	</form>
</div>
