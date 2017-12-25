<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!-- 功能：添加问题状态 -->
<!-- @author: 许希光-->
<p></p>

<div class="container">

    <div class="row">
        <div class="col-md-12">
            <h3>Add New Status</h3>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">

            <form action="doAddIssueStatus.jsp" class="bs-example bs-example-form" role="form">
                <%
                    String error = (String) request.getAttribute("error");
                			if (error != null) {
                				out.println("<font color=red>" + error + "</font>");
                			}
                %>

                <div class="input-group">
                    <span class="input-group-addon">* 名称</span>
                    <input type="text" name="name" class="form-control" placeholder="name" />
                </div>

                <div class="input-group">
                    <span class="input-group-addon">描述</span>
                    <input type="text" name="description" class="form-control" placeholder="description" />
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
                    <input type="text" name="filename" id="filename" class="form-control" placeholder="not know" />
                    <span class="input-group-addon">
                        <a href="javascript:openWindow('filename');">select image</a>
                    </span>
                </div>

                <input type="submit" value="增加" class="btn btn-info btn-block" />

            </form>


        </div>

    </div>

</div>




