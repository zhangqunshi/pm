<%-- 
	描述： 删除用户组里组对应的用户表单
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<form action="doMoveGroupUser.jsp">
    <table>
        <tr>
            <td bgcolor="#fffff0" align="center">
                <b>
                    <s:property value="userCount" />
                    Group Member(s)
                </b>
            </td>
        </tr>
        <tr>
            <td align="center">
                <input type="submit" value="Leave >>" />
                <input type="hidden" name="groupName" value="<s:property value="groupName"/>" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <br>
                <s:if test="flag">
                    <b>No users in selected group(s)</b>
                </s:if>
                <s:else>
                    <select id="usersToUnassign" size="20" name="groupUserId">
                        <optgroup label=<s:property value="groupName"/>>

                            <s:iterator value="#bmgu" var="b">
                                <s:if test="#b.flag">
                                    <b>nothing</b>
                                </s:if>
                                <s:else>
                                    <option value="<s:property value="#b.groupUserId"/>"><s:property value="#b.groupName"/></option>
                                </s:else>
                            </s:iterator>
                        </optgroup>
                    </select>
                </s:else>
            </td>
        </tr>
    </table>
</form>