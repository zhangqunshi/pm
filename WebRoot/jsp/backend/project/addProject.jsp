<%-- 
	描述： 新建项目
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*,java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
<head>
<style type="text/css">
.STYLE25 {
    font-family: Arial, Helvetica, sans-serif
}

.STYLE26 {
    font-size: 18px;
    color: #000033;
}

.STYLE28 {
    font-size: 13px
}

.STYLE29 {
    color: #000000
}
</style>

<script language=javascript>
    function isNull(str) {
        if (str == "")
            return true;
        var regu = "^[ ]+$";
        var re = new RegExp(regu);
        return re.test(str);
    }
    function IsURL(str_url) {
        var strRegex = "^(http?://)";
        var re = new RegExp(strRegex);

        if (re.test(str_url)) {
            return (true);
        } else {
            return (false);
        }
    }
    function test() {
        var url = myForm.url.value;

        var name = myForm.name.value;

        if (isNull(name)) {
            window.alert("错误：请填写Project名称！");
            return false;
        }

        var projectKey = myForm.projectKey.value;

        if (isNull(projectKey)) {
            window.alert("错误：请填写ProjectKey！");
            return false;
        }
        if (url != "") {
            if (!IsURL(url)) {

                window.alert("错误：请填写正确的URL！");
                return false;
            }
        }
        var lead = myForm.lead.value;

        if (isNull(lead)) {
            window.alert("错误：请选择LeaderId！");
            return false;
        }
    }
</script>

</head>
<body>
    <br />
    <%
        String errMsg = (String) request.getAttribute("error");
    			PermissionSchemeBO psBO = new PermissionSchemeBO();
    			List<PermissionSchemehbm> list = psBO.getSchemeList();
    %>
    <%@include file="/jsp/showErrorMessage.jsp"%>
    <form action="doAddProject.jsp" name="myForm" onsubmit="return test();">
        <table border="0" cellspacing="0">
            <tr>
                <td height="65" colspan="2" align="left" valign="middle" bgcolor="#E8E8E8">
                    <span class="STYLE4 STYLE25 STYLE26">Add A New Project</span>
                    <br />
                    <span class="STYLE28">
                        <br />
                        <span class="STYLE29">Enter your new project details... </span>
                    </span>
                </td>
            </tr>


            <tr>
                <td align="right" valign="top" bgcolor="#FFFFD7">
                    <!-- 名称 -->
                    <em>* 名称:</em>
                </td>
                <td valign="top">
                    <label>
                        <input type="text" name="name" />
                    </label>
                </td>
            </tr>
            <tr>
                <td height="45" align="right" valign="top" bgcolor="#FFFFD7">
                    <!-- Key -->
                    <em>* Key:</em>
                </td>
                <td height="45" valign="top">
                    <label>
                        <input type="text" name="projectKey" />
                    </label>
                    <br />
                    <span class="STYLE18 STYLE19 STYLE23">This is the unique project key. It specifies the first letters of issue keys in this project. &nbsp;</span>
                </td>
            </tr>
            <tr>
                <td height="45" align="right" valign="top" bgcolor="#FFFFD7">
                    <!-- 网址 -->
                    网址:
                </td>
                <td height="45" valign="top">
                    <label>
                        <input type="text" name="url" value="http://" />
                        <br />
                        <span class="STYLE24">An optional URL associated with this project, eg. pointing to project documentation.</span>
                    </label>
                </td>
            </tr>
            <script>
                                                    function openWindow(element) {
                                                        var vWinUsers = window
                                                                .open(
                                                                        '<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element='
                                                                                + element,
                                                                        'UserPicker',
                                                                        'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
                                                        vWinUsers.opener = self;
                                                        vWinUsers.focus();
                                                    }
                                                </script>
            <tr>
                <td align="right" valign="top" bgcolor="#FFFFD7">
                    <!-- 项目负责人 -->
                    <em>* 项目负责人:</em>
                </td>
                <td valign="top">
                    <label>
                        <input type="text" id="lead" name="lead" autocomplete="off" />
                        <a href="javascript:openWindow('lead');">
                            <img hspace="0" height="16" border="0" width="16" style="vertical-align: top;" src="<c:url value='/images/icons/filter_public.gif'/>" name="assigneeImage" alt="选择一个用户" title="选择一个用户">
                        </a>
                    </label>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top" bgcolor="#FFFFD7">
                    <!-- 描述 -->
                    描述:
                </td>
                <td valign="top">
                    <label>
                        <textarea name="description" cols="50" rows="6"></textarea>
                    </label>
                    <br />
                    <span class="STYLE24">
                        Optional description of this particular ptoject.
                        <br />
                        <span class="STYLE19">You can include HTML.but make sure to close all your tags. </span>
                    </span>
                </td>
            </tr>
            <tr>
                <td>* Permission Scheme:</td>
                <td>
                    <select name="permission_scheme_id">
                        <%
                            for (PermissionSchemehbm psh : list) {
                                PermissionScheme ps = new PermissionScheme();
                                ps.setId(psh.getId());
                                ps.setName(psh.getName());
                        %>
                        <option value="<%=ps.getId()%>"><%=ps.getName()%>
							</option>
                        <%
                            } //endfor
                        %>
                    </select>
                    <br>
                    The Permission Scheme determines who has permissions to view or change the project.
                </td>
            </tr>
            <tr>
                <td height="40" colspan="2" align="left" valign="middle" bgcolor="#FFFFFF">
                    <div align="center">
                        <input type="submit" value="增加" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" onclick="location.href='<c:url value="/jsp/backend/project/viewProject.jsp"/>'" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
