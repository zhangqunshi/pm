<%-- 
   此页面被issueNavigatorR.jsp包含，不能单独使用
   属于issueNavigator.jsp页面的右侧顶部内容
   显示问题导航栏
   
   @author: Kris
   
   ChangeLog:
	2009-1-9 use Global.SESSION_FILTER
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%
    String title = "问题导航栏";
    String content = "";

    String createNewRT = request.getParameter("createNew");

    if ("true".equals(createNewRT)) { //如果是新建Filter
        content = "<p>问题导航栏允许你浏览系统内的所有问题. 过滤器允许你过滤你看到的问题.</p>" + "<p>使用左边的控制板,你可以创建/编辑新的过滤器.</p>";
    } else {

        List issueListInPage = (List) pageContext.getAttribute("issueList");

        if (issueListInPage == null || issueListInPage.size() == 0) { //如果没有任何问题
            content = "没有符合条件的问题 ";
        } else {
            content = "显示<b>" + issueListInPage.size() + "</b>个问题中的 <b>1</b> 到 <b>" + issueListInPage.size()
                    + "</b> ..";
        }
    }

    IssueFilter temp = (IssueFilter) session.getAttribute(Global.SESSION_FILTER);
    if (temp != null && temp.getFilterName() != null) {
        title += " — " + temp.getFilterName();
    }
%>

<table cellspacing="0" cellpadding="10" class="simpleform maxWidth" border="0">
    <tr>
        <td class="simpleformheader">
            <h3 class="formtitle">
                <%=title%>
            </h3>
        </td>
    </tr>
    <tr>
        <td class="simpleformbody">
            <%=content%>
        </td>
    </tr>
</table>

