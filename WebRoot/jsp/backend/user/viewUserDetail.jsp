<%-- 
	描述：用于显示用户详细信息 
	作者: 张博
	日期: 2009-1-5
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<html>
<head>
<link href="<%=request.getContextPath()%>/includes/css/main.css" media="all" rel="StyleSheet" type="text/css" />
</head>
<%
    request.setCharacterEncoding("UTF-8");

    User user = (User) request.getAttribute(Global.SESSION_USER);
    Userhbm u = new Userhbm();
    if (user == null) {
        String username = request.getParameter("name");

        if (username != null && !username.trim().equals("")) {
            UserBO userBO = new UserBO();
            u = userBO.getUser(username);
        }
    }
    if (user == null) {
        out.println("<html><body>Sorry, The user not found!</body></html>");
        return;
    }
%>
<body>
    <form action="#" method="post">
        <table cellspacing="6" cellpadding="0" border="0" width="100%" class="centred borderedBoxBlack">
            <tr>
                <td>
                    <h3 class="formtitle">
                        用户:
                        <%=user.getFullName()%>
                    </h3>
                </td>
            </tr>
            <%
                out.println("<tr><td align='left'><b>用户名: </b>" + u.getName() + "</td></tr>");
                out.println("<tr><td align='left'><b>全名: </b>" + u.getFullName() + "</td></tr>");
                out.println("<tr><td align='left'><b>E-mail: </b><a href='#'>" + u.getEmail() + "</a></td></tr>");
                out.println("<tr><td align='left'><b>创建时间: </b>" + u.getCreateDate() + "</td></tr>");
            %>
            <tr>
                <td align="left" valign="top">
                    <br />
                    <b>组:</b>
                    <%
                        out.println("<br />");
                        GroupBO groupBO = new GroupBO();
                        List<Grouphbm> secondUserGroupList = groupBO.getUserGroupName(u.getId());

                        if (secondUserGroupList == null || secondUserGroupList.size() == 0) {

                        } else {
                            for (int j = 0; j < secondUserGroupList.size(); j++) {
                                Grouphbm secondUserGroupName = secondUserGroupList.get(j);
                                out.println("<img height='8' border='0' align='absmiddle' width='8' alt='' src='"
                                        + request.getContextPath() + "/images/icons/bullet_blue.gif' /> "
                                        + secondUserGroupName.getName() + "<br>");
                            }
                        }
                    %>
                    <br />
                </td>
            </tr>

        </table>
        <p align="center">
            <b>
                <a href="../../frontend/issue/userDeploy.jsp?name=<%=u.getName()%>">View Public Profile</a>
                |
                <a href="../group/EditUserGroups!default.jsp?name=<%=u.getName()%>" id="editgroups_link">Edit Groups</a>
                |
                <a href="updateUser.jsp?id=<%=u.getId()%>">Edit Details</a>
                |
                <a href="changePassword.jsp?id=<%=u.getId()%>">Set Password</a>
                |
                <a href="userDeleteConfirm.jsp?id=<%=u.getId()%>" id="deleteuser_link">Delete User</a>
            </b>
        </p>
    </form>
</body>
</html>