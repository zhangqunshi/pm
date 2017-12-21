<%-- 
	描述：新建问题解决结果
	作者: Kris
	日期: 2008-12-27
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<p></p>
<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
    <h3>Add New Resolution</h3>
    <form action="doAddResolution.jsp">
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
                out.println("<font color=red>" + error + "</font>");
            }
        %>
        <table border="0">
            <tr>
                <td align="right">* 名称：</td>
                <td>
                    <input type="text" name="name" size="20" />
                </td>
            </tr>
            <tr>
                <td align="right">描述：</td>
                <td>
                    <input type="text" name="description" size="50" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" value="增加" />
                </td>
            </tr>
        </table>
    </form>
</div>
