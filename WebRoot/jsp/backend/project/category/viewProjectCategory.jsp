<%-- 
	描述：浏览项目分类
	作者: Kris
	日期: 2008-12-25
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
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
    <h3 class="formtitle">View Project Categories</h3>
    <p>The table below shows the project categories usable to categorise projects.</p>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>名称</th>
                <th>描述</th>
                <th>项目</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <s:if test="#pcList!=null">
                <s:iterator value="#pcList" var="pc">
                    <tr>
                        <td>
                            <s:property value="#pc.name" />
                        </td>
                        <td>
                            <s:property value="#pc.description" />
                        </td>
                        <s:if test="#pcBO.checkLingProject(#pc.id)">
                            <td>
                                <s:iterator value="#pc.projects" var="ps">
                                    <a href="../viewProjectDetail.jsp?projectId=<s:property value="#ps.projectId" />">
                                        <s:property value="#ps.name" />
                                    </a>
                                </s:iterator>
                            </td>

                        </s:if>
                        <s:else>
                            <td>&nbsp;</td>
                        </s:else>
                        <td>
                            <a href="deleteCategory.jsp?id=<s:property value="#pc.id" />">删除</a>
                            |
                            <a href="updateCategory.jsp?id=<s:property value="#pc.id" />">编辑</a>
                        </td>
                    </tr>
                </s:iterator>
            </s:if>
        </tbody>
    </table>
    <jsp:include page="addProjectCategory.jsp"></jsp:include>
</body>
</html>