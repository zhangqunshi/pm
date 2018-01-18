<%-- 
	描述：显示所有问题类型
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="formtitle">Manage Issue Types</h3>
                <p>The table below shows the issue types used. The issue types below are displayed in alphabetical order.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>名称</th>
                            <th>描述</th>
                            <th>图标</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="#issueTypeList" var="it">
                            <tr>
                                <td>
                                    <b>
                                        <s:property value="#it.name" />
                                    </b>
                                </td>
                                <td>
                                    <s:property value="#it.description" />
                                </td>
                                <td>
                                    <img src="<%=request.getContextPath()%><s:property value="#it.iconUrl"/>" />
                                </td>
                                <td>
                                    <a href="deleteIssueType.jsp?id=<s:property value="#it.id"/>" onclick="return confirmDelete();">删除</a>
                                    |
                                    <a href="updateIssueType.jsp?id=<s:property value="#it.id"/>">编辑</a>
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <%@include file="/jsp/backend/issue/type/addIssueType.jsp"%>
            </div>
        </div>
    </div>
</body>
</html>