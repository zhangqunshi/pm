<%-- 
    Document   : 过滤详情中左侧的导航
    Created on : 2008-12-24
    Author     : 张磊
    
    ChangeLog:
	2009-1-9 use Global.SESSION_FILTER
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%
    //保存过得的filter显示详情，未保存的filter由于没有详情，所以不显示
    IssueFilter filterDetail = (IssueFilter) session.getAttribute(Global.SESSION_FILTER);
    if (filterDetail != null && filterDetail.isSaved()) {
%>
<table cellspacing="0" cellpadding="3" border="0" width=100%>
    <tbody>
        <tr>
            <td>
                <b>名称:</b>
                <br />
                <%=filterDetail.getFilterName()%>
            </td>
        </tr>
        <tr>
            <td>
                <%
                    if (!StringUtils.isBlank(filterDetail.getDescription())) {
                %>
                <b>描述:</b>
                <br />
                <%=filterDetail.getDescription()%>
                <%
                    }
                %>
            </td>
        </tr>
    </tbody>
</table>

<%
    } //endif
%>