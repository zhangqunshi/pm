<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<!-- 功能：添加问题优先级 -->
<!-- @author: 许希光-->
<%
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    String color = request.getParameter("color");
    String iconUrl = request.getParameter("iconUrl");

    boolean flag = false;
    String error = "";
    if (StringUtils.isBlank(name)) {
        flag = true;
        error += "the name can't be empty<br> ";
    }
    if (StringUtils.isBlank(color)) {
        flag = true;
        error += "You must specify a color for the status bar.<br>";
    }
    if (StringUtils.isBlank(iconUrl)) {
        flag = true;
        error += "You must specify a URL for the icon of this new priority.<br>";
    }
    if (flag) {
        request.setAttribute("error", error);
%>
<jsp:forward page="viewIssuePriority.jsp"></jsp:forward>
<%
    }

    IssuePriority issuePriority = new IssuePriority();
    issuePriority.setName(name);
    issuePriority.setDescription(description);
    issuePriority.setPriorityColor(color);
    issuePriority.setIconUrl(iconUrl);
    IssuePriorityhbm ip = new IssuePriorityhbm();
    ip.setName(name);
    ip.setDescription(description);
    ip.setPriorityColor(color);
    ip.setIconUrl(iconUrl);
    IssuePriorityBO issuePriorityBO = new IssuePriorityBO();
    if (!issuePriorityBO.exist(issuePriority)) {

        issuePriorityBO.addIssuePriority(ip);
        out.println("添加成功");
%>
<jsp:forward page="viewIssuePriority.jsp"></jsp:forward>
<%
    } else {
        request.setAttribute("error", "The name already exist");
%>
<jsp:forward page="viewIssuePriority.jsp"></jsp:forward>
<%
    }
%>
