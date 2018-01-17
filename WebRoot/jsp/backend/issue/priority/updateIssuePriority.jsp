<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>


<script language="JavaScript">
    function openWindow(element) {
        var vWinUsers = window
                .open(
                        '<c:url value="/jsp/backend/issue/priority/priorityIconPicker.jsp"/>?element='
                                + element, 'UserPicker',
                        'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
        vWinUsers.opener = self;
        vWinUsers.focus();
    }

    function openWindowColor(element, defaultColor) {
        var vWinUsers = window
                .open('<c:url value="/jsp/backend/issue/priority/colorPicker.jsp"/>?element='
                        + element + '&defaultColor=' + defaultColor);
        vWinUsers.opener = self;
        vWinUsers.focus();
    }
</script>
<%
    String errMsg = (String) request.getAttribute("errMsg");
    if (errMsg == null) {
        errMsg = "";
    }
    out.println(errMsg);
%>

<div class="container">

    <div class="row">
        <div class="col-md-12">
            <h3>
                Edit Priority:
                <s:property value="name"/>
            </h3>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <form onsubmit="if (this.submitted) return false; this.submitted = true; return true" name="simpleform" method="post" action="doUpdateIssuePriority.jsp" class="bs-example bs-example-form" role="form">
                <input id="id" type="hidden" value="<s:property value="id"/>" name="id" />

                <div class="input-group">
                    <span class="input-group-addon">名称</span>
                    <input type="text" value="<s:property value="name"/>" size="30" name="name" class="form-control" placeholder="twitterhandle" />
                </div>

                <div class="input-group">
                    <span class="input-group-addon">描述</span>
                    <input type="text" value="<s:property value="description"/>" size="60" name="desc" class="form-control" placeholder="twitterhandle" />
                </div>

                <div class="input-group">
                    <span class="input-group-addon">Icon URL</span>
                    <input type="text" value="<s:property value="iconUrl"/>" size="60" name="iconUrl" id="filename" class="form-control" placeholder="relative to the simple web application e.g /images/icons OR starting with http://" />
                    <span class="input-group-addon">
                        <a href="javascript:openWindow('filename');">select image</a>
                    </span>
                </div>

                <div class="input-group">
                    <span class="input-group-addon">Priority Color</span>
                    <input type="text" value="<s:property value="priorityColor"/>" size="40" name="color" id="color" class="form-control" placeholder="twitterhandle" />
                    <span class="input-group-addon">
                        <a href="javascript:openWindowColor('color','myColor');">
                            <img alt="" src="<%=request.getContextPath()%>/images/border/spacer.gif" />
                        </a>
                    </span>

                </div>

                <input id="更新" class="btn btn-info btn-block" type="submit" title="按 Alt+S 提交" accesskey="S" value="更新" name="更新" />
                <input id="cancelButton" type="button" onclick="location.href='viewIssuePriority.jsp'" value="取消" name="ViewPriorities.jspa" title="取消 (Alt + `)" accesskey="`" class="btn btn-warning btn-block" />

            </form>
        </div>
    </div>
</div>







