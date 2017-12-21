<%-- 
	描述： 删除组信息
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
    <%
        String groupName = request.getParameter("groupName");
        if (StringUtils.isBlank(groupName)) {
            return;
        }
    %>
    <form onsubmit="if (this.submitted) return false; this.submitted = true; return true" name="simpleform" method="post" action="DeleteGroup.jsp">
        <table class="simpleform maxWidth" style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
            <tbody>
                <tr bgcolor="#f0f0f0">
                    <td class="simpleformheader" colspan="2">
                        <h3 class="formtitle">
                            Delete Group:
                            <%=groupName%>
                        </h3>

                        <p>If you delete a group, all users in that group will be removed from the group first.</p>
                        <p>Deleting a group will not delete any users.</p>

                    </td>
                </tr>
                <tr class="hidden">
                    <td>
                        <input id="name" type="hidden" value="<%=groupName%>" name="groupName" />
                    </td>
                </tr>
                <tr>
                    <td class="fullyCentered simpleformfooter" colspan="2">
                        <%
                            if (groupName.equals("administrators")) {
                                out.println("<p><font color='red'><h4>错误</h4><br>You cannot delete a group hat grants you");
                                out.println("system administration privileges if no other group exists that");
                                out.println("also grants you system<br>administration privileges. </font></p>");
                        %>
                        <input id="cancelButton" type="button" onclick="location.href='<%=request.getContextPath()%>/jsp/backend/group/GroupBrowser.jsp'" value="取消" name="GroupBrowser.jspa" title="取消 (Alt + `)" accesskey="`" />
                        <%
                            } else {
                        %>
                        <input id="删除" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="删除" name="删除" />
                        <input id="cancelButton" type="button" onclick="location.href='<%=request.getContextPath()%>/jsp/backend/group/GroupBrowser.jsp'" value="取消" name="GroupBrowser.jspa" title="取消 (Alt + `)" accesskey="`" />
                        <%
                            }
                        %>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
