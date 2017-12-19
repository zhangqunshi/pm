<%-- 
	描述： 给用户组添加用户对应的用户表单
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


<form action="doBulkEditAddGroupUser.jsp">
	<table>
		<tr>
			<td><b>Add members to selected group(s)</b></td>
		<tr>
		<tr>
			<td align="center"><input type="submit" value="<< Join" /></td>
		</tr>
		<tr>
			<script>
				function openWindow(element) {
					var vWinUsers = window
							.open(
									'<c:url value="/jsp/backend/project/user/UserPickerForOneProject.jsp"/>?element='
											+ element, 'UserPicker',
									'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
					vWinUsers.opener = self;
					vWinUsers.focus();
				}
			</script>
			<td><br> <%
 	String addGroupName = request.getParameter("groupName");
 	if (StringUtils.isBlank(addGroupName)) {
 		System.out.println("==============addGroupName is null ===");
 		out.println("<input type='hidden' name='groupName'/>");
 	} else {
 		out.println("<input type='hidden' name='groupName' value='" + addGroupName + "'/>");
 	}
 %> <textarea name='users' id='users' cols='50'></textarea> <a
				href="javascript:openWindow('users');"> <img
					src="<%=request.getContextPath()%>/images/icons/filter_public.gif"
					border="0" alt='选择用户' />
			</a></td>
		</tr>
	</table>
</form>

