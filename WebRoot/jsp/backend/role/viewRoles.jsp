<%-- 
	描述：查看角色
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script language="javascript">
    function confirmDelete() {
        var x = confirm("是否要删除此条记录");
        if (x) {
            return true;
        }
        return false;
    }
</script>
</head>
<body>

    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <h3 class="formtitle">Project Role Browser</h3>
                <p>You can use project roles to associate users and/or groups with specific projects.</p>
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">

                <table class="table table-hover">

                    <thead>
                        <tr>
                            <th>Project Role Name</th>
                            <th>描述</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="#roleList" var="rs">
                        <tr>
                        <td><s:property value="#rs.roleName"/></td>
                        <td><s:property value="#rs.roleDesc"/></td>
                        <td><a href="deleteRole.jsp?id=<s:property value="#rs.roleId"/>">删除</a> | <a href="updateRole.jsp?id=<s:property value="#rs.roleId"/>">编辑</a></td>
                                    </tr>
                        
                       
                    </s:iterator>
                    </tbody>
                </table>

            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <%@include file="/jsp/backend/role/addRole.jsp"%>

            </div>

        </div>

    </div>











</body>
</html>