<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    IssuePriorityBO issuePriorityBO = new IssuePriorityBO();
			int issuePriorityId = Integer.parseInt(request.getParameter("id"));
			IssuePriorityhbm issuePriority = issuePriorityBO.getIssuePriority(issuePriorityId);
%>
<table cellspacing="0" cellpadding="10" border="1" width="100%">
    <tbody>
        <tr>
            <td>
                <script language="JavaScript">
                                                                    function openWindow(
                                                                            element) {
                                                                        var vWinUsers = window
                                                                                .open(
                                                                                        '<c:url value="/jsp/backend/issue/priority/priorityIconPicker.jsp"/>?element='
                                                                                                + element,
                                                                                        'UserPicker',
                                                                                        'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
                                                                        vWinUsers.opener = self;
                                                                        vWinUsers
                                                                                .focus();
                                                                    }

                                                                    function openWindowColor(
                                                                            element,
                                                                            defaultColor) {
                                                                        var vWinUsers = window
                                                                                .open('<c:url value="/jsp/backend/issue/priority/colorPicker.jsp"/>?element='
                                                                                        + element
                                                                                        + '&defaultColor='
                                                                                        + defaultColor);
                                                                        vWinUsers.opener = self;
                                                                        vWinUsers
                                                                                .focus();
                                                                    }
                                                                </script>
                <%
                    String errMsg = (String) request.getAttribute("errMsg");
                    if (errMsg == null) {
                        errMsg = "";
                    }
                    out.println(errMsg);
                %>
                <form onsubmit="if (this.submitted) return false; this.submitted = true; return true" name="simpleform" method="post" action="doUpdateIssuePriority.jsp">
                    <table class="simpleform maxWidth">
                        <tbody>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                    <h3 class="formtitle">
                                        Edit Priority:
                                        <%=issuePriority.getName()%>
                                    </h3>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldLabelArea">名称:</td>
                                <td class="fieldValueArea" bgcolor="#ffffff">
                                    <input type="text" value="<%=issuePriority.getName()%>" size="30" name="name" />
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldLabelArea">描述:</td>
                                <td class="fieldValueArea" bgcolor="#ffffff">
                                    <input type="text" value="<%=issuePriority.getDescription()%>" size="60" name="desc" />
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldLabelArea">
                                    <i>
                                        <span title="斜体字是必填的">
                                            <sup> * </sup>
                                            Icon URL
                                        </span>
                                    </i>
                                    :
                                </td>
                                <td class="fieldValueArea" bgcolor="#ffffff">
                                    <input type="text" value="<%=issuePriority.getIconUrl()%>" size="60" name="iconUrl" id="filename" />
                                    <span class="subText">
                                        [
                                        <a href="javascript:openWindow('filename');">select image</a>
                                        ]
                                    </span>
                                    <br />
                                    <font size="1">(relative to the simple web application e.g /images/icons OR starting with http://)</font>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldLabelArea">Priority Color:</td>
                                <td class="fieldValueArea" bgcolor="#ffffff">
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <input type="text" value="<%=issuePriority.getPriorityColor()%>" size="40" name="color" id="color" />
                                                </td>
                                                <td></td>
                                                <td>
                                                    <table cellspacing="1" cellpadding="0" border="1">
                                                        <tbody>
                                                            <tr>
                                                                <td bgcolor="#<%=issuePriority.getPriorityColor()%>" id="myColor">
                                                                    <a href="javascript:openWindowColor('color','myColor');">
                                                                        <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%>/images/border/spacer.gif" />
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <input id="id" type="hidden" value="<%=issuePriority.getId()%>" name="id" />
                            <tr>
                                <td class="fullyCentered simpleformfooter" colspan="2">
                                    <input id="更新" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="更新" name="更新" />
                                    <input id="cancelButton" type="button" onclick="location.href='viewIssuePriority.jsp'" value="取消" name="ViewPriorities.jspa" title="取消 (Alt + `)" accesskey="`" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </td>
        </tr>
    </tbody>
</table>