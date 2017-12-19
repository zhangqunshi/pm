<%--
    Description:Add the informations which get from addPermission.jsp .
    Author:Sun Chongyang 
    @author: Kris
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%
	//获取参数
	String type = request.getParameter("type");
	String permissionIdStr = request.getParameter("permissions");
	String group = request.getParameter("Group");
	String singleUser = request.getParameter("SingleUser");
	String projectRole = request.getParameter("ProjectRole");
	String schemeIdStr = request.getParameter("schemeId");
	String assignee = request.getParameter(type);

	System.out.println("==doAddPermission.jsp==type==" + type);
	System.out.println("==doAddPermission.jsp==group==" + group);
	System.out.println("==doAddPermission.jsp==singleUser==" + singleUser);
	System.out.println("==doAddPermission.jsp==projectRole==" + projectRole);

	//判断参数
	if (StringUtils.isBlank(permissionIdStr)) {
		out.println("Error: PermissionId not found!");
		return;
	}
	if (StringUtils.isBlank(schemeIdStr)) {
		out.println("Error: schemeId not found!");
		return;
	}

	String error = "";
	boolean hasError = false;
	if (StringUtils.isBlank(type)) {
		hasError = true;
		error += "请选择被分配权限对象的类型！";

	}
	if (StringUtils.isNotBlank(type)) {
		if (!"SingleUser".equals(type) && !"ProjectRole".equals(type) && !"Group".equals(type)) {
			hasError = true;
			error += "请选择分配人！";
		}
		if ("SingleUser".equals(type)) {
			UserBO userBo = new UserBO();
			if (StringUtils.isBlank(singleUser)) {
				hasError = true;
				error += "请选择一个用户！";
			} else if (!userBo.exist(assignee)) {
				hasError = true;
				error += "请选择已存在的用户！";
			}
		} else if ("ProjectRole".equals(type) && StringUtils.isBlank(projectRole)) {
			hasError = true;
			error += "请选择一个角色！";
		} else if ("Group".equals(type) && StringUtils.isBlank(group)) {
			hasError = true;
			error += "请选择一个组！";
		}
	}

	if (hasError) {
		request.setAttribute("error", error);
%>
<jsp:forward page="addPermission.jsp?">
	<jsp:param name="schemeId" value="<%=schemeIdStr%>" />
	<jsp:param name="permissionId" value="<%=permissionIdStr%>" />
</jsp:forward>
<%
	} //endif

	//保存信息
	PermissionAssigneeBO paBO = new PermissionAssigneeBO();
	PermissionAssignee pa = new PermissionAssignee();
	pa.setAssignee(assignee);
	pa.setAssigneeType(type);
	pa.setSchemeId(new PermissionSchemeBO().getScheme(Integer.parseInt(schemeIdStr)));
	pa.setPermissionId(new PermissionBO().idGetPermission(Integer.parseInt(permissionIdStr)));

	if (!paBO.exist(pa)) {
		paBO.addPermissionAssignee(pa);
	}
	response.sendRedirect("editPermissions.jsp?schemeId=" + schemeIdStr);
%>
