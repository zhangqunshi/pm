<%-- 
	描述: 更新问题类型
	作者: Kris
	日期: 2008-12-29
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<script language=javascript>
    function isNull(str) {
        if (str == "")
            return true;
        var regu = "^[ ]+$";
        var re = new RegExp(regu);
        return re.test(str);
    }
    function test() {
        var name = myForm.name.value;

        if (isNull(name)) {
            window.alert("错误：请填写IssueType名称！");
            return false;
        }
    }
</script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="formtitle">
                    Edit Issue Type:
                    <s:property value="name" />
                </h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <%@include file="/jsp/showErrorMessage.jsp"%>
                <form action="doUpdateIssueType.jsp" name="myForm" onsubmit="return test();" class="bs-example bs-example-form" role="form">

                    <div class="input-group">
                        <span class="input-group-addon">* 名称</span>
                        <input type="text" name="name" value="<s:property value="name"/>" class="form-control" placeholder="name" />
                    </div>
                    <input type="hidden" name="id" value="<s:property value="id"/>" />
                    <div class="input-group">
                        <span class="input-group-addon">描述</span>
                        <input type="text" name="desc" value="<s:property value="description"/>" class="form-control" placeholder="description">
                    </div>
                    <script>
                       function openWindow(element) {
                          var vWinUsers = window.open('<c:url value="/jsp/backend/issue/type/typeIconPicker.jsp"/>?element='+ element,
                                                      'UserPicker','status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
                          vWinUsers.opener = self;
                          vWinUsers.focus();
                       }
                     </script>
                    <div class="input-group">
                        <span class="input-group-addon">* Icon URL</span>
                        <input type="text" id="filename" name="url" value="<s:property value="iconUrl"/>" class="form-control" placeholder="not know" />
                        <span class="input-group-addon">
                            <a href="javascript:openWindow('filename');">select image</a>
                        </span>
                    </div>
                    <input type="submit" value="更新" class="btn btn-info btn-block" />
                    <input type="button" onclick="location.href='viewIssueType.jsp'" value="取消" class="btn btn-warning btn-block" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>