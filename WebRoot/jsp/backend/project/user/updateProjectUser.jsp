<%-- 
	描述： 新建项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
    <form action="doUpdateProjectUser.jsp">
        project Name:
        <input type="text" name="name" value="<s:property value="projectName"/>" readonly="readonly" />
        <input type="hidden" name="projectId" value="<s:property value="projectId"/>" />
        <br>
        <br>
        User Name:
        <s:if test="ul">
            <select name="userId"><option></option></select>
            <a href='../../user/addUser.jsp'>Add User</a>
        </s:if>
        <s:else>
            <select name="userId">
                <s:iterator value="#uList" var="u">
                    <s:if test="#u.id==projectUserOfUserId">
                        <option selected value="<s:property value="#u.id"/>">
								<s:property value="#u.name"/>
                                </option selected>
                    </s:if>
                    <s:else>
                        <option value="<s:property value="#u.id"/>"><s:property value="#u.name"/></option>
                    </s:else>
                </s:iterator>
            </select>
        </s:else>
        
        <br>
        <br>
        Role Name:
        <s:if test="rl">
            <select name='roleId'><option></option></select>
            <a href='../../user/addRole.jsp'>Add Role</a>
        </s:if>
        <s:else>
            <select name="roleId">
                <s:iterator value="lList" var="l">
                    <s:if test="#l.id==projectUserOfUserId">
                        <option selected value="<s:property value="#l.id"/>"><s:property value="#l.name"/></option selected>
                    </s:if>
                    <s:else>
                        <option value="<s:property value="#l.id"/>"><s:property value="#l.name"/></option>
                    </s:else>
                </s:iterator>
            </select>
        </s:else>
       
        <br>
        <br>
        <input type="hidden" value=<s:property value="projectUserId"/> name="projectUserId">
        <input type="submit" value="更新">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="取消">
    </form>
</body>
</html>
