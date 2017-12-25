<%-- 
	描述： 编辑组信息
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
<head>

</head>
<body>

    <table cellspacing="0" cellpadding="10" border="0" width="100%">
        <tbody>
            <tr>
                <td>
                    <table class="simpleform maxWidth">
                        <tbody>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                    <h3 class="formtitle">Bulk Edit Group Members</h3>
                                </td>
                            </tr>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                    This page allows you to edit the user memberships for each group.
                                    <p>You can add to and remove users from multiple groups at a time. When selecting multiple groups please note:</p>
                                    <li>All the common users in the selected groups are displayed under the 'All' label and the remaining disparate users are displayed under the label with its group name.</li>
                                    <li>
                                        <b>Removing Users</b>
                                        - Removing user(s) listed in the 'All' section will remove the selected user(s) from all of the selected groups. However if user(s) are selected under a specific group name(s), the selected user(s) will be removed from the group its listed under.
                                    </li>
                                    <li>
                                        <b>Adding Users</b>
                                        - All user(s) to be added are added to all of the selected group(s).
                                        <p>
                                            <b>Step 1:</b>
                                            Select group(s) to edit and refresh the members list
                                            <br />
                                            <b>Step 2:</b>
                                            Select users to leave OR join the selected group(s) and click on the corresponding button
                                        </p>
                                    </li>
                                    <%
                                        String errMsg = (String) request.getParameter("errMsg");
                                        if (StringUtils.isBlank(errMsg)) {
                                            errMsg = "";
                                        }
                                        out.println("<font color='red'><b>" + errMsg + "</b></font>");
                                    %>
                                </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%">
                                        <tr>
                                            <td align="center" valign="top"><%@ include file="BulkEditViewGroup.jsp"%></td>
                                            <td align="center" valign="top"><%@ include file="BulkEditMoveGroupUser.jsp"%></td>
                                            <td align="center" valign="top"><%@ include file="BulkEditAddGroupUser.jsp"%></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
