<%-- 
	描述: 更新问题类型
	作者: Kris
	日期: 2008-12-29
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	IssueTypeBO issueTypeBO = new IssueTypeBO();
	int id = Integer.parseInt(request.getParameter("id"));
	IssueType issueType = issueTypeBO.getIssueType(id);
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
                window.alert("错误：请填写IssueType名称！");
                return false;
                }
             }
</script>
	</head>
	<body>
		<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
			<h2 class="formtitle">
				Edit Issue Type:
				<%=issueType.getName()%>
			</h2>
			<%@include file="/jsp/showErrorMessage.jsp"%>
			<form action="doUpdateIssueType.jsp" name="myForm"
				onsubmit="return test();">
				<table border="0">
					<tr>
						<td align="right">
							* 名称：
						</td>
						<td>
							<input type="text" name="name" value="<%=issueType.getName()%>" />
						</td>
						<td>
							<input type="hidden" name="id" value="<%=id%>" />
						</td>
					</tr>
					<tr>
						<td align="right">
							描述：

						</td>
						<td>
							<input type="text" size="50" name="desc"
								value="<%=issueType.getDescription()%>">
						</td>
					</tr>
					<script>
					function openWindow(element)
					{
		   				 var vWinUsers = window.open('<c:url value="/jsp/backend/issue/type/typeIconPicker.jsp"/>?element=' + element, 'UserPicker', 'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
		    			 vWinUsers.opener = self;
						 vWinUsers.focus();
					}
				</script>
					<tr>
						<td align="right">
							* Icon URL:
						</td>
						<td>
							<input type="text" id="filename" name="url" size="50"
								value="<%=issueType.getIconUrl()%>" />
							[
							<a href="javascript:openWindow('filename');">select image</a>]
						</td>

					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" value="更新" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<input type="button" onclick="location.href='viewIssueType.jsp'"
								value="取消" />
						</td>
					</tr>

				</table>
			</form>
		</div>
	</body>
</html>
