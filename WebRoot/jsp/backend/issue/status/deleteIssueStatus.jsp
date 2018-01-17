<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!-- 功能：删除选定的问题状态-->
<!-- @author 许希光 -->
<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
    <table>
        <tr>
            <td colspan="2">
                <h3 class="formtitle">
                    Delete IssueStatus:<s:property value="name"/>
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
        <input type="hidden" value="<s:property value="id"/>" name="issueStatusId" id="issueStatusId" />
        <input type="hidden" value="true" name="confirm" />
        <tr>
            <td colspan="2">
                <input type="submit" class="spaced" title="按 Alt+S 提交" accesskey="S" onclick="location.href='<c:url value="/jsp/backend/issue/status/doDeleteIssueStatus.jsp"/>?IssueStatusId=<s:property value="id"/>'" value="删除" id="删除" name="删除" />
                <input type="button" onclick="location.href='<c:url value="/jsp/backend/issue/status/viewIssueStatus.jsp"/>?IssueStatusId=<s:property value="id"/>'" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
            </td>
        </tr>
    </table>
</div>