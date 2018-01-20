<%--
    Description:Delete a permission scheme,use to confirm you want to delete this permission scheme.
    Author:Sun Chongyang 
 --%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>
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
    <form action="doDeletePermissionScheme.jsp">
        <table class="simpleform maxWidth">
            <tbody>
                <tr>
                    <td class="simpleformheader" colspan="2">
                        <h3 class="formtitle">Delete Permission Scheme</h3>
                    </td>
                </tr>
                <tr>
                    <td class="simpleformheader" colspan="2">
                        <input type="hidden" value="<s:property value="schemeId"/>" name="schemeId" />
                        <p>
                            Are you sure you want to delete
                            <u>
                                <s:property value="name" />
                            </u>
                            ?
                            <br />
                            "
                            <s:property value="desc" />
                            "
                        </p>
                        <s:if test="flag">

                            <p>
                                Note: Test Permission Scheme is currently associated with:
                                <s:iterator value="#project" var="p">
                                    <a href="/jsp/backend/project/viewProjectDetail.jsp?projectId=<s:property value="#p.projectId"/>">
                                        <s:property value="#p.name" />
                                    </a>
                            .
                            <br />

                                </s:iterator>
                                <br />
                                If you delete this scheme all associated projects will be associated with the Default Permission Scheme
                            </p>
                        </s:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input id="删除" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="删除" name="删除" />
                        <input id="cancelButton" type="button" onclick="location.href='viewPermissionSchemes.jsp'" value="取消" name="viewPermissionSchemes.jsp" title="取消 (Alt + `)" accesskey="`" />
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>