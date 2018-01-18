<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
    //得到参数
    String id = request.getParameter("id");
    String newId = request.getParameter("newId");

    //转化参数
    int resolutionId = Integer.parseInt(id);
    int resolutionNewId = Integer.parseInt(newId);

    //
    ResolutionBO rb = new ResolutionBO();
    Resolutionhbm resolution = rb.getResolution(resolutionId);
    List list = rb.getIssueByLinkIssue(resolutionId);
    if (list == null || list.size() <= 0) {
        rb.deleteResolution(resolutionId);
    } else {
        IssueBO ib = new IssueBO();
        ib.updateIssueByResolution(resolutionId, resolutionNewId);
        rb.deleteResolution(resolutionId);
    }
%>
<jsp:forward page="viewResolutions.jsp" />