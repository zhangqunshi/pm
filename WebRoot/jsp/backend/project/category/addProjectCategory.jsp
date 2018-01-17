<%-- 
	描述：新建项目分类
	作者: Kris
	日期: 2008-12-25
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<h3>Add New Project Category</h3>
<%@include file="/jsp/showErrorMessage.jsp"%>
<form class="bs-example bs-example-form" role="form" action="doAddProjectCategory.jsp">
    <div class="input-group">
        <span class="input-group-addon">名称</span>
        <input type="text" name="name"  class="form-control" placeholder="名称" />
    </div>
    <div class="input-group">
        <span class="input-group-addon">描述</span>
        <input type="text" name="desc" class="form-control" placeholder="描述" />
    </div>
    <input type="submit" value="增加" class="btn btn-info btn-block" />
</form>