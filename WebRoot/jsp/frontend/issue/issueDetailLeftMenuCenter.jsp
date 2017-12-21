<%-- 
    Document   : 问题详情中左侧的导航中间部分(可选工作流程)
    Created on : 2008-12-24
    Author     : 张磊
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="java.util.*"%>
<%
    //由于在其他页面也需要issue信息，所以把issue信息保存在request中，供所有页面使用
    Issue issueLC = (Issue) request.getAttribute("issue");
    if (issueLC == null) {
        return;
    }

    //以下为开发者自己的任务时：
    //如果 (问题状态为Open), 则显示"开始进行", "解决问题", "关闭问题"
    //如果 (问题状态为In Progress ), 则显示"停止进行", "解决问题", "关闭问题",
    //如果点击"解决问题", "关闭问题"，都进入填写解决结果页面
    //如果 (问题状态为Resolved), 则显示"关闭问题", "恢复开启问题"
    //如果 (问题状态为Closed), 则显示"恢复开启问题"
    //如果 (问题状态为Reopened), 则显示"开始进行", "解决问题", "关闭问题"

    String stop = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='"
            + request.getContextPath()
            + "/images/icons/bullet_creme.gif' /><b> <a href='stopIssue.jsp?issueKey=" + issueLC.getIssueKey()
            + "&action=forMe'>停止进行</a></b></td></tr>";
    String resolved = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='"
            + request.getContextPath()
            + "/images/icons/bullet_creme.gif' /><b> <a href='commentAssignIssue!default.jsp?issueKey="
            + issueLC.getIssueKey() + "&status=resolved'>解决问题</a></b></td></tr>";
    String start = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='"
            + request.getContextPath()
            + "/images/icons/bullet_creme.gif' /><b> <a href='startIssue.jsp?issueKey=" + issueLC.getIssueKey()
            + "&action=forMe'>开始进行</a></b></td></tr>";
    String closed = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='"
            + request.getContextPath()
            + "/images/icons/bullet_creme.gif' /><b> <a href='commentAssignIssue!default.jsp?issueKey="
            + issueLC.getIssueKey() + "&status=close'>关闭问题</a></b></td></tr>";
    String reOpened = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='"
            + request.getContextPath()
            + "/images/icons/bullet_creme.gif' /><b> <a href='commentAssignIssue!default.jsp?issueKey="
            + issueLC.getIssueKey() + "&status=reopen'>恢复开启问题</a></b></td></tr>";
    int issueStatus = issueLC.getIssueStatus();
    List<String> open = new ArrayList<String>();
    open.add(start);
    open.add(closed);
    open.add(resolved);
    String[] progressStatus = { stop, resolved, closed };
    String[] resolvedStatus = { closed, reOpened };
%>

<table border="0">
    <%
        if (issueStatus == Global.OPEN) {
            for (int i = 0; i < open.size(); i++) {
                out.println(open.get(i));
            }
        }
        if (issueStatus == Global.IN_PROGRESS) {
            for (int i = 0; i < progressStatus.length; i++) {
                out.println(progressStatus[i]);
            }
        }
        if (issueStatus == Global.RESOLVED) {
            for (int i = 0; i < resolvedStatus.length; i++) {
                out.println(resolvedStatus[i]);
            }
        }
        if (issueStatus == Global.CLOSE) {
            out.println(reOpened);
        }
        if (issueStatus == Global.REOPEN) {
            for (int i = 0; i < open.size(); i++) {
                out.println(open.get(i));
            }
        }
    %>
</table>