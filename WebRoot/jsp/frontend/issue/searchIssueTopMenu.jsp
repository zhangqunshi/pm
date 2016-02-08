<%-- 
   此页面被issueNavigator.jsp包含，不能单独使用
   属于issueNavigator.jsp页面的左侧顶部内容
   
   @author: Kris
   
   ChangeLog:
	2009-1-9 use Global.SESSION_FILTER	
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%
	String createNewLT = request.getParameter("createNew"); 
	System.out.println("===searchIssueTopMenu.jsp===createNewLT===" + createNewLT);
	
	boolean isNewLT = false;
	boolean hasUnsaveFilterLT = false;
	boolean hasSavedFilterLT = false;
	
	//如果是新建issue
	if (StringUtils.isNotBlank(createNewLT) && "true".equals(createNewLT)) {
		isNewLT = true;
		session.removeAttribute(Global.SESSION_FILTER); //去掉老的filter
	}
	
	IssueFilter filterLT = (IssueFilter)session.getAttribute(Global.SESSION_FILTER);
	if (filterLT != null) {
		if (filterLT.isNotSaved()) {
			hasUnsaveFilterLT = true;
		} else {
			hasSavedFilterLT = true;
		}
	}
%>
<table cellspacing="0" cellpadding="0" border="0" bgcolor="#dddddd"
	align="center" width="100%">
	<tr>
		<td>
			<table id="filterFormHeader" cellspacing="0" cellpadding="0"
				border="0" align="center" width="100%">
					<tr>
						<td>
							过滤器:
						</td>
						<td width='1%'><a class='item' accesskey='V'title='在你当前的搜索/过滤器中查看问题' href='issueNavigator.jsp?mode=hide'>查看</a></td>
						<% 
						//如果是新建，或没有任何filter在session中，则不显示编辑
							if (!isNewLT && (hasSavedFilterLT || hasUnsaveFilterLT) ) { 
						%>
						<td width='1%'><a class='item' accesskey='V'title='在你当前的搜索/过滤器中查看问题' href='issueNavigator.jsp?mode=show'>编辑</a></td>
						<% }//endif %>
						<td width='1%'><a class='item' accesskey='V'title='在你当前的搜索/过滤器中查看问题' href='issueNavigator.jsp?mode=show&createNew=true'>新建</a></td>
						<td width='1%'><a class='item' accesskey='V'title='在你当前的搜索/过滤器中查看问题' href='ManageFilters.jsp'>管理</a></td>
					</tr>
			</table>
		</td>
	</tr>
</table>

<table cellspacing="0" cellpadding="3" border="0">
	<tr>
            <td>
            <%
            	if (isNewLT) {
            		out.println("你目前没有选中一个搜索或者过滤器.");
            	} else {
            		if (!hasSavedFilterLT) { //如果没有已保存的filter
	            		if (hasUnsaveFilterLT) { //如果有未保存的Filter
	            			out.println("你正使用一个新的,未保存的搜索. <br />");
	            			out.println("<img height='8' border='0' align='absmiddle' width='8' src='" + request.getContextPath() + "/images/icons/bullet_creme.gif' />");
	            			out.println("<a href='saveAsFilter.jsp'> <b>另存为</b> </a> 一个过滤器");
	            		} else {
	            			out.println("你目前没有选中一个搜索或者过滤器. <br>");
	            			out.println("<img height='8' border='0' align='absmiddle' width='8' src='" + request.getContextPath() + "/images/icons/bullet_creme.gif' />");
	            			out.println("<b> <a href='issueNavigator.jsp?mode=show&createNew=true'>新建</a> </b>搜索");
	            		}
            		}
            	}
            %>
            </td>
    </tr>
</table>