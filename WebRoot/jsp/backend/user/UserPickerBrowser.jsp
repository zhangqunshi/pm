<%-- 
	描述： 选择用户在新建项目页面中
	作者: Kris
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.User"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
    String element = request.getParameter("element");
%>
<html>
<head>
<link href="<%=request.getContextPath()%>/includes/css/main.css" media="all" rel="StyleSheet" type="text/css" />
<script type="text/javascript">
       function sendTo(user){
       	 //alert("===sendTo==="+user);
       	 //alert('<%=element%>')
         window.opener.document.getElementById('<%=element%>
    ').value = user;
        window.close();
    }
</script>
</head>
<body>
    <s:if test="flag">
        <p>还没有用户，请创建新用户。</p>
    </s:if>
    <s:else>
        <table border=1 width='100%'>
            <tr>
                <td>用户名</td>
                <td>全名</td>
                <td>E-mail</td>
            </tr>
            <s:iterator value="#userList" var="ul">

                <tr>
                    <td>
                        <a href='#' onclick="return sendTo('<s:property value="#ul.name"/>');">
                            <s:property value="#ul.name" />
                        </a>
                    </td>
                    <td>
                        <a href='#' onclick="return sendTo('<s:property value="#ul.name"/>');">
                            <s:property value="#ul.fullname" />
                            %>
                        </a>
                    </td>
                    <td>
                        <a href='#' onclick="return sendTo('<s:property value="#ul.name"/>');">
                            <s:property value="#ul.email" />
                        </a>
                    </td>
                </tr>
            </s:iterator>
        </table>
    </s:else>
</body>
</html>