<%-- 
	描述： 浏览项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<script type="text/javascript">
    /* 是否全选标记 */
    var lead = "";
    var checkedAll = false;
    /* 全选/取消全选
     * formName 所在form的name值
     * checkboxName checkbox的name值
     * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果
     */
    function selectAll() {
        var allCheckBox = document.getElementsByName("cate");
        for (var i = 0; i < allCheckBox.length; i++) {
            var e = allCheckBox[i];
            if (checkedAll) {
                e.checked = false;
            } else {
                e.checked = true;
            }
        }
        var alls = document.getElementById("alls");
        if (checkedAll) {
            checkedAll = false;
            alls.checked = false;
        } else {
            checkedAll = true;
            alls.checked = true;
        }
    }
    /* 检查是否有checkbox被选中
     * formName 所在form的name值
     * checkboxName checkbox的name值
     * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果
     */
    function checkAll(formName, checkboxName) {
        var hasCheck = false;
        var elements = document.getElementsByName("cate");
        for (var i = 0; i < elements.length; i++) {
            var e = elements[i];
            if (e.checked) {
                lead += e.value + ",";
                hasCheck = true;
            }
        }
        document.form2.allid.value = lead;
        return hasCheck;
    }
</script>
<%
    //获得参数  
    String projectId3 = request.getParameter("projectId");
    String roleId3 = request.getParameter("roleId");
    //判断参数是否为空	    
    if (projectId3 == null || projectId3.equals("")) {
        out.println("项目ID不能为空");
        return;
    }
    if (roleId3 == null || roleId3.equals("")) {
        out.println("角色ID不能为空");
        return;
    }
    //转换类型	    
    int projectId4 = Integer.parseInt(projectId3);
    int roleId4 = Integer.parseInt(roleId3);

    ProjectUserBO projectUserBo = new ProjectUserBO();
    List<ProjectUser> projectUserList2 = projectUserBo.getProjectUserByProjectIdRoleId(projectId4, roleId4);

    out.println("<form name='form2' action='doDeleteProjectUser.jsp'>");
    out.println("<table border='0'>");

    if (projectUserList2 == null || projectUserList2.size() == 0) {
        out.println(
                "<tr><td colspan='2'>There are currently no users assigned to this project role.</td></tr>");
    } else {
        out.println("<tr>");
        out.println("<td>Users in Project Role</td>");
        out.println("<td width='50' align='center'>");
%>
<input type="checkbox" name="alls" onclick="selectAll()" />
<%
    out.println("</td>");
        out.println("</tr>");
        for (int j = 0; j < projectUserList2.size(); j++) {
            ProjectUser projectUser2 = projectUserList2.get(j);
            UserBO userBo = new UserBO();
            User user = new User();
            Userhbm u = new Userhbm();
            u = userBo.getUser(projectUser2.getUserId());
            ProjectUser projectUser3 = projectUserBo.getProjectUser5(projectId4, roleId4,
                    projectUser2.getUserId());
            out.println("<tr>");
            out.println("<td>");
            out.println(user.getName());
            out.println("</td>");
            out.println("<td width='50' align='center'>");
            out.println("<input type='checkbox' name='cate' value='" + projectUser3.getProjectUserId() + "'/>");
            out.println("</td>");
            out.println("</tr>");
        }
        out.println("</td></tr>");
        out.println("<tr><td colspan='2' align='right'>");
        out.println("<input type='hidden' name='allid'/>");
        out.println("<input type='hidden' name='projectId' value='" + projectId4 + "'/>");
        out.println("<input type='hidden' name='roleId' value='" + roleId4 + "'/>");
%>
<input type='submit' value='remove' onclick="return checkAll('form2','cate');" />
<%
    out.println("</td></tr>");
    }
    out.println("</table>");
    out.println("</form>");
%>