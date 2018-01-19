<%-- 
	描述：显示所有问题解决结果
	作者: Kris
	日期: 2008-12-27
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
                <h3 class="formtitle">View Resolutions</h3>
                <p>The table below shows the resolutions used</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>名称</th>
                            <th>描述</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="#resolutionList" var=" r">
                            <tr>
                                <td>
                                    <b>
                                        <s:property value="#r.name" />
                                    </b>
                                    <s:if test="#r.idDefault==resolutionDefault">
                                        <br>(Default)
                                    </s:if>
                                </td>
                                <td>
                                    <s:property value="#r.description" />
                                </td>
                                <td width="150">
                                    <a href="updateResolution.jsp?id=<s:property value="r.id"/>">编辑</a>
                                    |
                                    <a href="deleteResolution.jsp?id=<s:property value="r.id"/>">删除</a>
                                    <s:if test="#r.idDefault==resolutionDefault">
                                    |<a href="MakeDefaultResolution.jsp?make=<s:property value="r.id"/>">Default</a>
                                    </s:if>
                                </td>
                            </tr>
                        </s :iterator>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12"><%@include file="/jsp/backend/issue/resolution/addResolution.jsp"%></div>
        </div>
    </div>
</body>
</html>