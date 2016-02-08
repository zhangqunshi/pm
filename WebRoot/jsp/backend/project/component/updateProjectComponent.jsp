<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	ProjectComponentBO pcbo = new ProjectComponentBO();
	int idd = Integer.parseInt(request.getParameter("idd"));
	ProjectComponent pc = pcbo.getProjectComponent(idd);
	int id = 0;

	String idStr = request.getParameter("id");
	System.out.println("++++++=idStr+++++" + idStr);
	id = Integer.parseInt(idStr);
	System.out.println("++++++=id+++++" + id);
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
            function test()
            {
                var name=myForm.name.value;
                
                if(isNull(name)){
                window.alert("错误：请填写ProjectComponent名称！");
                return false;
                }
             }
		</script>
	</head>
	<body>

		<script>
					function openWindow(element)
						{
		   				 var vWinUsers = window.open('<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element=' + element, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
		    			 vWinUsers.opener = self;
						 vWinUsers.focus();
						}
				</script>
		<h2 class="formtitle">
			Edit Component:
			<%=pc.getName()%>
		</h2>
		<%@include file="/jsp/showErrorMessage.jsp"%>
		<form action="doUpdateProjectComponent.jsp" name="myForm"
			onsubmit="return test();">
			<table border="0" align="left" width="90%">
				<tr>
					<td align="right">
						名称:
					</td>
					<td>
						<input type="text" name="name" size="50" value=<%=pc.getName()%>></input>
					</td>
				</tr>
				<tr>
					<td align="right" valign="top">
						描述:
					</td>
					<td>
						<textarea style="width: 90%;" warp="virtual" name="description"
							cols="150" rows="6" value=<%=pc.getDescription()%>></textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						Component Lead:
					</td>
					<td>
						<label>
							<input name="lead" id="lead" type="text"
								value=<%=pc.getLeaderId()%>>
							<a href="javascript:openWindow('lead');"> <img hspace="0"
									height="16" border="0" width="16" style="vertical-align: top;"
									src="<c:url value='/images/icons/filter_public.gif'/>"
									name="assigneeImage" alt="选择一个用户" title="选择一个用户"> </a>
						</label>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="hidden" value=<%=pc.getId()%> name="idd">
						<input type="hidden" value=<%=id%> name="projectId">
						<br>
						<br>
						<input type="submit" value="更新">
						<input type="button"
							onclick="location.href='../viewProjectDetail.jsp?projectId=<%=id%>'"
							value="取消" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

