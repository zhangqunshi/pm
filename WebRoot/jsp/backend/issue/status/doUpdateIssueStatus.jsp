<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<!-- 功能：更新问题状态-->
<!-- @author 许希光 -->
<%
	String name2 = request.getParameter("name");
	String desc2 = request.getParameter("desc");
	int issueStatusId = Integer.parseInt(request.getParameter("id"));
	String iconUrl = request.getParameter("filename");

	//检查参数
	boolean hasError = false;
	String errMsg = "";
	if (StringUtils.isBlank(name2)) {
		hasError = true;
		errMsg += "<li>Issue Priority name can't be empty!</li>";
	}

	IssueStatusBO issueStatusBO = new IssueStatusBO();
	IssueStatus issueStatus = issueStatusBO.getIssueStatus(issueStatusId);
	issueStatus.setName(name2);
	issueStatus.setDescription(desc2);
	issueStatus.setIconUrl(iconUrl);
	if (issueStatusBO.exist(issueStatus)) {
		String error = "错误：该名称已存在，请重新命名！";
		request.setAttribute("error", error);
%>
<jsp:forward page="updateIssueStatus.jsp">
	<jsp:param name="id" value="<%=issueStatusId%>" />
</jsp:forward>
<%
	} else {
		issueStatusBO.updateIssueStatus(issueStatus);
%>
<jsp:forward page="viewIssueStatus.jsp"></jsp:forward>
<%
	}
%>