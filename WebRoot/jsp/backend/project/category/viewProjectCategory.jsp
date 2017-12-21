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
<html>
<head>
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
    <div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
        <h3 class="formtitle">View Project Categories</h3>
        <p>The table below shows the project categories usable to categorise projects.</p>
    </div>
    <p></p>
    <table border='1' width='100%'>
        <tr>
            <th>名称</th>
            <th>描述</th>
            <th>项目</th>
            <th>操作</th>
        </tr>
        <%
            ProjectCategoryBO rb = new ProjectCategoryBO();
            List<ProjectCategoryhbm> list = rb.getCategoryList();
            if (list != null) {
                for (int i = 0; i < list.size(); i++) {
                    ProjectCategoryhbm category = list.get(i);
                    out.println("<tr><td>" + category.getName() + "</td>");
                    out.println("<td>" + category.getDescription() + "</td>");
                    if (rb.checkLinkProject(category.getId())) {
                        List<Projecthbm> list1 = rb.getAllProject(category.getId());
                        out.println("<td>");
                        for (int j = 0; j < list1.size(); j++) {
                            Projecthbm project = list1.get(j);
                            out.println("<a href='../viewProjectDetail.jsp?projectId=" + project.getId() + "'>"
                                    + project.getName() + "</a><br>");
                        }
                        out.println("</td>");
                    } else {
                        out.println("<td>&nbsp;</td>");
                    }
                    out.println("<td><a href='deleteCategory.jsp?id=" + category.getId()
                            + "'>删除</a> | <a href='updateCategory.jsp?id=" + category.getId() + "' >编辑</a></td></tr>");
                }
            }
        %>
    </table>
    <jsp:include page="addProjectCategory.jsp"></jsp:include>
</body>
</html>