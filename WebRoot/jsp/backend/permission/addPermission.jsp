<%--
    Description：给一个对象增加一个权限。
    Author：孙重阳
 --%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script>
			function openWindow(element)
				{
   				 var vWinUsers = window.open('<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element=' + element, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
    			 vWinUsers.opener = self;
				 vWinUsers.focus();
				}
			function setFocus() {  
			   var option =   document.all.permissions.options;  
			   for(var   i=0;i<option.length;i++) {  
			       if(option[i].selected) {  
			           option[i].focus();
			       }  
			  }  
  		   } 
  		   
		</script>
</head>

<body>
	<script>
     function load() 
     { 
	      var options=document.simpleform.getElementById("permission");  
	      var optionLength=options.length;
	      for(int i = 0;i<optionLength;i++){
	          var opt=options[i];
	          if(opt.selected){
	             opt.focus();
	          }
	     } 
    }
     
    </script>
	<%
		//get parameters.
		String schemeIdStr = request.getParameter("schemeId");
		String permissionIdStr = request.getParameter("permissionId");
		//parese parameters.
		int permissionId = 0;
		int schemeId = 0;
		if (StringUtils.isNotBlank(schemeIdStr)) {
			schemeId = Integer.parseInt(schemeIdStr);
		}
		if (StringUtils.isNotBlank(permissionIdStr)) {
			permissionId = Integer.parseInt(permissionIdStr);
		}
		//get business object and bean.
		PermissionSchemeBO psBO = new PermissionSchemeBO();
		PermissionScheme ps = psBO.getScheme(schemeId);
		PermissionBO permissionBO = new PermissionBO();
		RoleBO roleBO = new RoleBO();
		GroupBO groupBO = new GroupBO();
		//get permission list contains all permissions.
		List<Permission> list = permissionBO.getAllPermission();
		//get role list.
		List<Role> roleList = roleBO.getRoleList();
		//get group list.
		List<Group> groupList = groupBO.getViewGroups();
	%>

	<form name="simpleform" action="doAddPermission.jsp">
		<table width="100%">
			<tr>
				<td class="instructions" colspan="2">
					<h3 class="formtitle">Add New Permission</h3>

				</td>
			</tr>
			<tr>
				<td class="instructions" colspan="2">Permission Scheme: <strong>
						<%=ps.getName()%>
				</strong>
					<p>Please select the type of permission you wish to add to this
						Permission Scheme</p>
				</td>
			</tr>
			<tr>

				<td><%@include file="/jsp/showErrorMessage.jsp"%>
					<div>
						<table class="leftColumn grid" width="100%">
							<tbody>
								<tr>
									<td class="fieldLabelArea">Permissions:</td>
									<td class="fieldValueArea" bgcolor="#ffffff"><select
										id="permission" size="7" name="permissions">
											<%
												//print permissions ,if the permission id equals the request parameter permissionId set the optino selected.
												for (Permission per : list) {
													if (per.getId() == permissionId) {
											%>
											<option selected value="<%=per.getId()%>">
													<%=per.getName()%>
												</option>
											<%
												} else {
											%>
											<option value="<%=per.getId()%>">
													<%=per.getName()%>
												</option>
											<%
												} //endelse
												} //endfor
											%>
									</select> <br /> <font size="1"> (Select the permissions that
											you want to assign). </font></td>
								</tr>
							</tbody>
						</table>

						<table class="rightColumn grid" width="100%">
							<tbody>

								<tr>
									<td width="5%" align="center"><input id="type"
										type="radio" value="Group" name="type" /></td>
									<td width="25%" align="left"><label for="type_group">
											Group </label></td>
									<td><select name="Group"
										onclick="document.forms['simpleform'].type[0].checked = true;">
											<option value="">
													Anyone
												</option>
											<%
												//print the group list
												for (Group group : groupList) {
											%>
											<option value="<%=group.getName()%>">
													<%=group.getName()%>
												</option>
											<%
												} //endfor
											%>
									</select></td>
								</tr>
								<tr class="rowAlternate">
									<td width="5%" align="center"><input id="type"
										type="radio" value="SingleUser" name="type" /></td>
									<td width="25%" align="left"><label for="type_user">
											Single User </label></td>
									<td>

										<div id="user_container" class="ajax_autocomplete">
											<input id="user" type="text" name="SingleUser"
												autocomplete="off"
												onclick="document.forms['simpleform'].type[1].checked = true;" />
											<a href="javascript:openWindow('user');"
												onclick="document.forms['simpleform'].type[1].checked = true;">
												<img hspace="0" height="16" border="0" width="16"
												style="vertical-align: top;"
												src="<c:url value='/images/icons/filter_public.gif'/>"
												name="assigneeImage" alt="选择一个用户" title="选择一个用户">
											</a>
									</td>
								</tr>


								<tr class="rowAlternate">
									<td width="5%" align="center"><input id="type"
										type="radio" value="ProjectRole" name="type" /></td>
									<td width="25%" align="left"><label for="type_projectrole">
											Project Role </label></td>
									<td><select
										onclick="document.forms['simpleform'].type[2].checked = true;"
										name="ProjectRole">
											<option value="">
													Choose a project role
												</option>
											<%
												//print the role list.
												for (Role role : roleList) {
											%>
											<option value="<%=role.getRoleName()%>">
													<%=role.getRoleName()%>
												</option>
											<%
												} //endfor
											%>
									</select></td>
								</tr>

								<input id="schemeId" type="hidden" value="<%=ps.getId()%>"
									name="schemeId" />
							</tbody>
						</table>
					</div></td>
			</tr>
			<tr align="center">
				<td class="fullyCentered simpleformfooter" colspan="2"><input
					id="增加" class="spaced" type="submit" title="按 Alt+S 提交"
					accesskey="S" value="增加" name=" 增加 " /> <input id="cancelButton"
					type="button"
					onclick="location.href='editPermissions.jsp?schemeId=<%=ps.getId()%>'"
					value="取消" name="Cancel" title="取消 (Alt + `)" accesskey="`" /></td>
			</tr>

		</table>
	</form>
</body>
</html>
