<%-- 
	描述： 浏览组
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%
	String viewGroupName = request.getParameter("groupName");
	if (StringUtils.isBlank(viewGroupName)) {
		System.out.println("==============viewGroupName is null ===");
		viewGroupName = "";
	}
	GroupBO viewGroupBO = new GroupBO();
	List<Group> groupList = viewGroupBO.getViewGroups();
%>
<script>
     function load() 
     { 
        alert("==boj==");
	      var fath=document.viewform.getElementById("fatherid");  
	      var fathLength=fath.length;
	      for(int i = 0;i<fathlength;i++){ 
	          var f=fath[i];
	          if(f.selected){
	             f.focus();
	          }
	     } 
    }
     
    </script>

<form action="BulkEditUserGroups!default.jsp" name="viewform">
	<table>
		<tr>
			<td align="center">
				<b>Selected 1 of <%=groupList.size()%> Groups<b>
			</td>
		</tr>
		<tr>
		</tr>
		<tr>
		    <td align="center">
		       <input type="submit" value="check"/>
		    </td>
		</tr>
		<tr>
			<td align="center">
				<br>
				<select id="fatherid" size="5" 
					name="groupName">
					<%
					for (int i = 0; i < groupList.size(); i++) {
						Group group = groupList.get(i);
						if (group.getName().equals(viewGroupName)) {
							out.println("<option selected value='" + group.getName()
							+ "'>" + group.getName() + "</option>");
						} else {
							out.println("<option value='" + group.getName() + "'>"
							+ group.getName() + "</option>");
						}

					}
					%>
				</select>
			</td>
		</tr>
		
	</table>
</form>

