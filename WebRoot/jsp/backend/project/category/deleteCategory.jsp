<%-- 
	描述： 删除项目类型
	作者:zhanglei
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!-- 功能：删除项目类型-->

<html>
<body>

    <div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
        <table border="0">
            <tr>
                <td colspan="2">
                    <h3 class="formtitle">
                        Delete Project Category:<s:property value="name"/>
                    </h3>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <p>Confirm that you want to delete this project category.</p>
                    <p></p>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" class="spaced" title="按 Alt+S 提交" accesskey="S" onclick="location.href='<c:url value="/jsp/backend/project/category/doDeleteCategory.jsp"/>?id=<s:property value="id"/>'" value="删除" id="删除" name="删除" />
                    <input type="button" onclick="location.href='<c:url value="/jsp/backend/project/category/viewProjectCategory.jsp"/>'" value="取消" title="取消 (Alt + `)" accesskey="`" id="cancelButton" />

                </td>
            </tr>
        </table>
    </div>
</body>
</html>


