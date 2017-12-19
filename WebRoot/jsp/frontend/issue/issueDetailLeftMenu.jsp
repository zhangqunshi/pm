<%-- 
    Document   : 问题详情中左侧的导航
    Created on : 2008-12-24
    Author     : Kris
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<table border="0" width="100%">
	<tr>
		<td>
			<!-- 问题详情 -->
			<%@include file="/jsp/frontend/issue/issueDetailLeftMenuTop.jsp"%>
		</td>
	</tr>
	<tr>
		<td>
			<!-- 可选工作流程 -->
			<%@include file="/jsp/frontend/issue/issueDetailLeftMenuCenter.jsp"%>
		</td>
	</tr>
	<tr>
		<td>
			<!-- 操作 -->
			<%@include file="/jsp/frontend/issue/issueDetailLeftMenuBottom.jsp"%> 
		</td>
	</tr>
</table>