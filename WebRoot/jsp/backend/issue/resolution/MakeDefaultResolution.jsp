<%-- 
	描述： 修改resolution为默认
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>

<html>
<head>
</head>

<body>
	<%
		//获得resolution的ID
		String idStr = request.getParameter("make");
		if (idStr == null || idStr.equals("")) {
			System.out.println("===================isStr is null ========20==========" + idStr);
		}
		int idInt = Integer.parseInt(idStr);
		ResolutionBO resolutionBO = new ResolutionBO();

		//更新一条记录,把resolution表ID为idInt的一条记录的is_default字段改为1;
		resolutionBO.updateResolutionDefault(idInt);

		response.sendRedirect("viewResolutions.jsp");
	%>
</body>
</html>
