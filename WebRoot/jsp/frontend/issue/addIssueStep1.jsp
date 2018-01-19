<%-- 
    Document   : 创建问题第一步骤
    Created on : 2008-12-24
    Author     : Kris
--%>
<%@ page language="java" contentType="text/html;chaset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="/pmhb/includes/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-5">
                <h3>创建问题</h3>
                步骤1（共2）：选择项目和问题类型
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <form action="addIssueStep2.jsp" method="post" role="form">
                    <div class="form-group">
                        <label for="name">* 项目</label>
                        <select name="projectId" class="form-control">
                            <s:iterator value="#projs" var="p">            
                            <option value="<s:property value="#p.id"/>"><s:property value="#p.name"/></option>                  
                            </s:iterator>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="name">* 问题类型</label>
                        <select name="issueTypeId" class="form-control">
                        <s:iterator value="#issueTypes" var="it">                          
                            <option value="<s:property value="#it.id"/>"><s:property value="#it.name"/></option>                      
                            </s:iterator>
                        </select>
                        <input type="submit" value="下一步>>" class="btn btn-info btn-block" />
                        <input type="button" onclick="location.href='<c:url value="/jsp/frontend/dashboard.jsp"/>'" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" class="btn btn-warning btn-block" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>