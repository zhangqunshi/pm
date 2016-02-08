<%--
   Description:Update a permission scheme.
   Author:Sun Chongyang 
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*" %>
<%@ page import="com.nastation.pm.bean.*" %>
<%@ page import="com.nastation.pm.util.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		
	</head>
    <%
        String idStr= request.getParameter("schemeId");
        int schemeId=0;
        if(StringUtils.isNotBlank(idStr)){
            schemeId = Integer.parseInt(idStr);
        }
        PermissionSchemeBO schemeBO = new PermissionSchemeBO();
        PermissionScheme scheme = schemeBO.getScheme(schemeId);
        
     %>
	<body>
	 <%@include file="/jsp/showErrorMessage.jsp"%>
		<form name="simpleform" method="post"
			action="doUpdatePermissionScheme.jsp" />
           
			<table class="simpleform maxWidth">
				<tbody>
					<tr>
						<td class="simpleformheader" colspan="2">
							<h3 class="formtitle"> 
								&quot;Edit Permission Scheme:<%=scheme.getName() %>
							</h3>
							
						</td>
					</tr>
					<tr>
						<td class="fieldLabelArea">
							名称:
						</td>
						<td class="fieldValueArea" bgcolor="#ffffff">
							<input type="text" value="<%=scheme.getName() %>" size="30" name="name" />
						</td>
					</tr>
					<tr>
						<td class="fieldLabelArea">
							描述:
						</td>
						<td class="fieldValueArea" bgcolor="#ffffff">
							<textarea style="width: 90%;" wrap="virtual" rows="3" cols="30"
								name="description"><%=scheme.getDescription() %></textarea>
						</td>
					</tr>
					<input id="schemeId" type="hidden" value="<%=scheme.getId() %>" name="schemeId" />
					<tr>
						<td class="fullyCentered simpleformfooter" colspan="2">
							<input id="更新" class="spaced" type="submit" title="按 Alt+S 提交"
								accesskey="S" value="更新" name="更新" />
							<input id="cancelButton" type="button"
								onclick="location.href='viewPermissionSchemes.jsp'" value="取消"
								 title="取消 (Alt + `)" accesskey="`" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</body>
</html>
