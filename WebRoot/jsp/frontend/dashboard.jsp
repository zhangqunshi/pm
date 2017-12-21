<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="page"%>
<html>
<head>
</head>
<body>

    <table width="100%" border="0">
        <tr>
            <td width="50%" valign="top">
                <%@include file="/jsp/frontend/project/viewProjectFront.jsp"%>
            </td>
            <td width="50%" valign="top">
                <%@include file="/jsp/frontend/issue/issueForMe.jsp"%>
                <br>
                <%@include file="/jsp/frontend/issue/issueInProgress.jsp"%>
            </td>
        </tr>
    </table>
</body>
</html>
