<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
	<table>
		<tr>
			<td colspan="2">
				<h3 class="formtitle">
					Delete Issue Type:
					<%
					IssueTypeBO issueTypeBO = new IssueTypeBO();
					String id = request.getParameter("id");
					int issueTypeId = Integer.parseInt(id);
					IssueType issueType = issueTypeBO.getIssueType(issueTypeId);
					out.println(issueType.getName());
				%>
				</h3>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p>Confirm that you want to delete this issue type, and specify
					what is to be done with the issues currently attached to it.</p>
				<p>There are currently no matching issues</p>
			</td>
		</tr>

		<tr>
			<td colspan="2" align="right"><input type="submit"
				class="spaced" title="按 Alt+S 提交" accesskey="S"
				onclick="location.href='<c:url value="/jsp/backend/issue/type/doDeleteIssueType.jsp"/>?id=<%=id%>'"
				value="删除" id="删除" name="删除" /> <input type="button"
				onclick="location.href='<c:url value="/jsp/backend/issue/type/viewIssueType.jsp"/>'"
				value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />

			</td>
		</tr>
	</table>
</div>