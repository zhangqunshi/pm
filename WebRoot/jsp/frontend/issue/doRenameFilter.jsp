<%-- 
    Document   : 过滤详情中左侧的导航
    Created on : 2008-12-24
    Author     : 张磊
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%
//filerName不能重名，应为有些地方根据filtername来取得issuelist.

	String newName = request.getParameter("filterName");
	String description = request.getParameter("description");
	String oldName = request.getParameter("saveName");
	
	System.out.println("======newName=======" + newName);
	System.out.println("======oldName=======" + oldName);
	
	boolean hasErr = false;
	String errMsg = "";
	boolean onlyUpdateDescription = false;
	if (StringUtils.isBlank(newName)) {
		errMsg += "The filter name cannot be empty";
		hasErr = true;
	}
	if (StringUtils.isBlank(oldName)) {
		errMsg += "The old filter name cannot be empty";
		hasErr = true;
	}
	if (StringUtils.isNotBlank(oldName) && oldName.equals(newName)) {
		onlyUpdateDescription = true;
	}
	if (description != null) {
		description = description.trim();
	}
	
	//保存filter到数据库中
	IssueFilterBO filterBO = new IssueFilterBO();
	if (!onlyUpdateDescription && filterBO.checkFilterName(newName)) { //判断重名
		hasErr = true;
		errMsg += "The filter name already exist!";
	}
	
	if (hasErr) {
		request.setAttribute("error", errMsg);
%>
<jsp:forward page="saveAsFilter.jsp" />
<%
	} //endif
	
	IssueFilter filter = (IssueFilter)session.getAttribute(Global.SESSION_FILTER);
	filter.setFilterName(newName);
	filter.setDescription(description);
	
	filterBO.updateFilterBasicInfo(filter);
	
	session.setAttribute(Global.SESSION_FILTER, filter);
%>
<jsp:forward page="issueNavigator.jsp" />