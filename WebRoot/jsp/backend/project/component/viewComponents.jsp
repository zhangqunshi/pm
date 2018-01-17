<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<br>
<br>
<b>Components</b>
<br>
<a href="<c:url value='/jsp/backend/project/component/addProjectComponent.jsp'/>?projectId=<s:property value="#project.projectId" />">Add</a>
a new component
<br>
<s:set var="size" value="#components.size()" />
<s:if test="size==0">
        There are no components at the moment.
    </s:if>
<s:else>
    <table>
        <s:iterator value="#components" var="component">
            <tr>
                <td>
                    <img hspace="0" height="16" border="0" width="16" style="vertical-align: top;" src="<c:url value='/images/icons/component.gif'/>" name="assigneeImage" alt="项目模块" title="<s:property value="#component.name" /> - <s:property value="#component.description" />">
                </td>
                <td>
                    <s:property value="#component.name" />
                </td>

                <td>
                    <s:set var="leader" value="#component.leader" />
                    <s:if test="leader == \"\"">   
                    无
                    </s:if>
                    <s:else>
                        负责人: <s:property value="#component.leader" />
                    </s:else>
                </td>
                <td>
                    <a href="/pmhb/jsp/backend/project/component/deleteProjectComponent.jsp?idd=<s:property value="#component.id" />&id=<s:property value="#project.projectId" />">删除</a>
                    |
                    <a href="/pmhb/jsp/backend/project/component/updateProjectComponent.jsp?idd=<s:property value="#component.id" />&id=<s:property value="#project.projectId" />">编辑</a>
                </td>
            </tr>
        </s:iterator>
    </table>
</s:else>