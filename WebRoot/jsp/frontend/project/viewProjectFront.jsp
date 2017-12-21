<%-- 
	描述：为前台显示而做得项目列表页面, 请看dashboard.jsp 
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>

<%
    ProjectBO pb = new ProjectBO();
    List<Projecthbm> list = pb.getProjectList();
    User usr = (User) session.getAttribute(Global.SESSION_USER);
    if (list.size() == 0) {
        out.println("您还没有任何项目！");
    } else {

        for (int i = 0; i < list.size(); i++) {
            Projecthbm p = (Projecthbm) list.get(i);
            Project project = new Project();
            project.setProjectId(p.getId());
            project.setName(p.getName());
            project.setLeader(p.getLeader());

            //user在menu页面中，因为是include该页面。且多个被include的页面都用到user.
            if (usr.validate(project.getProjectId(), PermissionConstants.ADMINISTRATER_PROJECTS)) {
%>
<table class='tableBorder maxWidth' width='100%' cellspacing='1' cellpadding='3' border='0'>
    <tr class='rowHeader'>
        <td class='colHeaderLink' colspan='4'>
            项目：
            <b><%=project.getName()%></b>
        </td>
    </tr>
    <tr class='rowNormal DFD-3-tr'>
        <td>
            <b>项目负责人：</b>
            <%=project.getLeader()%>
            <br>
            <b>过滤问题: </b>
            <br>
            <a href='<%=request.getContextPath()%>/jsp/frontend/issue/issueNavigator.jsp?action=all&projectId=<%=project.getProjectId()%>&projectName=<%=project.getName()%>'>全部</a>

            <%
                //显示有关这个项目和这个人的过滤器
                            IssueFilterBO issueFilterBO = new IssueFilterBO();
                            User user = (User) session.getAttribute(Global.SESSION_USER);
                            List<SearchRequesthbm> filterList = issueFilterBO.getFilterByUserAndProject(user.getName(),
                                    project.getProjectId());
                            if (filterList != null) {
                                for (int k = 0; k < filterList.size(); k++) {
                                    SearchRequesthbm sr = (SearchRequesthbm) filterList.get(k);
                                    IssueFilter tempFilter = new IssueFilter();
                                    tempFilter.setId(sr.getId());
                                    tempFilter.setFilterName(sr.getFilterName());
                                    out.print(" | <a href='" + request.getContextPath()
                                            + "/jsp/frontend/issue/issueNavigator.jsp?filterId=" + tempFilter.getId()
                                            + "'>");
                                    out.print(tempFilter.getFilterName());
                                    out.print("</a> ");
                                }
                            }
            %>
        </td>
    </tr>
</table>
<br>
<%
    } //endif
        } //endfor

    } //endelse
%>
