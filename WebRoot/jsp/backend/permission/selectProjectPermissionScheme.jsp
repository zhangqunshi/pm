<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
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
    <form action="changeProjectPermissionScheme.jsp">
        <table class="simpleform maxWidth">
            <tbody>
                <tr>
                    <td class="simpleformheader" colspan="2">
                        <h3 class="formtitle">Associate Permission Scheme to Project</h3>
                    </td>
                </tr>
                <tr>
                    <td class="simpleformheader" colspan="2">This page allows you to associate a permission scheme with this project.</td>
                </tr>
                <tr>
                    <td class="fieldLabelArea">Scheme:</td>
                    <td class="fieldValueArea" bgcolor="#ffffff">
                        <select id="schemeId" name="schemeId">
                        <s:iterator value="#psList" var="ps">

                            <option value="<s:property value="#ps.id"/>">
									<s:property value="ps.name"/>
								</option>         
                            </s:iterator>
                        </select>
                        <span id="schemeId" class="selectDescription" />
                    </td>
                </tr>
                <input id="projectId" type="hidden" value="<s:property value="projectId"/>" name="projectId" />
                <tr>
                    <td class="fullyCentered simpleformfooter" colspan="2">
                        <input id="Associate" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="Associate" name="Associate" />
                        <input id="cancelButton" type="button" onclick="location.href='<%=request.getContextPath()%>/jsp/backend/project/viewProjectDetail.jsp?projectId=<s:property value="projectId"/>'" value="取消" name="" title="取消 (Alt + `)" accesskey="`" />
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>