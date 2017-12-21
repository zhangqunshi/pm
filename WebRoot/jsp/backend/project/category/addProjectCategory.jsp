<%-- 
	描述：新建项目分类
	作者: Kris
	日期: 2008-12-25
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<p></p>
<div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">

    <h3>Add New Project Category</h3>

    <%@include file="/jsp/showErrorMessage.jsp"%>

    <form action="doAddProjectCategory.jsp">

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
                    <input type="text" name="desc" size="50" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;</td>
                <td align="right">
                    <input type="submit" value="增加" />
                </td>
            </tr>
        </table>

    </form>
</div>

