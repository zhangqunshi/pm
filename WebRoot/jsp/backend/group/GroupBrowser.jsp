<%-- 
	描述： 浏览用户组信息
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
    <table>
        <tr>
            <td width="100%" style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
                <table>
                    <tr bgcolor="#f0f0f0">
                        <td>
                            <h3 class="formtitle">Group Browser</h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="simpleformbody">
                            <p>The Group Browser allows you to browse all the groups in the system. You can also add and remove groups from here.</p>
                            <p>Only System Administrators are allowed to delete or edit members of groups with the 'System Administrators' permission.</p>
                            <p />
                            <ul class="square">
                                <li>
                                    <b>
                                        <a id="bulk_edit_groups" href="BulkEditUserGroups!default.jsp">Bulk Edit Group Members</a>
                                    </b>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td><%@ include file="viewGroup.jsp"%>
            </td>
        </tr>
        <tr>
            <td width="50%"><%@ include file="addGroup.jsp"%></td>
        </tr>
    </table>
</body>
</html>