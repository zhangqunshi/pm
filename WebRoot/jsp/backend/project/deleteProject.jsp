<%-- 
	描述：删除项目
	作者: 张博
	日期: 2008-12-18
--%>

<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<%
    String pid = request.getParameter("projectId");
    int proId = Integer.parseInt(pid);
    ProjectBO pb = new ProjectBO();
    Projecthbm project = pb.getProject(proId);
    String name = project.getName();
%>
<table>
    <tr>
        <td colspan="2">
            <h3 class="formtitle">
                Delete Project:<%=name%>
            </h3>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <p>Confirm that you want to delete this project and all its issues, components and versions.</p>
            <p>
                <font color="#cc0000">
                    WARNING: This operation cannot be undone. If you wish to save the project data, it is recommended that you
                    <a href="#">back it up first</a>
                    .
                </font>
            </p>
        </td>
    </tr>
    <input type="hidden" value="<%=proId%>" name="projectId" id="projectId" />
    <input type="hidden" value="true" name="confirm" />
    <tr>
        <td colspan="2">
            <input type="submit" class="spaced" title="按 Alt+S 提交" accesskey="S" onclick="location.href='<c:url value="/jsp/backend/project/doDeleteProject.jsp"/>?projectId=<%=proId%>'" value="删除" id="删除" name="删除" />
            <input type="button" onclick="window.history.back();" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
        </td>
    </tr>
</table>