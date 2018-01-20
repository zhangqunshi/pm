<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!-- 删除用户 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


</head>

<body>
    <%
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
<<<<<<< HEAD

        UserBO userBO = new UserBO();
        boolean hasForeignKey = userBO.hasForeignKey(id);

=======
        
        UserBO userBO = new UserBO();
        boolean hasForeignKey = userBO.hasForeignKey(id);
        
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
        if (hasForeignKey) {
            String errMsg = "该用户与项目相关联。要想删除该用户，请先删除项目中的关联！";
            request.setAttribute("error", errMsg);
            
        } else {
            userBO.deleteUser(id);
        }
    %>
    <jsp:forward page="/jsp/backend/user/viewUser.jsp"></jsp:forward>
</body>
</html>
