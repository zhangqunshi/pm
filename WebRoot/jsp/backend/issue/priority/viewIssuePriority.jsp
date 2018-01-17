<%-- 
	描述：显示所有问题优先级
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<script src="/pmhb/includes/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="formtitle">View Priorities</h3>
                <p>The table below shows the priorities used</p>
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
                            <th>颜色</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="#issuePriorityList" var="ip">
                            <tr>
                                <td>
                                    <s:property value="#ip.name" />
                                </td>
                                <td>
                                    <s:property value="#ip.description" />
                                </td>
                                <td>
                                    <img src='" + request.getContextPath() + issuePriority.getIconUrl() + "' />
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td bgcolor="<s:property value="#ip.priorityColor"/>">
                                                <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%>/images/border/spacer.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <a href="deleteIssuePriority.jsp?id=<s:property value="ip.id"/>">删除</a>
                                    |
                                    <a href="updateIssuePriority.jsp?id=<s:property value="ip.id"/>">编辑</a>
                                </td>
                            </tr>

                        </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <%@include file="/jsp/backend/issue/priority/addIssuePriority.jsp"%>
            </div>
        </div>
    </div>
</body>
</html>