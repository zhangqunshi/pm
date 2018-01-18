<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<!-- 功能：更新问题状态-->
<!-- @author 许希光 -->
<%
    String name2 = request.getParameter("name");
    String desc2 = request.getParameter("desc");
    int issueStatusId = Integer.parseInt(request.getParameter("id"));
    String iconUrl = request.getParameter("filename");

    //检查参数
    boolean hasError = false;
    String errMsg = "";
    if (StringUtils.isBlank(name2)) {
        hasError = true;
        errMsg += "<li>Issue Priority name can't be empty!</li>";
    }

    IssueStatusBO issueStatusBO = new IssueStatusBO();
    IssueStatushbm issueStatus = issueStatusBO.getIssueStatus(issueStatusId);
    IssueStatus i = new IssueStatus();
    issueStatus.setName(name2);
    issueStatus.setDescription(desc2);
    issueStatus.setIconUrl(iconUrl);
    
    i.setName(name2);
    i.setDescription(desc2);
    i.setIconUrl(iconUrl);
    if (issueStatusBO.exist(i)) {
        String error = "错误：该名称已存在，请重新命名！";
        request.setAttribute("error", error);
%>
<jsp:forward page="updateIssueStatus.jsp">
    <jsp:param name="id" value="<%=issueStatusId%>" />
</jsp:forward>
<%
    } else {
        issueStatusBO.updateIssueStatus(issueStatus);
%>
<jsp:forward page="viewIssueStatus.jsp"></jsp:forward>
<%
    }
%>