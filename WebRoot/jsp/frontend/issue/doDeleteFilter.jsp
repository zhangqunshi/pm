<%--
	删除一个过滤器
	2009-1-9
	author: Kris
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%
    String filterId = request.getParameter("filterId");

    if (StringUtils.isBlank(filterId)) {
    }

    IssueFilterBO bo = new IssueFilterBO();
    bo.deleteFilter(Integer.parseInt(filterId));
    response.sendRedirect(request.getContextPath() + "/jsp/frontend/issue/ManageFilters.jsp");
%>

