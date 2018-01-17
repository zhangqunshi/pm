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
<%@taglib prefix="s" uri="/struts-tags"%> 
<!-- 功能：删除项目类型-->

<html>
<body>
    <div style="border: 1px solid rgb(187, 187, 187); padding: 2px;">
        <table border=0>
            <tr>
                <td>
                    <form action="doDeleteRole.jsp">
                        <H3 class="formtitle">
                            Delete Role:<s:property value="name"/></H3>
                        <pre> 
       Confirm that you want to delete this project category.
     </pre>
                        <input type="hidden" name="id" value="<s:property value="id"/>" />
                        <input type="submit" value="删除" />
                        <input type="button" value="取消" onclick="window.history.back();" />
                    </form>
                </td>
            </tr>

        </table>
    </div>
</body>
</html>