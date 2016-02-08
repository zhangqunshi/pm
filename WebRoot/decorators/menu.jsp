<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.User" %>
<%@ page import="java.util.*" %>
<%@ page import="com.nastation.pm.*" %>
<table width="100%">
<%
    User userinfo=(User)session.getAttribute(Global.SESSION_USER);
%>
	<tr>
		<td align="left">			
			<a href="<%= request.getContextPath() %>/jsp/frontend/dashboard.jsp">首页</a>
			
			<a href="<%= request.getContextPath() %>/jsp/frontend/issue/issueNavigator.jsp?createNew=false">查找问题</a>
			<a href="<%= request.getContextPath() %>/jsp/frontend/issue/addIssueStep1.jsp">创建问题</a>
			<%  
			if(userinfo.isAdmin()){ %>
			<a href="<%= request.getContextPath() %>/jsp/backend/project/viewProject.jsp">管理</a>
			<%
			    
			  } %>
		</td>
	</tr>
</table>