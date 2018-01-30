<%-- 
	描述： 浏览组
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>

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
                <b>
                    Selected 1 of
                    <s:property value="groupCount" />
                    Groups
                </b>
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td align="center">
                <input type="submit" value="check" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <br>
                <select id="fatherid" size="5" name="groupName">
                    <s:iterator value="#gourpList" var="g">
                        <s:if test="#g.flag">
                            <option selected value="<s:property value="#g.name"/>"><s:property value="#g.name"/></option>
                        </s:if>
                        <s:else>
                            <option value="<s:property value="#g.name"/>"><s:property value="#g.name"/></option>
                        </s:else>
                    </s:iterator>
                </select>
            </td>
        </tr>
    </table>
</form>