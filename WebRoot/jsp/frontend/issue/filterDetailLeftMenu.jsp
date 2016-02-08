<%-- 
    Document   : 过滤详情中左侧的导航
    Created on : 2008-12-24
    Author     : 张磊
    
    ChangeLog:
	2009-1-9 use Global.SESSION_FILTER
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>

<%
	//mode有2个值，show/hidden, 如果mode=show代表点击"编辑"，为编辑模式
	String modeLD = request.getParameter("mode");

	boolean isEditLD = false;

	if ("show".equals(modeLD)) {
		isEditLD = true;
	}
%>
<!-- 过滤详情 -->
<%@include file="/jsp/frontend/issue/filterDetail.jsp"%>
<%
	if (!isEditLD) {//如果编辑状态下，就不显示
%>
	<!-- 过滤的概要 -->
	<%@include file="/jsp/frontend/issue/filterDetailLeftMenuCenter.jsp"%>
	
	<!-- 操作 -->
	<%@include file="/jsp/frontend/issue/filterDetailLeftMenuBottom.jsp"%>
<%
	}//endif
%>
