<%-- 
	描述：新建问题解决结果
	作者: Kris
	日期: 2008-12-27
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<p></p>

<div class="container">

    <div class="row">
        <div class="col-md-12">
            <h3>Add New Resolution</h3>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">

            <form action="doAddResolution.jsp" class="bs-example bs-example-form" role="form">
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

                <input type="submit" value="增加" class="btn btn-info btn-block" />



            </form>

        </div>

    </div>

</div>





