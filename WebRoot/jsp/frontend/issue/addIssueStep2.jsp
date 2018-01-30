<%-- 
    Document   : 创建问题第2步骤
    Created on : 2008-12-24
    Author     : Kris
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>  
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
<head>
<title>Add Issue</title>
<script src="/pmhb/includes/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/includes/js/calendar/calendar-min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/includes/js/calendar/calendar-setup-min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/includes/js/calendar/calendar-zh.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/includes/js/calendar/skins/aqua/calendar.css" media="all" rel="styleSheet" type="text/css" />
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-5">
                <h3>创建问题</h3>
                步骤2（共2）：填写问题的详细信息
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <%@include file="/jsp/showErrorMessage.jsp"%>
                <form action="doAddIssue.jsp" class="bs-example bs-example-form" role="form">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <input type="hidden" name="projectId" value="<s:property value="projectId"/>">
                                <input type="hidden" name="projectkey" value="<s:property value="#proj.projectKey"/>">
                                <h4 class="text-success text-center">
                                                                项目:<s:property value="#proj.name"/></h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <input type="hidden" name="issueTypeId" value="<s:property value="issueTypeId"/>">
                                <h4 class="text-success text-center">
                                                                问题类型:<s:property value="#issueType.name"/></h4>
                            </div>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">概要</span>
                        <input type="text" name="summary" size="50" class="form-control" placeholder="问题名称" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">优先级</span>
                        <select name="priorityLevelId" class="form-control">
                            <s:iterator value="#a2List" var="a2">
                                <s:if test="#as.major==true">
                                    <option selected value="<s:property value="#a2.ip.id"/>"><s:property value="#a2.ip.name"/></option selected>
                                </s:if>
                                <s:else>
                                    <option value="<s:property value="#a2.ip.id"/>"><s:property value="#a2.ip.name"/></option>
                                </s:else>            
                            </s:iterator>
                        </select>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">逾期日期</span>
                        <input type="text" id="planEndTime" name="planEndTime" size="20" class="form-control" placeholder="截止日期" />
                        <span class="input-group-addon">
                            <img height="16" border="0" width="16" title="选择日期" alt="选择日期" src="<c:url value='/images/icons/cal.gif'/>" id="duedate_trigger_c" />
                        </span>
                        <script type="text/javascript">   
                        Calendar.setup({
                            firstDay : 0, // first day of the week
                            inputField : "planEndTime", // id of the input field
                            button : "duedate_trigger_c", // trigger for the calendar (button ID)
                            align : "Tl", // alignment (defaults to "Bl")
                            singleClick : true,
                            ifFormat : "%Y-%m-%e" // our date only format
                        });                                                                       
                       </script>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">模块</span>
                        <s:if test="flag==true"> 
                            <span class="input-group-addon">未知</span>
                        </s:if>
                        <s:else>
                            <select name="componentId" size="5" class="form-control">
                            <s:iterator value="#pcList" var="pc">
                                <option value="<s:property value="#pc.id"/>">
                        			<s:property value="#pc.name"/>          
                                </option>
                            </s:iterator>
                            </select>
                        </s:else>            
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">开发者</span>
                        <select name="developerId" class="form-control">
                        <s:if test="#projUsers!=null">
                            <s:iterator value="#projUsers" var="proj">             
                            </s:iterator>
                        </s:if>              
                            <option value="<s:property value="#proj.userId"/>"><s:property value="#proj.userName"/></option>                      
                        </select>
                    </div>
                    <script> 
                    function openWindow(element) {
                        var vWinUsers = window.open(
                                        '<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element='
                                                + element,
                                        'UserPicker',
                                        'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
                        vWinUsers.opener = self;
                        vWinUsers.focus();
                    }                                                             
                   </script>
                    <div class="input-group">
                        <span class="input-group-addon">报告人</span>
                        <input type="text" name="reporter" id="reporter" autocomplete="off" class="form-control" placeholder="reporter" />
                        <span class="input-group-addon">
                            <a href="javascript:openWindow('reporter');">
                                <img hspace="0" height="16" border="0" width="16" style="vertical-align: top;" src="<c:url value='/images/icons/filter_public.gif'/>" name="assigneeImage" alt="选择一个用户" title="选择一个用户">
                            </a>
                        </span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">环境</span>
                        <textarea name="environment" rows="6" cols="100" class="form-control" placeholder="例如操作系统，软件环境或者相关硬件"></textarea>
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon">描述</span>
                        <textarea name="description" rows="6" cols="100" class="form-control" placeholder="description"></textarea>
                    </div>
                    <input type="submit" value="创建" class="btn btn-info btn-block" />
                    <input type="button" onclick="location.href='<c:url value="/jsp/frontend/dashboard.jsp"/>'" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" class="btn btn-warning btn-block" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>