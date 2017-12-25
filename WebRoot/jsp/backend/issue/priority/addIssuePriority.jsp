<%-- 
	描述：添加问题优先级
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<p></p>


<div class="container">

    <div class="row">
        <div class="col-md-12">
            <h3>Add New Priority</h3>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">


            <%@include file="/jsp/showErrorMessage.jsp"%>
            <form action="doAddIssuePriority.jsp" class="bs-example bs-example-form" role="form">

                <div class="input-group">
                    <span class="input-group-addon">* 名称</span>
                    <input type="text" name="name" class="form-control" placeholder="twitterhandle" />
                </div>



                <div class="input-group">
                    <span class="input-group-addon">描述</span>
                    <input type="text" name="description" class="form-control" placeholder="twitterhandle" />
                </div>

                <script>
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
                                                                </script>


                <div class="input-group">
                    <span class="input-group-addon">* Icon URL</span>
                    <input type="text" name="iconUrl" id="filename" class="form-control" placeholder="twitterhandle" />
                    <span class="input-group-addon">
                        <a href="javascript:openWindow('filename');">select image</a>
                    </span>
                </div>




                <script>
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

                <div class="input-group">
                    <span class="input-group-addon">* Priority Color</span>
                    <input type="text" id="color" name="color" class="form-control" placeholder="twitterhandle" />
                    <span class="input-group-addon">
                        <a href="javascript:openWindowColor('color','myColor');">
                            <img height="16" border="0" width="16" alt="" src="<%=request.getContextPath()%>/images/border/spacer.gif" />
                        </a>
                    </span>
                </div>

                <input type="submit" value="增加" class="btn btn-info btn-block" class="form-control" placeholder="twitterhandle" />


            </form>


        </div>

    </div>

</div>





