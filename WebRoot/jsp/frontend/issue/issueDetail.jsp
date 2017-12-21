<%-- 
	描述: 显示该问题的详细信息, 包括与这个问题相关的备注信息
	作者: Kris
	日期: 2008-12-22
	注意: 这个页面被issueDetailLayout.jsp包含, 另外传递过来的issue对象包括所有信息
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    //由于在其他页面也需要issue信息，所以把issue信息保存在request中，供所有页面使用
    Issue issueR = (Issue) request.getAttribute("issue");
    if (issueR == null) {
        out.println("问题信息为null");
        return;
    }
%>
<table cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td bgcolor="#f0f0f0" valign="top">
            <b>
                <a href="#"><%=issueR.getProjectName()%></a>
            </b>
            <br />
            <h3 class="formtitle">
                <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%>/images/icons/link_out_bot.gif" /><%=issueR.getName()%></h3>
            <font size="1">
                创建:
                <span class="date"><%=issueR.getCreateDate()%></span>
                  更新:
                <span class="date"><%=issueR.getLastUpdateDate()%></span>
                逾期:
                <font color="#336699"><%=issueR.getPlanEndTime()%></font>
            </font>
        </td>
    </tr>
</table>
<table border="0" width="100%">
    <tr>
        <td width="20%">
            <b>模块:</b>
        </td>
        <td width="80%">
            <%
                if (issueR.getComponentName() == null) {
                    out.println("无");
                } else {
                    out.println(issueR.getComponentName());
                }
            %>
        </td>
    </tr>
    <tr>
        <td width="20%">
            <b>环境:</b>
        </td>
        <td width="80%">
            <%
                if (issueR.getEnvironment() == null) {
                    out.println("无");
                } else {
                    out.println(issueR.getEnvironment());
                }
            %>
        </td>
    </tr>
</table>
<br />
<div id="description-open" style="display: block;">
    <table cellspacing="0" cellpadding="2" border="0" align="center" width="100%">
        <tr>
            <td nowrap="" bgcolor="#bbbbbb" align="center" width="1%">
                <font color="#ffffff">
                    <b>描述</b>
                </font>
                 
            </td>
            <td align="right"></td>
        </tr>
    </table>

    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tr>
            <td id="descriptionArea">
                <div id="description_full">
                    <%=StringUtils.replaceNewLineToBr(issueR.getDescription())%>
                </div>
            </td>
        </tr>
    </table>
</div>
<br />
<!-- 查看备注信息 -->
<%@include file="/jsp/frontend/comment/viewComments.jsp"%>

<!-- 添加备注信息 -->
<div id="lhscalinner_my" class="sidetable chromeColor" style="padding: 0pt 2px 1px; clear: both; display: none">
    <%@include file="/jsp/frontend/comment/addComment.jsp"%>
</div>




