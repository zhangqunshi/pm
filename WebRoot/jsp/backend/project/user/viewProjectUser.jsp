<%-- 
	描述： 查看项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<html>
<head>

</head>
<body>
    <s:if test="flag">
        <p>项目ID不能为空</p>
    </s:if>
    <s:else>

        <div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
            <h3>
                Manage Project Role Membership for Project:
                <s:property value="name" />
            </h3>
            <p>
                On this page you can manage project role membership for the
                <a href="<%=request.getContextPath()%>/jsp/backend/project/viewProjectDetail.jsp?projectId=<s:property value="projectId"/>">
                    <b>
                        <s:property value="name" />
                    </b>
                </a>
                project.
            </p>
        </div>
        <p></p>
        <table border='1' width='100%'>
            <tr>
                <th width="200">Role</th>
                <th>Users</th>
            </tr>

            <s:if test="!flag">
                <s:iterator value="#vpList" var="vp">
                    <tr>
                        <td>
                            <b>
                                <s:property value="#vp.roleName" />
                            </b>
                            <br>
                            <s:property value="#vp.roleDesc" />
                        </td>
                        <td>
                            <s:if test="flag2">
                                <p>None selected.</p>
                            </s:if>
                            <s:else>
                                <s:iterator value="#vpList.projectUserList" var="pu">
                                    <s:property value="#pu.username" />
                                </s:iterator>
                            </s:else>
                            <a href="addProjectUser.jsp?projectId=<s:property value="projectId"/>&roleId=<s:property value="#vp.roleId"/>">编辑</a>
                        </td>
                    </tr>
                </s:iterator>
            </s:if>

        </table>
    </s:else>
</body>
</html>