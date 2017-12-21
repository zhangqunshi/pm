<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    String issueKey = request.getParameter("issueKey");
			if (StringUtils.isBlank(issueKey)) {
				return;
			}
			IssueBO issueBo = new IssueBO();
			Issuehbm issue = issueBo.getIssueByKey(issueKey);
			if (issue == null) {
				return;
			}
			String issueName = "CLONE-" + issue.getName();
%>
<script type="text/javascript">
    function check() {
        var username = simpleform.summary.value;
        if (username == "") {
            window.alert("错误:请填写概要！");
            return false;
        }
    }
</script>
<table cellspacing="0" cellpadding="10" border="0" bgcolor="" width="100%">
    <tbody>
        <tr>
            <td>
                <form onsubmit="return check()" name="simpleform" method="post" action="cloneIssueDetails.jsp">
                    <table class="simpleform maxWidth">
                        <tbody>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                    <h3 class="formtitle">复制问题</h3>
                                </td>
                            </tr>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                    输入复制问题的标题
                                    <p>
                                        <span class="warning">注意:</span>
                                        复制链接类型 "Cloners" 不存在. 到原问题的链接不会创建.
                                    </p>
                                </td>
                            </tr>
                            <tr id="summaryFieldArea" class="fieldArea">
                                <td class="fieldLabelArea">
                                    <label for="summary">
                                        <span class="required" title="斜体字是必填的">
                                            <sup> * </sup>
                                            概要:
                                        </span>
                                    </label>
                                </td>
                                <td class="fieldValueArea">
                                    <input id="issueName" class="textfield" type="text" maxlength="255" value="<%=issueName%>" name="issueName" />
                                </td>
                            </tr>
                            <tr class="hidden">
                                <td>
                                    <input id="id" type="hidden" value="<%=issue.getId()%>" name="issueId" />
                                </td>
                            </tr>
                            <tr>
                                <td class="fullyCentered simpleformfooter" colspan="2">
                                    <input type="submit" class="spaced" title="按 Alt+S 提交" accesskey="S" value="创建" id="删除" name="删除" />
                                    <input type="button" onclick="window.history.back();" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </td>
        </tr>
    </tbody>
</table>