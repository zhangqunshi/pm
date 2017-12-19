<%--
    Description:复制一个模板，及其权限分配。
    Author：孙重阳
 --%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.List"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
	String idStr = request.getParameter("schemeId");
	int schemeId = Integer.parseInt(idStr);
	//获得被复制的模板信息
	PermissionSchemeBO psBO = new PermissionSchemeBO();
	PermissionScheme ps = psBO.getScheme(schemeId);
	//生成新模板名称
	String rename = psBO.renameScheme(ps.getName());
	//保存新模板信息。
	ps.setName(rename);
	//ps.setCreateDate(StringUtils.getCurrDate());  //改
	psBO.addPermissionScheme(ps);
	//获得新模板id
	int id = psBO.getId(rename);
	//获得所有被复制模板的权限记录。
	PermissionAssigneeBO paBO = new PermissionAssigneeBO();
	List<PermissionAssignee> list = paBO.getAllPermissionAssignee(schemeId);
	//复制模板权限记录给新模板。
	paBO.addAllPermissionAssignee(list, id);
	//复制成功，返回到显示权限模板页面。
	response.sendRedirect("viewPermissionSchemes.jsp");
%>