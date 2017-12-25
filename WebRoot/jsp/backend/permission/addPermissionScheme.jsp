<%-- 
    Description：添加权限模板,可以创建一个新的权限模板。
    Author:孙重阳
 --%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="/pmhb/includes/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
    <%@include file="/jsp/showErrorMessage.jsp"%>
    <form action="doAddPermissionScheme.jsp" method="post" class="bs-example bs-example-form" role="form">
        <table>
            <tbody>
                <tr>
                    <td>

                        <h3>Add Permission Scheme</h3>

                    </td>
                </tr>
                <tr>

                    <td>
                        <div class="input-group">
                            <span class="input-group-addon">名称</span>
                            <input type="text" size="30" name="name" class="form-control" placeholder="twitterhandle" />
                        </div>
                    </td>
                </tr>
                <tr>

                    <td class="fieldValueArea" bgcolor="#ffffff">
                        <div class="input-group">
                            <span class="input-group-addon">描述</span>
                            <textarea style="width: 90%;" wrap="virtual" rows="3" cols="30" name="description" class="form-control" placeholder="twitterhandle"></textarea>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fullyCentered simpleformfooter" colspan="2">
                        <input id="增加" class="btn btn-info btn-block" type="submit" title="按 Alt+S 提交" accesskey="S" value="增加" name="增加" />
                        <input id="cancelButton" type="button" onclick="location.href='viewPermissionSchemes.jsp'" value="取消" name="cancel" title="取消 (Alt + `)" accesskey="`" class="btn btn-info btn-block" />
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
