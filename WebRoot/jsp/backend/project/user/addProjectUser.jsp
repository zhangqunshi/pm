<%-- 
	描述： 新建项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
</head>
<body>
    <s:if test="flag">
        <p>项目或角色ID不能为空</p>
    </s:if>
    <s:else>
        <h3>
            Assign Users to Project Role:
            <s:property value="roleName" />
        </h3>
        <p>
            You can add and remove users from the project role
            <strong>
                <s:property value="roleName" />
            </strong>
            for the project
            <strong>
                <s:property value="projectName" />
            </strong>
            by using the 'Add' and 'Remove' buttons below.
        </p>
        <p align="center">
            <b>
                <a href="viewProjectUser.jsp?projectId=<s:property value="projectId"/>"> Return to Project Role Browser</a>
            </b>
        </p>
        <table border="1" width="100%">
            <tr>
                <td valign="top">
                    <b>Users in Project Role</b>
                    <jsp:include page="viewProjectRoleUser.jsp" />
                </td>
                <td valign="top">
                    <b>Add User</b>
                    <form action='doAddProjectUser.jsp'>
                        <input type='hidden' name='projectId' value="<s:property value="projectId"/>" />
                        <input type='hidden' name='roleId' value="<s:property value="roleId"/>" />
                        <table border='0'>
                            <tr>
                                <td>Enter one or more usernames in the form below. Separate usernames by a comma ",".</td>
                            </tr>
                            <script>
                                function openWindow(element) {
                                   var vWinUsers = window.open('<c:url value="/jsp/backend/project/user/UserPickerForOneProject.jsp"/>?element='+ element,
                                                              'UserPicker','status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
                            	   vWinUsers.opener = self;
                                   vWinUsers.focus();
                                }
                            </script>
                            <tr>
                                <td>
                                    Add user(s) to project role:
                                    <br>
                                    <textarea name='users' id='users' cols='50'></textarea>
                                    <a href="javascript:openWindow('users');">
                                        <img src="<%=request.getContextPath()%>/images/icons/filter_public.gif" border="0" alt='选择用户' />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type='submit' value='Add' />
                                    <input type='reset' value='reset' />
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </s:else>
</body>
</html>