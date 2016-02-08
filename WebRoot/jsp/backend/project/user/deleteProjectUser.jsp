<%-- 
	描述： 新建项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<!-- 功能：删除开发人员-->

<html>
	<body>
		<%
			String id = request.getParameter("projectUserId");
		%>

		<form action="doDeleteProjectUser.jsp">
			<H2>
				删除开发人员
			</H2>
			<br>
			<pre> 
       请确认你要删除这条记录吗？<br>
     </pre>
			<input type="hidden" name="projectUserId" value="<%=id%>" />
			<input type="submit" value="提交" />
			<input type="button" value="取消" onclick="window.history.back();" />
		</form>
	</body>
</html>
