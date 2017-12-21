<%-- 
    Document   : 过滤详情中左侧的导航
    Created on : 2008-12-24
    Author     : 张磊
    
    ChangeLog: 
    2009-1-9 use Global.SESSION_FILTER
     
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@page import="java.util.*"%>
<%
    //保存的或未保存的filter都要显示概要信息
    IssueFilter filterSummary = (IssueFilter) session.getAttribute(Global.SESSION_FILTER);

    if (filterSummary != null) {
        HashMap item = filterSummary.getItem();
%>
<table class="tableUnderline" cellspacing="0" cellpadding="3" border="0" width="100%">
    <tbody>
        <tr>
            <td bgcolor="#dddddd">
                <b>概要</b>
            </td>
        </tr>
    </tbody>
</table>
<table cellspacing="0" cellpadding="3" border="0" width="100%">
    <tr>
        <td>
            <%
                if (item != null && item.size() > 0) {

                        Iterator it = item.keySet().iterator();
                        while (it.hasNext()) {
                            String key = (String) it.next();
                            out.println("<img height='8' border='0' align='absmiddle' width='8' src='"
                                    + request.getContextPath() + "/images/icons/bullet_creme.gif' />");
                            out.println("<b>" + key + "</b>: ");
                            out.println(item.get(key) + "<br>");
                        }
                    } else {

                        out.println("<img height='8' border='0' align='absmiddle' width='8' src='"
                                + request.getContextPath() + "/images/icons/bullet_creme.gif' />");
                        out.println("所有问题");
                    }
            %>
        </td>
    </tr>
</table>
<%
    } //endif
%>