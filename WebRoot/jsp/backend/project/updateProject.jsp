<%-- 
	描述：修改项目
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

<script language=javascript>
    function isNull(str) {
        if (str == "")
            return true;
        var regu = "^[ ]+$";
        var re = new RegExp(regu);
        return re.test(str);
    }
    function IsURL(str_url) {
        var strRegex = "^(http?://)";
        var re = new RegExp(strRegex);

        if (re.test(str_url)) {
            return (true);
        } else {
            return (false);
        }
    }
    function test() {
        var url = myForm.url.value;

        var name = myForm.name.value;

        if (isNull(name)) {
            window.alert("错误：请填写Project名称！");
            return false;
        }

        var projectKey = myForm.projectKey.value;

        if (isNull(projectKey)) {
            window.alert("错误：请填写ProjectKey！");
            return false;
        }
        if (url != "") {
            if (!IsURL(url)) {

                window.alert("错误：请填写正确的URL！");
                return false;
            }
        }
        var lead = myForm.lead.value;

        if (isNull(lead)) {
            window.alert("错误：请选择LeaderId！");
            return false;
        }
    }
</script>
</head>
<body>
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <h3 class="formtitle">
                    Edit Project:
                    <s:property value="#project.name" />
                </h3>
                <br />
                Use this page to update your project details.
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <%@include file="/jsp/showErrorMessage.jsp"%>
                <form action="updateProject.action" name="myForm" onsubmit="return test();" class="bs-example bs-example-form" role="form">
                    <input type="hidden" name="projectId" value="<s:property value="#project.id"/>" class="form-control" placeholder="twitterhandle"></input>
                    <div class="input-group">
                        <span class="input-group-addon">名称</span>
                        <input type="text" name="name" value="<s:property value="#project.name"/>" class="form-control" placeholder="name"></input>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">网址</span>
                        <input type="text" name="url" value="<s:property value="#project.url"/>" class="form-control" placeholder="url"></input>
                    </div>
                    <script>
                       function openWindow(element) {
                          var vWinUsers = window.open('<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element='+ element,'UserPicker',
                                                      'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
                          vWinUsers.opener = self;
                          vWinUsers.focus();
                       }
                     </script>
                    <div class="input-group">
                        <span class="input-group-addon">*项目负责人</span>
                        <input type="text" id="lead" name="lead" autocomplete="off" value="<s:property value="#project.leader"/>" class="form-control" placeholder="leader"></input>
                        <span class="input-group-addon">
                            <a href="javascript:openWindow('lead');">
                                <img hspace="0" height="16" border="0" width="16" style="vertical-align: top;" src="<c:url value='/images/icons/filter_public.gif'/>" name="assigneeImage" alt="选择一个用户" title="选择一个用户">
                            </a>
                        </span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">描述</span>
                        <textarea warp="virtual" name="description" cols="150" rows="6" title="<s:property value="#project.description"/>" class="form-control" placeholder="description"><s:property value="#project.description"/></textarea>
                    </div>
                    <input type="submit" value="更新" class="btn btn-primary btn-block">
                    <input type="button" onclick="location.href='viewProjectDetail.jsp?projectId=<s:property value="#project.id"/>'" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" class="btn btn-warning btn-block" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>