<%-- 
    Document   : 创建问题第一步骤
    Created on : 2008-12-24
    Author     : Kris
--%>
<%@ page language="java" contentType="text/html;chaset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	ProjectBO projectBO = new ProjectBO();
	List projectList = projectBO.getProjectList();

	IssueTypeBO issueTypeBO = new IssueTypeBO();
	List issueTypeList = issueTypeBO.getIssueTypeList();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<body>
		<form action="addIssueStep2.jsp" method="post">
			<table border="0">
				<tr>
					<td colspan="2">
						<h3> 
							创建问题 
						</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						步骤1（共2）：选择项目和问题类型
					</td>
				</tr>
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td align="right">
						* 项目:
					</td>
					<td>
						<select name="projectId">
							<%
								for (int i = 0; i < projectList.size(); i++) {
									Project project = (Project) projectList.get(i);
							%>
							<option value="<%=project.getProjectId()%>"><%=project.getName()%></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						* 问题类型:
					</td>
					<td>
						<select name="issueTypeId">
							<%
								for (int i = 0; i < issueTypeList.size(); i++) {
									IssueType issueType = (IssueType) issueTypeList.get(i);
							%>
							<option value="<%=issueType.getId()%>"><%=issueType.getName()%></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="submit" value="下一步>>" />
					</td>
					<td align="left">
						<input type="button"
							onclick="location.href='<c:url value="/jsp/frontend/dashboard.jsp"/>'"
							value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

