<%-- 
	描述：删除项目
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h3>
                Delete Project:<s:property value="#project.name"/>
            </h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <p>Confirm that you want to delete this project and all its issues, components and versions.</p>
            <p>
                <font color="#cc0000">
                    WARNING: This operation cannot be undone. If you wish to save the project data, it is recommended that you
                    <a href="#">back it up first</a>
                    .
                </font>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <input type="hidden" value="<s:property value="#project.id"/>" name="projectId" id="projectId" />
            <input type="hidden" value="true" name="confirm" />
            <input type="submit" class="spaced" title="按 Alt+S 提交" accesskey="S" onclick="location.href='<c:url value="/jsp/backend/project/doDeleteProject.action"/>?projectId=<s:property value="#project.id"/>'" value="删除" id="删除" name="删除" />
            <input type="button" onclick="window.history.back();" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
        </div>
    </div>
</div>