<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<!-- 功能：更新问题类型-->
<!-- @author 许希光 -->
<%
	String name = request.getParameter("name");
	System.out.println("=============name==========" + name);
	String desc = request.getParameter("desc");
	String iconUrl = request.getParameter("url");

	//检查参数
	boolean hasError = false;
	String errMsg = "";
	if (StringUtils.isBlank(name)) {
		hasError = true;
		errMsg += "<li>Issue Type name can't be empty!</li>";
	}

	IssueTypeBO issueTypeBO = new IssueTypeBO();

	int issueTypeId = Integer.parseInt(request.getParameter("id"));
	IssueType issueType = new IssueType();

	issueType.setId(issueTypeId);
	issueType.setName(name);
	issueType.setDescription(desc);
	issueType.setIconUrl(iconUrl);
	if (issueTypeBO.exist(issueType)) {
		String error = "问题类型名已经存在，请重新命名！";
		request.setAttribute("error", error);
%>
<jsp:forward page="updateIssueType.jsp">
	<jsp:param name="id" value="<%=issueTypeId%>" />
</jsp:forward>
<%
	} else {
		issueTypeBO.updateIssueType(issueType);
%>
<jsp:include page="viewIssueType.jsp"></jsp:include>
<%
	}//end else
%>