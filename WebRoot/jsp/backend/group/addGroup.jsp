<%-- 
	描述： 新建用户组表单
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<form method="post" action="doAddGroup.jsp" class="bs-example bs-example-form" role="form">
    <h3 class="formtitle">Add Group</h3>
    <font color='red'>
        <b>
            <s:property value="exitName" />
        </b>
    </font>
    <div class="input-group">
        <span class="input-group-addon">名称</span>
        <input type="text" name="groupName" class="form-control" placeholder="twitterhandle" />
    </div>
    <input type="submit" value="Add Group" name="add_group" class="btn btn-info btn-block" />
</form> 