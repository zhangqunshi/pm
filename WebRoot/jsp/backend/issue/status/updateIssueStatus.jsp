<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!-- 功能：更新问题状态-->
<!-- @author 许希光 -->
<%
    IssueStatusBO issueStatusBO = new IssueStatusBO();
			int issueStatusId = Integer.parseInt(request.getParameter("id"));
			IssueStatushbm issueStatus = issueStatusBO.getIssueStatus(issueStatusId);
%>
<html>
<head>
<script language=javascript>
    function isNull(str) {
        if (str == "")
            return true;
        var regu = "^[ ]+$";
        var re = new RegExp(regu);
        return re.test(str);
    }
    function test() {
        var name = myForm.name.value;

        if (isNull(name)) {
            window.alert("错误：请填写IssueStatuses名称！");
            return false;
        }
    }
</script>
</head>

<body>

    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <h2 class="formtitle">
                    Edit Status:
                    <%=issueStatus.getName()%>
                </h2>
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">

                <%@include file="/jsp/showErrorMessage.jsp"%>

                <form action="doUpdateIssueStatus.jsp" name="myForm" onsubmit="return test();" class="bs-example bs-example-form" role="form">
                    <input type="hidden" name="id" value="<%=issueStatus.getId()%>" />


                    <div class="input-group">
                        <span class="input-group-addon">名称</span>
                        <input type="text" name="name" value="<%=issueStatus.getName()%>" class="form-control" placeholder="twitterhandle" />
                    </div>



                    <div class="input-group">
                        <span class="input-group-addon">描述</span>
                        <input type="text" name="desc" value="<%=issueStatus.getDescription()%>" class="form-control" placeholder="twitterhandle" />
                    </div>

                    <script>
                                                                                    function openWindow(
                                                                                            element) {
                                                                                        var vWinUsers = window
                                                                                                .open(
                                                                                                        '<c:url value="/jsp/backend/issue/status/statusIconPicker.jsp"/>?element='
                                                                                                                + element,
                                                                                                        'UserPicker',
                                                                                                        'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
                                                                                        vWinUsers.opener = self;
                                                                                        vWinUsers
                                                                                                .focus();
                                                                                    }
                                                                                </script>

                    <div class="input-group">
                        <span class="input-group-addon">* Icon URL</span>
                        <input type="text" name="filename" id="filename" size="50" value="<%=issueStatus.getIconUrl()%>" class="form-control" placeholder="twitterhandle" />
                        <span class="input-group-addon">
                            <a href="javascript:openWindow('filename');">select image</a>
                        </span>
                    </div>




                    <input type="submit" value="更新" class="btn btn-info btn-block" />
                    <input type="button" onclick="location.href='viewIssueStatus.jsp?'" value="取消" class="btn btn-warning btn-block" />

                </form>

            </div>

        </div>

    </div>






</body>
</html>

