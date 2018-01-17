<%-- 
	描述：显示所有问题状态
	作者: Kris
	日期: 2008-12-25
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="formtitle">View Statuses</h3>
                <p>The table below shows the statuses used</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Status Details</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="#issueStatus" var="is">
                            <tr>
                                <td>
                                    <img src="<%=request.getContextPath()%><s:property value="#is.iconUrl"/>" />
                                    <b>
                                        <s:property value="name" />
                                    </b>
                                    <br>
                                    <s:property value="#is.description" />
                                </td>
                                <td width="100">
                                    <a href="updateIssueStatus.jsp?id=<s:property value="#is.id"/>">编辑</a>
                                    <s:if test="#is.id==open||#is.id==close||#is.id==inProgress||#is.id==reopen||#is.id==resolved">
                                        ""
                                    </s:if>
                                    <s:else>
                                    |<a href="deleteIssueStatus.jsp?id=<s:property value="#is.id"/>">删除</a>
                                    </s:else>
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12"><%@include file="/jsp/backend/issue/status/addIssueStatus.jsp"%></div>
        </div>
    </div>
</body>
</html>