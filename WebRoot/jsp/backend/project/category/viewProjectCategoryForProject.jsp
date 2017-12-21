<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<html>
<head>
</head>
<body>
    <%
        String projectId = request.getParameter("projectId");
        int id = Integer.parseInt(projectId);
        ProjectCategoryBO rb = new ProjectCategoryBO();
        List<ProjectCategoryhbm> list = rb.getCategoryList();
    %>
    <table cellspacing="0" cellpadding="10" border="1" width="100%">
        <tbody>
            <tr>
                <td>
                    <form onsubmit="if (this.submitted) return false; this.submitted = true; return true" name="simpleform" method="post" action="../doUpdateProject2.jsp">
                        <table class="simpleform maxWidth">
                            <tbody>
                                <tr>
                                    <td class="simpleformheader" colspan="2">
                                        <h3 class="formtitle">Select Project Category</h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="simpleformheader" colspan="2">This page allows you to select which project category you want this project to be in.</td>
                                </tr>
                                <tr>
                                    <td class="fieldLabelArea">项目分类:</td>
                                    <td class="fieldValueArea" bgcolor="#ffffff">
                                        <select id="pcid_select" name="categoryId">
                                            <option value="-1">
													None
												</option>
                                            <%
                                                for (int i = 0; i < list.size(); i++) {
                                                    ProjectCategoryhbm category = list.get(i);
                                                    out.println("<option value=" + category.getId() + ">" + category.getName() + "</option>");

                                                }
                                            %>
                                        </select>
                                        <span id="pcid_summary" class="selectDescription" />
                                    </td>
                                </tr>
                                <input id="projecId" type="hidden" value="<%=id%>" name="projectId" />
                                <tr>
                                    <td class="fullyCentered simpleformfooter" colspan="2">
                                        <input id="选择" class="spaced" type="submit" title="按 Alt+S 提交" accesskey="S" value="选择" name="选择" />
                                        <input id="cancelButton" type="button" onclick="window.history.back();" value="取消" name="ViewProject.jspa?pid=10022" title="取消 (Alt + `)" accesskey="`" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>