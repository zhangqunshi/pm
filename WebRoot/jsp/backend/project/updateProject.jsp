<%-- 
	描述：修改项目
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%
	ProjectBO pb = new ProjectBO();
	Project project = pb.getProject(Integer.parseInt(request
			.getParameter("projectId")));

%>

<html>
	<head>
		<script language=javascript>
				function isNull( str ){
          if ( str == "" ) return true;
          var regu = "^[ ]+$";
          var re = new RegExp(regu);
         return re.test(str);
        } 
  	             function IsURL(str_url) {
				 var strRegex = "^(http?://)";
				 var re = new RegExp(strRegex);
				 
				 if (re.test(str_url)) {
				  	return (true);
				 } else {
				  	return (false);
				 }
				}
            function test()
            {
            	var url=myForm.url.value;
            	
                var name=myForm.name.value;
                
               	
                if(isNull(name)){
                	window.alert("错误：请填写Project名称！");
                return false;
                }
                
                var projectKey=myForm.projectKey.value;
                
                if(isNull(projectKey)){
                	window.alert("错误：请填写ProjectKey！");
                return false;
                }
                if(url != ""){
	                if(!IsURL(url)) {
	                
	                window.alert("错误：请填写正确的URL！");
	                return false;
	                }
                }
                var lead=myForm.lead.value;
                
                if(isNull(lead)){
                	window.alert("错误：请选择LeaderId！");
                return false;
                }
             }
		</script>
	</head>
	<body>
		<h3 class="formtitle">
			Edit Project:
			<%=project.getName()%></h3>
		<br />
		Use this page to update your project details.

		<%@include file="/jsp/showErrorMessage.jsp" %>
       
		<form action="doUpdateProject.jsp" name="myForm"
			onsubmit="return test();">
			<input type="hidden" name="projectId"
				value=<%=project.getProjectId()%>></input>
			<table border="0" align="left" width="90%">
				<tr>
					<td align="right">
						<i> *名称: </i>
					</td>
					<td>
						<input type="text" name="name" size="50"
							value=<%=project.getName()%>></input>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						网址:
					</td>
					<td>
						<input type="text" name="url" size="50"
							value=<%=project.getUrl()%>></input>
					</td>
				</tr>
				<script>
function openWindow(element)
   {
 			 var vWinUsers = window.open('<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element=' + element, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
  		 vWinUsers.opener = self;
	 vWinUsers.focus();
   }
</script>
				<tr>
					<td align="right">
						<i> *项目负责人: </i>
					</td>
					<td>
						<label>
							<input type="text" id="lead" name="lead" size="50"
								autocomplete="off" value=<%=project.getLeader()%>></input>
							<a href="javascript:openWindow('lead');"> <img hspace="0"
									height="16" border="0" width="16" style="vertical-align: top;"
									src="<c:url value='/images/icons/filter_public.gif'/>"
									name="assigneeImage" alt="选择一个用户" title="选择一个用户"> </a>
						</label>
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">
						描述:
					</td>
					<td>
						<textarea style="width: 90%;" warp="virtual" name="description"
							cols="150" rows="6" title=<%=project.getDescription()%>><%=project.getDescription()%></textarea>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<br />
						<input type="submit" value="更新">
						<input type="button"
							onclick="location.href='viewProjectDetail.jsp?projectId=<%=project.getProjectId() %>'"
							value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
