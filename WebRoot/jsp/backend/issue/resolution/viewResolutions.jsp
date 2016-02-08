<%-- 
	描述：显示所有问题解决结果
	作者: Kris
	日期: 2008-12-27
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.*"%>
<html>
	<body>
		<h3 class="formtitle">
			View Resolutions
		</h3>
		<p>The table below shows the resolutions used</p>
		<table border='1' width='100%'>
		<tr><th>名称</th><th>描述</th><th>操作</th></tr>
		<%
			ResolutionBO bo = new ResolutionBO();
			List list = bo.getAllResolutions();
			for (int i = 0; i < list.size(); i++) {
				Resolution r = (Resolution) list.get(i);
				out.println("<tr><td>");
				out.println("<b>" + r.getName() + "</b>");
				if (r.getIsDefault() == Global.RESOLUTION_DEFAULT) {
					out.println("<br>(Default)");
				}
				out.println("</td><td>");
				out.println(r.getDescription());
				out.println("</td>");
				out.println("<td width='150'>");				
				out.println("<a href='updateResolution.jsp?id=" + r.getId() + "' >编辑</a>");
				out.println("|<a href='deleteResolution.jsp?id=" + r.getId()+ "'>删除</a>");
				if (r.getIsDefault() != Global.RESOLUTION_DEFAULT) {
					out.println("|<a href='MakeDefaultResolution.jsp?make="+r.getId()+"'>Default</a>");
				}	
				out.println("</td></tr>");
			}
		%>
		</table>
		<%@include file="/jsp/backend/issue/resolution/addResolution.jsp"%>
	</body>
</html>