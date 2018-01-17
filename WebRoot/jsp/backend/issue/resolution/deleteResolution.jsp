<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<table cellspacing="0" cellpadding="10" border="1" width="100%">
    <tbody>
        <tr>
            <td>
                <form onsubmit="if (this.submitted) return false; this.submitted = true; return true" name="simpleform" method="post" action="doDeleteResolution.jsp">
                    <table class="simpleform maxWidth">
                        <tbody>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                    <h3 class="formtitle">
                                        Delete Resolution:
                                        <s:property value="name"/>
                                    </h3>
                                </td>
                            </tr>
                            <tr>
                                <td class="simpleformheader" colspan="2">
                                    <p>Confirm that you want to delete this resolution, and specify what is to be done with the issues currently attached to it.</p>
                                    <p>
                                        There are currently
                                        <b><s:property value="count"/></b>
                                        matching issues, that must be changed to another resolution.
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td class="fieldLabelArea">New resolution for matching issues:</td>
                                <td class="fieldValueArea" bgcolor="#ffffff">
                                    <select id="newId_select" name="newId">
                                    <s:iterator value="#resolutionList" var="r">
                                        
                                        <option value=<s:property value="#r.id"/>><s:property value="#r.name"/></option>
                        
                                        </s:iterator>
                                    </select>
                                    <span id="newId_summary" class="selectDescription" />
                                </td>
                            </tr>
                            <tr class="hidden">
                                <td>
                                    <input id="id" type="hidden" value="<s:property value="id"/>" name="id" />
                                </td>
                            </tr>
                            <tr class="hidden">
                                <td>
                                    <input id="confirm" type="hidden" value="true" name="confirm" />
                                </td>
                            </tr>
                            <tr>
                                <td class="fullyCentered simpleformfooter" colspan="2">
                                    <input id="删除" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="删除" name="删除" />
                                    <input id="cancelButton" type="button" onclick="window.history.back();" value="取消" name="ViewResolutions.jspa" title="取消 (Alt + `)" accesskey="`" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </td>
        </tr>
    </tbody>
</table>