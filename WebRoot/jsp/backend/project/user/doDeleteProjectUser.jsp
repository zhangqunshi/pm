<%-- 
	描述： 删除项目角色用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
 
    <%
			String projectId = request.getParameter("projectId");
			String roleId = request.getParameter("roleId");
			int pId = Integer.parseInt(projectId);
			int rId = Integer.parseInt(roleId);
			
			
            String[] type = (request.getParameter("allid")).split(",");
            for (int i = 0; i < type.length; i++) {
                
                if(type[i] == null ||type[i].equals("")){
                    return ;
                }
                int projectUserId = Integer.parseInt(type[i]);
			    ProjectUserBO pb = new ProjectUserBO();	
			    
			    pb.deleteProjectUser(projectUserId);
			}    
          %>
<jsp:forward page="addProjectUser.jsp">
<jsp:param name="projectId" value="<%=pId %>"/>
<jsp:param name="roleId" value="<%=rId %>"/>
</jsp:forward>
