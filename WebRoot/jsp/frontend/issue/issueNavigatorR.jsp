<%-- 
   此页面被issueNavigator.jsp包含，不能单独使用
   属于issueNavigator.jsp页面的右侧内容
   
    参数:action , projectId。
    如果用于显示项目中所有问题，需要传递action , projectId两个参数，即action=all 。
    如果用于显示分配给我的问题，需要传递action参数，即action=forMe 。
    如果用于显示正在进行的问题，需要传递action参数，即action=inProgress 。
    
   @author: Kris
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%
    String projectIdStr = request.getParameter("projectId");
    String action = request.getParameter("action");

    IssueBO issueBO = new IssueBO();

    List issueList = null;

    //TODO 这个地方写的不对, 应该形成相应的filter，而不是直接查, 另外这段代码应该放到issueNavigator.jsp中
    User user = (User) session.getAttribute(Global.SESSION_USER);
    if ("all".equals(action)) {
        issueList = issueBO.getIssueDetailList(Integer.parseInt(projectIdStr));
    } else if ("forMe".equals(action)) {
        issueList = issueBO.getIssueListByAssigneeId(user.getId());
    } else if ("inProgress".equals(action)) {
        issueList = issueBO.getIssueInProgressList(user.getId());
    }

    //如果是根据查询条件得到内容, 则从request中取出issueList, 看doSearchIssue.jsp页面
    if (StringUtils.isBlank(action)) {
        issueList = (List) request.getAttribute("issueList");
    }

    //从session中取出filter, 根据filter取得issue列表
    if (issueList == null) {
        IssueFilter filterR = (IssueFilter) session.getAttribute(Global.SESSION_FILTER);
        if (filterR != null) {
            if (filterR.isSaved()) {
                issueList = issueBO.getIssueByFilterId(filterR.getId());
            } else {
                issueList = issueBO.getIssueSearchList(filterR.getRequestContent(), filterR.getParamValues());
            }
        }
    }

    pageContext.setAttribute("issueList", issueList); //给issueNavigatorRT.jsp页面用
%>

<table cellspacing="0" cellpadding="10" border="0" width="100%">
    <tr>
        <td>
            <%@include file="issueNavigatorRT.jsp"%>
        </td>
    </tr>
    <tr>
        <td>
            <table class="table table-hover" id="issuetable">
                <thead>
                    <tr>
                        <th>T</th>
                        <th>Key</th>
                        <th>概要</th>
                        <th>开发者</th>
                        <th>报告人</th>
                        <th>优先级</th>
                        <th>状态</th>
                        <th>解决</th>
                        <th>创建</th>
                        <th>更新</th>
                        <th>逾期</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (issueList != null) {
                            String trClassName = null;
                            for (int i = 0; i < issueList.size(); i++) {
                                Issue issue = (Issue) issueList.get(i);

                                if (i % 2 == 0) {
                                    trClassName = "rowAlternate";
                                } else {
                                    trClassName = "rowNormal";
                                }
                    %>
                    <tr id="issuerow<%=issue.getId()%>" class="<%=trClassName%>">
                        <td class="nav issuetype">
                            <a href="<%=request.getContextPath()%>/jsp/frontend/issue/issueDetailLayout.jsp?action=forMe&issueKey=<%=issue.getIssueKey()%>" title="<%=issue.getIssueTypeName()%>">
                                <img src="<%=request.getContextPath() + issue.getIssueTypeIcon()%>" />
                            </a>
                        </td>
                        <td class="nav issuekey">
                            <a href="<%=request.getContextPath()%>/jsp/frontend/issue/issueDetailLayout.jsp?action=forMe&issueKey=<%=issue.getIssueKey()%>">
                                <%=issue.getIssueKey()%>
                            </a>
                        </td>
                        <td class="nav summary">
                            <a href="<%=request.getContextPath()%>/jsp/frontend/issue/issueDetailLayout.jsp?action=forMe&issueKey=<%=issue.getIssueKey()%>">
                                <%=issue.getName()%>
                            </a>
                        </td>
                        <td class="nav assignee"><%=issue.getAssigneeFullname()%>
                        </td>
                        <td class="nav reporter">
                            <%=issue.getReporterFullname()%>
                        </td>
                        <td class="nav priority">
                            <img src="<%=request.getContextPath() + issue.getPriorityLevelIcon()%>" alt="<%=issue.getPriorityLevel()%>" />
                        </td>
                        <td class="nav status">
                            <img src="<%=request.getContextPath() + issue.getIssueStatusIcon()%>" alt="<%=issue.getIssueStatusName()%>" /><%=issue.getIssueStatusName()%>
                        </td>
                        <%
                            if (issue.getResolution() == null) {
                        %>
                        <td class="nav resolution">
                            <font color=red>未解决</font>
                        </td>
                        <%
                            } else {
                        %>
                        <td class="nav resolution">
                            <%=issue.getResolution()%>
                        </td>
                        <%
                            }
                        %>
                        <td class="nav created">
                            <%=StringUtils.removeTime(issue.getCreateDate())%>
                        </td>
                        <td class="nav updated">
                            <%=StringUtils.removeTime(issue.getLastUpdateDate())%>
                        </td>
                        <td class="nav duedate">
                            <%=StringUtils.removeTime(issue.getPlanEndTime())%>
                        </td>
                    </tr>
                    <%
                        } //endfor
                        } //endif
                    %>
                </tbody>
            </table>
        </td>
    </tr>
</table>
