<%-- 
	描述： 为项目角色选择用户
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.User"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
	String element = request.getParameter("element");
%>
<html>
<head>
<link href="<%=request.getContextPath() %>/includes/css/main.css" media="all" rel="StyleSheet" type="text/css" />

<script type="text/javascript">
        
       /* 是否全选标记 */
 
 var checkedAll = false;
 /* 全选/取消全选
 * formName 所在form的name值
 * checkboxName checkbox的name值
 * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果
 */
function selectAll(){
// alert("==selectAll==");
	var allCheckBox = document.getElementsByName("cbox");
	for (var i=0; i<allCheckBox.length; i++){ 
		var e = allCheckBox[i];
 		if(checkedAll){
 			e.checked = false;
 		} else {
 			e.checked = true;
 		}
 	}
 	var alls = document.getElementById("alls");
 	if(checkedAll){
 		checkedAll = false;
 		alls.checked = false;
 	} else {
 		checkedAll = true;
 		alls.checked = true;
 	}
 } 
 /* 检查是否有checkbox被选中
 * formName 所在form的name值
 * checkboxName checkbox的name值
 * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果
 */
 function checkAll(formName,checkboxName){
 //alert("==checkAll==");
 	var allCheckBox = document.getElementsByName("cbox");
 	var selectedUsers = "";
 	var userCount = 0;
	for (var i=0; i<allCheckBox.length; i++){ 
		var e = allCheckBox[i];
		if(e.checked){
			
			if (userCount == 0) {
 				selectedUsers = e.value;
 			} else {
 				selectedUsers += "," + e.value;
 			}
 			userCount++;
 		}
	}
	window.opener.document.getElementById("<%=element%>
    ").value = selectedUsers;
        window.close();
    }
</script>
</head>
<body>
    <%
        UserBO userBO = new UserBO();
        List<Userhbm> list = userBO.viewUsers();
        if (list == null || list.size() == 0) {
            out.println("还没有用户，请创建新用户!");
        } else {
    %>
    <form name="form1">
        <table border="1" width="100%">
            <tr>
                <td>
                    <input type="checkbox" id="alls" onClick="selectAll();" />
                </td>
                <td>用户名</td>
                <td>全名</td>
                <td>E-mail</td>
            </tr>
            <%
                for (int i = 0; i < list.size(); i++) {
                        Userhbm user = list.get(i);
            %>
            <tr>
                <td>
                    <input type="checkbox" name="cbox" value="<%=user.getName()%>" />
                </td>
                <td><%=user.getName()%></td>
                <td><%=user.getFullName()%></td>
                <td><%=user.getEmail()%></td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="5">
                    <input type="button" onClick="javascript:checkAll('form1','cate');" value="选择" />
                </td>
            </tr>
            <%
                out.println("</table>");
                    out.println("</form>");
                }
            %>    
</body>
</html>