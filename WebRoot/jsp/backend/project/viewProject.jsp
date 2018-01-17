<%-- 
	描述：查看所有项目
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="formtitle">Administration</h3>
                <p>Below is the list of all projects</p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <p>
                    <!-- <img height="8" border="0" width="8" src="<%=request.getContextPath()%>/images/icons/bullet_creme.gif" /> -->
                    <b>
                        <a href="addProject.jsp" id="add_project" class="btn btn-info btn-block">Add Project</a>
                    </b>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>项目</th>
                            <th>Key</th>
                            <th>网址</th>
                            <th>项目负责人</th>
                            <th>建立时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="#projList" var="proj">
                            <tr>
                                <td>
                                    <a href="detailProject.action?projectId=<s:property value="#proj.projectId" />">
                                        <s:property value="#proj.name " />
                                    </a>
                                </td>

                                <td>
                                    <s:property value="#proj.projectKey" />
                                </td>
                                <s:set var="url" value="#proj.url" />
                                <s:set var="http" value="http://" />
                                <s:if test="url == http">
                                    <td>没有网址</td>
                                </s:if>
                                <s:else>
                                    <td>
                                        <a href="#proj.url">
                                            <s:property value="#proj.url" />
                                        </a>
                                    </td>
                                </s:else>
                                <td>
                                    <a href='#'>
                                        <s:property value="#proj.leader" />
                                    </a>
                                </td>
                                <td>
                                    <s:property value="#proj.createDate" />
                                </td>
                                <td>
                                    <a href="detailProject.action?projectId=<s:property value="#proj.projectId" />">查看</a>

                                    <a href="deleteProject.action?projectId=<s:property value="#proj.projectId" />" onclick="return confirmDelete();">删除</a>

                                    <a href="aupdateProject.action?projectId=<s:property value="#proj.projectId" />">编辑</a>
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>