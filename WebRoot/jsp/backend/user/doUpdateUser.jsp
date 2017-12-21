<!-- 执行更新 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<html>

<body>
    <%
        String path = request.getContextPath();
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        Userhbm u = new UserBO().getUser(id);
        u.setFullName(fullname);
        u.setEmail(email);
        User user = new User();
        user.setId(id);
        user.setFullName(fullname);
        user.setEmail(email);
        UserBO userBO = new UserBO();
        userBO.updateUser(u);
        user.setAdmin(u.isAdmin());
        user.setName(u.getName());
        user.setPassword(u.getPassword());
        user.setCreateDate(u.getCreateDate());

        request.setAttribute(Global.SESSION_USER, user);
        RequestDispatcher rd = request.getRequestDispatcher("/jsp/backend/user/viewUserDetail.jsp");
        rd.forward(request, response);
    %>

</body>
</html>
