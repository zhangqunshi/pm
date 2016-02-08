<%-- 
	描述： 选择用户在新建项目页面中
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.User"%>
<%
	String element = request.getParameter("element");
%>
<html>
	<head>
	<link href="<%=request.getContextPath() %>/includes/css/main.css" media="all" rel="StyleSheet" type="text/css"/>
	
		<script type="text/javascript">
       function sendTo(user){
       	 //alert("===sendTo==="+user);
       	 //alert('<%=element%>')
         window.opener.document.getElementById('<%=element%>').value=user;
         window.close();
       }
    </script>
	</head>

	<body>
		<%
			UserBO userBO = new UserBO();
			List list = userBO.viewUsers();
			if (list == null || list.size() == 0) {
				out.println("还没有用户，请创建新用户。");
			} else {
				out
						.println("<table border=1 width='100%'><tr><td>用户名</td><td>全名</td><td>E-mail</td></tr>");
				for (int i = 0; i < list.size(); i++) {
					User user = (User) list.get(i);
		%>
		<tr>
			<td>
				<a href='#' onclick="return sendTo('<%=user.getName()%>');"><%=user.getName()%></a>
			</td>
			<td>
				<a href='#' onclick="return sendTo('<%=user.getName()%>');"><%=user.getFullName()%></a>
			</td>
			<td>
				<a href='#' onclick="return sendTo('<%=user.getName()%>');"><%=user.getEmail()%></a>
			</td>
		</tr>
		<%
			}//end for
				out.println("</table>");
			}
		%>
	</body>
</html>
