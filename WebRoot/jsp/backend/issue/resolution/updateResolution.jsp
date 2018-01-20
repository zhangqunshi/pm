<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body>
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <h3>
                    Edit Resolution:
                    <s:property value="name" />
                </h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">

                <%@include file="/jsp/showErrorMessage.jsp"%>
                <form action="doUpdateResolution.jsp" method="post" class="bs-example bs-example-form" role="form">
                    <div class="input-group">
                        <span class="input-group-addon">名称</span>
                        <input type="text" value="<s:property value="name"/>" size="30" name="name" class="form-control" placeholder="twitterhandle" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">描述</span>
                        <input type="text" value="<s:property value="description"/>" size="60" name="description" class="form-control" placeholder="twitterhandle" />
                    </div>
                    <input id="id" type="hidden" value="<s:property value="id"/>" name="id" />
                    <input id="isDefault" type="hidden" value="<s:property value="isDefault"/>" name="isDefault" />
                    <input id="更新" class="btn btn-info btn-block" type="submit" title="按 Alt+S 提交" accesskey="S" value="更新" name="更新" />
                    <input id="cancelButton" type="button" onclick="location.href='viewResolutions.jsp'" value="取消" title="取消 (Alt + `)" accesskey="`" class="btn btn-warning btn-block" />
                </form>
            </div>
        </div>
    </div>

</body>
</html>