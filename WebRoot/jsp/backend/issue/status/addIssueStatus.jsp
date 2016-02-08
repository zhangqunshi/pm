<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!-- 功能：添加问题状态 -->
<!-- @author: 许希光-->
<p></p>
<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
<h3>
	Add New Status
</h3>
<form action="doAddIssueStatus.jsp">
	<%
		String error = (String) request.getAttribute("error");
		if (error != null) {
			out.println("<font color=red>" + error + "</font>");
		}
	%>
	<table border="0">
		<tr>
			<td align="right">
				* 名称：
			</td>
			<td>
				<input type="text" name="name" size="20" />
			</td>
		</tr>
		<tr>
			<td align="right">
				描述：
			</td>
			<td>
				<input type="text" name="description" size="50" />
			</td>
		</tr>
		<script>
					function openWindow(element)
					{
		   				 var vWinUsers = window.open('<c:url value="/jsp/backend/issue/status/statusIconPicker.jsp"/>?element=' + element, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
		    			 vWinUsers.opener = self;
						 vWinUsers.focus();
					}
				</script>
		<tr>
			<td align="right">
				* Icon URL:
			</td>
			<td>
				<input type="text" name="filename" id="filename" size="50" />
				[
				<a href="javascript:openWindow('filename');">select image</a>]
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="增加" />
			</td>
		</tr>
	</table>
</form>
</div>
