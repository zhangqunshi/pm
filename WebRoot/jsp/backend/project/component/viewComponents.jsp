<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<br>
<br>
<b>Components</b>
<br>
<a href="<c:url value='/jsp/backend/project/component/addProjectComponent.jsp'/>?projectId=<s:property value="#project.projectId" />">Add</a>
a new component
<br>
<s:set var="size" value="#components.size()" />
<s:if test="size==0">
        There are no components at the moment.
    </s:if>
<s:else>
    <table>
        <s:iterator value="#components" var="component">
            <tr>
                <td>
                    <img hspace="0" height="16" border="0" width="16" style="vertical-align: top;" src="<c:url value='/images/icons/component.gif'/>" name="assigneeImage" alt="项目模块" title="<s:property value="#component.name" /> - <s:property value="#component.description" />">
                </td>
                <td>
                    <s:property value="#component.name" />
                </td>

<<<<<<< HEAD
                <td>
                    <s:set var="leader" value="#component.leader" />
                    <s:if test="leader == \"\"">   
                    无
                    </s:if>
                    <s:else>
                        负责人: <s:property value="#component.leader" />
                    </s:else>
                </td>
                <td>
                    <a href="/pmhb/jsp/backend/project/component/deleteProjectComponent.jsp?idd=<s:property value="#component.id" />&id=<s:property value="#project.projectId" />">删除</a>
                    |
                    <a href="/pmhb/jsp/backend/project/component/updateProjectComponent.jsp?idd=<s:property value="#component.id" />&id=<s:property value="#project.projectId" />">编辑</a>
                </td>
            </tr>
        </s:iterator>
    </table>
</s:else>
=======
        int id = Integer.parseInt(request.getParameter("projectId"));
        
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
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
