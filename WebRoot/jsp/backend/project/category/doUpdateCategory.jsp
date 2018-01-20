<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
    ProjectCategoryBO rb = new ProjectCategoryBO();
    String name = request.getParameter("name");

    String desc = request.getParameter("desc");
    int id = Integer.parseInt(request.getParameter("id"));

    //检查参数
    boolean hasError = false;
    String errMsg = "";
    if (StringUtils.isBlank(name)) {
        hasError = true;  
        errMsg += "<li>Project Category name can't be empty!</li>";
    }

    if (rb.exists(name)) {
        ProjectCategoryhbm category = rb.getProjectCategory(id);
        String toName = category.getName();
        if (toName.equals(name)) {
        } else {
            hasError = true;
            errMsg += "<li><font color='red'>Project Name or Key already exists!</font></li>";
            request.setAttribute("error", errMsg);
            
        }
    } else {
        ProjectCategoryhbm category = new ProjectCategoryhbm();
        category.setId(id);
        category.setName(name);
        category.setDescription(desc);
        rb.updateCategory(category);
    }
    if (hasError) {
%>
<jsp:include page="updateCategory.jsp"></jsp:include>
<%
    } else {
%>
<jsp:include page="viewProjectCategory.jsp"></jsp:include>
<%
    }
%>
