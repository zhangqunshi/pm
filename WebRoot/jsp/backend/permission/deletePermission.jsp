<%-- 
    Description: Use to confirm you want to delete this permission assignee. 
                 When you delete it,the role,group or person will lose this permission.
    Author:Sun Chongyang
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
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


    <form action="doDeletePermission.jsp">
        <table class="simpleform maxWidth">
            <tbody>
                <tr>
                    <td class="simpleformheader" colspan="2">
                        <h3 class="formtitle">Delete Permission</h3>
                    </td>
                </tr>
                <tr>
                    <td class="simpleformheader" colspan="2">
                        <input type="hidden" value="<s:property value="id"/>" name="id" />
                        <input type="hidden" value="<s:property value="schemeId"/>" name="schemeId" />
                        Are you sure you want to delete
                        <b>
                            <s:property value="#permissionAssignee.assigneeType"/></b>
                        (<s:property value="#permissionAssignee.assignee"/>) for permission:
                        <b><s:property value="#permissionAssignee.permission.name"/></b>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="fullyCentered simpleformfooter" colspan="2">
                        <input id="删除" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="删除" name="删除" />
                        <input id="cancelButton" type="button" onclick="window.history.back();" value="取消" name="Cancel" title="取消 (Alt + `)" accesskey="`" />
                    </td>
                </tr>
            </tbody>
        </table>
    </form>

</body>
</html>
