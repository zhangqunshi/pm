<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<!-- 功能：删除选定的问题优先级-->
<!-- @author 许希光 -->
<%
	String id = request.getParameter("id");
	int issuePriorityId = Integer.parseInt(id);

	IssuePriorityBO issuePriorityBO = new IssuePriorityBO();
	IssuePriority ip = issuePriorityBO
			.getIssuePriority(issuePriorityId);
	String name = ip.getName();
%>
<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
	<table>
		<tr>
			<td colspan="2">
				<h3 class="formtitle">
					Delete IssuePriority:<%=name%>
				</h3>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p>
					Confirm that you want to delete this project and all its issues,
					components and versions.
				</p>
				<p>
					<font color="#cc0000"> WARNING: This operation cannot be
						undone. If you wish to save the project data, it is recommended
						that you <a href="#">back it up first</a>. </font>
				</p>
			</td>
		</tr>
		<input type="hidden" value="<%=id%>" name="issuePriorityId"
			id="issuePriorityId" />
		<input type="hidden" value="true" name="confirm" />
		<tr>
			<td colspan="2" align="center">
				<input type="submit" class="spaced" title="按 Alt+S 提交" accesskey="S"
					onclick="location.href='<c:url value="/jsp/backend/issue/priority/doDeteleIssuePriority.jsp"/>?IssuePriorityId=<%=id%>'"
					value="删除" id="删除" name="删除" />
				<input type="button"
					onclick="location.href='<c:url value="/jsp/backend/issue/priority/viewIssuePriority.jsp"/>?IssuePriorityId=<%=id%>'"
					value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />

			</td>
		</tr>
	</table>
</div>