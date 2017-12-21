<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    String projectId2 = request.getParameter("projectId");

    int pid2 = Integer.parseInt(projectId2);
%>
<br>
<br>
<b>Components</b>
<br>
<a href="<c:url value='/jsp/backend/project/component/addProjectComponent.jsp'/>?projectId=<%=projectId2%>">Add</a>
a new component
<br>
<%
    ProjectComponentBO pcbo = new ProjectComponentBO();
    List<ProjectComponenthbm> componentList = new ArrayList<ProjectComponenthbm>();
    componentList = pcbo.getProjectComponentList(pid2);
    if (componentList.size() == 0) {
        out.println("There are no components at the moment.");
    } else {

        int id = Integer.parseInt(request.getParameter("projectId"));
        System.out.println("id=" + id);
        ProjectComponentBO pcbo2 = new ProjectComponentBO();
        List<ProjectComponenthbm> componentList2 = pcbo2.getProjectComponentList(id);
        out.println("<table border='0'>");
        for (int i = 0; i < componentList2.size(); i++) {
            ProjectComponenthbm pc = (ProjectComponenthbm) componentList2.get(i);
%>
<tr>
    <td>
        <img hspace="0" height="16" border="0" width="16" style="vertical-align: top;" src="<c:url value='/images/icons/component.gif'/>" name="assigneeImage" alt="项目模块" title="
		<%out.println(pc.getName());%>-<%out.println(pc.getDescription());%>
		">
        <%
            out.println("</td><td>" + pc.getName() + "</td><td><b>");
                    if (StringUtils.isEmpty(pc.getLeader())) {
                        out.println(" ");
                    } else {
                        out.println("(负责人: </b>" + pc.getLeader() + "<b>)");
                    }
                    out.println("</b> </td>");
                    out.println("<td><a href='/pm/jsp/backend/project/component/deleteProjectComponent.jsp?idd="
                            + pc.getId() + "&id=" + id
                            + "'>(删除</a>|<a href='/pm/jsp/backend/project/component/updateProjectComponent.jsp?idd="
                            + pc.getId() + "&id=" + id + "'>编辑)</a></td></tr>");
                }
                out.println("</table>");
            }
        %>