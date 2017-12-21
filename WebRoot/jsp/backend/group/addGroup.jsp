<%-- 
	描述： 新建用户组表单
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    String exitName = request.getParameter("exitName");
    if (StringUtils.isBlank(exitName)) {
        exitName = "";
    }
%>
<form method="post" action="doAddGroup.jsp">
    <table id="add_group" class="grid" border="0" bgcolor="#666666" width="100%">
        <tbody>
            <tr>
                <td bgcolor="#f0f0f0">
                    <h3 class="formtitle">Add Group</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <font color='red'>
                        <b><%=exitName%></b>
                    </font>
                </td>
            </tr>
            <tr>
                <td class="fieldLabelAreaTop" colspan="2">名称:</td>
            </tr>
            <tr class="" style="">
                <td class="fieldValueArea" bgcolor="#ffffff">
                    <input type="text" size="20" name="groupName" />
                </td>
            </tr>
            <tr>
                <td bgcolor="#f0f0f0" align="center">
                    <input type="submit" value="Add Group" name="add_group" />
                </td>
            </tr>
        </tbody>
    </table>
</form>