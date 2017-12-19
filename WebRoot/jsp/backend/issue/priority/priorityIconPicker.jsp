<%-- 
	描述： 为类型选择图片
	作者: 张磊
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%
	String element = request.getParameter("element");
%>
<html>
<head>
<link href="<%=request.getContextPath()%>/includes/css/main.css"
	media="all" rel="StyleSheet" type="text/css" />

<script type="text/javascript">

    function sendTo(filename){
	   window.opener.document.getElementById("<%=element%>").value=filename;
	   window.close();
    }
    
    function sendText(){
	   window.opener.document.getElementById("<%=element%>
	").value = document.form1.text.value;
		window.close();
	}
</script>
</head>
<body>
	<p>Icon</p>
	<p>从下面选择一个图标 问题类型</p>
	<table border="1">
		<tr>
			<th>图标</th>
			<th>文件名</th>
			<th>关联的 问题类型</th>
		</tr>
		<%
			IssuePriorityBO itb = new IssuePriorityBO();
			List list = itb.getIconList();
			for (int i = 0; i < list.size(); i++) {
				Icon icon = (Icon) list.get(i);
		%>
		<tr>
			<td><img
				src="<%=request.getContextPath() + icon.getFileName()%>" /></td>
			<td><a href="javascript:sendTo('<%=icon.getFileName()%>');"><%=icon.getFileName()%></a>
			</td>
			<%
				List list2 = itb.getIssuePriorityListByIcon(icon);
					if (list2 == null || list.size() <= 0) {
						out.println("<td>&nbsp;</td>");
					} else {
						out.println("<td>");
						for (int j = 0; j < list2.size(); j++) {
							IssuePriority type = (IssuePriority) list2.get(j);
			%>
			<a href="javascript:sendTo('<%=icon.getFileName()%>');"><%=type.getName()%></a>
			<br>
			<%
				}
						out.println("</td>");
					}
					out.println("</tr>");
				}
			%>
		
	</table>
	<br>
	<p>
		<font color=red>或者</font>输入一个图象路径
	</p>
	<form name="form1">
		<input type="text" name="text" /> <br> <font size=1>(relative
			to the simple web application e.g /images/icons OR starting with
			http://)</font> <br> <input type="submit" value="更新"
			onclick="sendText();" /> <input type="button"
			onclick="window.close();" value="取消" />
	</form>
</body>
</html>
