<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    ProjectCategoryBO rb = new ProjectCategoryBO();
    String id = request.getParameter("id");
    int i = Integer.parseInt(id);
    ProjectCategoryhbm category = rb.getProjectCategory(i);
    if (rb.checkLinkProject(i)) {
%>
<table>
    <tr>
        <td colspan="2">
            <h3 class="formtitle">
                Delete Project Category:<%=category.getName()%>
            </h3>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <p>Confirm that you want to delete this project category.</p>
            <p>
                <font size=4 color=red>错误:</font>
                <br>
                There are currently projects linked to this category.
            </p>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" class="spaced" title="按 Alt+S 提交" accesskey="S" onclick="location.href='<c:url value="/jsp/backend/project/category/doDeleteProjectByCategory.jsp"/>?id=<%=i%>'" value="删除" id="删除" name="删除" />
            <input type="button" onclick="location.href='<c:url value="/jsp/backend/project/category/viewProjectCategory.jsp"/>'" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
        </td>
    </tr>
</table>
<%
    } else {
        rb.deleteCategory(i);
%>
<jsp:forward page="viewProjectCategory.jsp"></jsp:forward>
<%
    }
%>

