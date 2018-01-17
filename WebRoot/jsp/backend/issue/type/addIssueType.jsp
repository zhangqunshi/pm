<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!-- 功能：添加问题类型 -->
<!-- @author: 许希光-->

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h3>Add New Issue Type</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <%
                String error = (String) request.getAttribute("error");
            			if (error != null) {
            				out.println("<font color=red>" + error + "</font>");
            			}
            %>
            <form action="doAddIssueType.jsp" class="bs-example bs-example-form" role="form">
                <div class="input-group">
                    <span class="input-group-addon">* 名称</span>
                    <input type="text" name="name" class="form-control" placeholder="twitterhandle" />
                </div>
                <div class="input-group">
                    <span class="input-group-addon">描述</span>
                    <input type="text" name="description" class="form-control" placeholder="twitterhandle" />
                </div>
                <script>
                  function openWindow(element) {
                     var vWinUsers = window.open('_$tag______________________________________________________?element='+ element,
                                                UserPicker','status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
                     vWinUsers.opener = self;
				     vWinUsers.focus();
                   }
                </script>
                <div class="input-group">
                    <span class="input-group-addon">图标</span>
                    <input type="text" id="filename" name="iconurl" class="form-control" placeholder="twitterhandle" />
                    <span class="input-group-addon">
                        <a href="javascript:openWindow('filename');">select image</a>
                    </span>
                </div>
                <input type="submit" value="增加" class="btn btn-info btn-block" />
            </form>
        </div>
    </div>
</div>