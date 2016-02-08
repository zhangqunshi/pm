<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<!-- 功能：更新问题优先级-->
<!-- @author 许希光 -->
<%
	String name = request.getParameter("name");
	String description = request.getParameter("desc");
	String color = request.getParameter("color");
	String iconUrl = request.getParameter("iconUrl");
	String id = request.getParameter("id");
	int issuePriorityId = 0;

	//检查参数
	boolean hasError = false;
	String errMsg = "";
	if (StringUtils.isBlank(name)) {
		hasError = true;
		errMsg += "<li><font color='red'>Issue Priority name can't be empty!</font></li>";
	}
	if (StringUtils.isBlank(color)) {
		hasError = true;
		errMsg += "<li><font color='red'>You must specify a color for the status bar.</font> </li>";
	}
	if (StringUtils.isBlank(iconUrl)) {
		hasError = true;
		errMsg += "<li><font color='red'>You must specify a URL for the icon of the constant.</font></li>";
	}
	if (StringUtils.isBlank(id)) {
		hasError = true;
		issuePriorityId = 0;
	} else {
		issuePriorityId = Integer.parseInt(id);
	}
	if (hasError) {
		request.setAttribute("errMsg", errMsg);
%>
<jsp:forward page="updateIssuePriority.jsp">
	<jsp:param name="id" value="<%=issuePriorityId%>" />
</jsp:forward>
<%
	}

	IssuePriorityBO issuePriorityBO = new IssuePriorityBO();
	IssuePriority issuePriority = issuePriorityBO
			.getIssuePriority(issuePriorityId);
	issuePriority.setName(name);
	issuePriority.setDescription(description);
	issuePriority.setPriorityColor(color);
	issuePriority.setIconUrl(iconUrl);
	if (issuePriorityBO.exist(issuePriority)) {
		errMsg = "错误：该名称已经存在，请重新命名！";
		request.setAttribute("errMsg", errMsg);
%>
<jsp:forward page="updateIssuePriority.jsp">
	<jsp:param name="id" value="<%=issuePriorityId%>" />
</jsp:forward>
<%
	} else {
		issuePriorityBO.updateIssuePriority(issuePriority);
%>
<jsp:include page="viewIssuePriority.jsp"></jsp:include>
<%
	}
%>