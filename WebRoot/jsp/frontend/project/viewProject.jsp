<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.List"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript">
    function confirmDelete() {
        var x = confirm("确认删除这条记录吗?");
        if (x) {
            return true;
        }
        return false;
    }
</script>
<body>
    <br>
    <a href="addProject.jsp">Add Project</a>
    <%
        ProjectBO pb = new ProjectBO();
        List list = pb.getProjectList();
        out.println("<table border='1'>");
        out.println("<th>Project Name</th><th>Key</th><th>网址</th><th>项目负责人</th><th>描述</th><th>操作</th>");
        for (int i = 0; i < list.size(); i++) {
            Project project = (Project) list.get(i);
            out.println("<tr><td><a href='viewProjectDetail.jsp?projectId=" + project.getProjectId() + "'>"
                    + project.getName() + "</a></td><td>" + project.getProjectKey() + "</td><td>" + project.getUrl()
                    + "</td><td>" + project.getLeader() + "</td><td>" + project.getDescription()
                    + "</td><td><a href='deleteProject.jsp?id=" + project.getProjectId()
                    + "' onclick='return confirmDelete();'>删除</a> | <a href='updateProject.jsp?id="
                    + project.getProjectId() + "'>编辑</a> | <a href='component/addProjectComponent.jsp?id="
                    + project.getProjectId() + "'>添加模板</a> | <a href='component/viewComponents.jsp?id="
                    + project.getProjectId() + "'>查看模板</a> | <a href='../project/user/addProjectUser.jsp?id="
                    + project.getProjectId() + "'>Add Project User</a></td></tr>");
        }
        out.println("</table>");
    %>

</body>
</html>
