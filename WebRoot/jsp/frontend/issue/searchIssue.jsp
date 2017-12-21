<%-- 
	 2009-1-9 use Global.SESSION_FILTER
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
    //要求: 编辑filter和新建filter时才显示这个页面
			//这个页面，如果有filter就显示出来, 没有就显示空
			//决定这个页面显示还是不显示， 由包含页面来处理

			//取得要编辑的filter
			IssueFilter filterLB = (IssueFilter) session.getAttribute(Global.SESSION_FILTER);

			boolean hasFilter = false;

			if (filterLB != null) {
				hasFilter = true;
			}
%>


<form method="post" name="filterform" action="doSearchIssue.jsp">
    <input id="refreshFilter" type="hidden" value="false" name="refreshFilter" />
    <input id="reset" type="hidden" value="update" name="reset" />



    <table id="filterForm" cellspacing="0" cellpadding="4" border="1" width="200" class="simpleform">
        <tr>
            <td class="rowHeader fullyCentered" colspan="2">
                <input class="hiddenButton" type="submit" value="查看 >>" name="show" />
                <input id="searchAndHide" type="submit" value="<< 查看 & 隐藏" name="hide" />
                <input id="searchButton" type="submit" title="按 Alt+S 提交" accesskey="S" value="查看 >>" name="show" />
            </td>
        </tr>


        <!-- 项目 -->
        <tr id="pidFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="pid"> 项目: </label>
            </td>
            <td class="fieldValueArea">
                <select id="pid" class="standardInputField" size="5" multiple="multiple" name="pid">
                    <option class="headerOption" value="-1">
							所有项目
						</option>
                    <%
                        ProjectBO pb = new ProjectBO();

                    			List projectList = pb.getProjectList();

                    			for (int i = 0; i < projectList.size(); i++) {
                    				Project project = (Project) projectList.get(i);
                    				if (hasFilter && (filterLB.getProjectId() == project.getProjectId())) {
                    					out.println(
                    							"<option value=" + project.getProjectId() + " selected>" + project.getName() + "</option>");
                    				} else {
                    					out.println("<option value=" + project.getProjectId() + ">" + project.getName() + "</option>");
                    				}
                    			}
                    %>
                </select>
            </td>
        </tr>



        <!-- 问题类型 -->
        <tr id="typeFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="type"> 问题类型: </label>
            </td>
            <td class="fieldValueArea">
                <select id="type" class="standardInputField" size="5" multiple="multiple" name="type">
                    <option class="headerOption" value="-1">
							任何
						</option>
                    <%
                        IssueTypeBO itb = new IssueTypeBO();
                    			List typeList = itb.getIssueTypeList();
                    			for (int i = 0; i < typeList.size(); i++) {
                    				IssueType type = (IssueType) typeList.get(i);
                    				if (hasFilter && type.getName().equals(filterLB.getItemValue(IssueFilter.issue_type))) {
                    					out.println("<option value='" + type.getName() + "' selected>");
                    				} else {
                    					out.println("<option value='" + type.getName() + "'>");
                    				}
                    				out.println(type.getName());
                    				out.println("</optoin>");
                    			}
                    %>
                </select>

                <div id="projectRefreshPanel" class="infoBox" onclick="refreshDependentFields();" style="display: none;">
                    重新选择的项目或者问题类型可能会有不同的版本,模块或者自定义字段.
                    <a onclick="refreshDependentFields();return false;" href="#">点击这里</a>
                    刷新搜索菜单.
                </div>
            </td>
        </tr>


        <!-- 文本搜索 -->
        <tr>
            <th id="navigator.filter.subheading.textsearchheader" class="rowHeader headerOpened" title="点击隐藏/显示区域 文本搜索" onclick="GuiPrefs.toggleVisibility('navigator.filter.subheading.textsearch');" colspan="2">文本搜索</th>
        </tr>

        <tr id="queryFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="query"> 查询: </label>
            </td>
            <td class="fieldValueArea">
                <input id="query" class="standardInputField" type="text" value="<%if (hasFilter) {
				out.println(StringUtils.removeNull(filterLB.getItemValue(IssueFilter.query)));
			}%>" name="query" />
            </td>
        </tr>
        <tr>
            <td class="fieldLabelArea" style="width: 30%;">查询字段:</td>
            <td class="fieldValueArea" style="width: 70%;">
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td nowrap="" width="50%">
                                <input id="summaryId" type="checkbox" <%if (hasFilter && "true".equals(filterLB.getItemValue(IssueFilter.query_summary))) {
				out.println("checked='checked'");
			}%> value="true" name="summary" />
                                <label for="summaryId"> 概要 </label>
                            </td>
                            <td nowrap="" width="50%">
                                <input id="descriptionId" type="checkbox" <%if (hasFilter && "true".equals(filterLB.getItemValue(IssueFilter.query_description))) {
				out.println("checked='checked'");
			}%> value="true" name="description" />
                                <label for="descriptionId"> 描述 </label>
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="" width="50%">
                                <input id="environmentId" type="checkbox" value="true" <%if (hasFilter && "true".equals(filterLB.getItemValue(IssueFilter.query_environment))) {
				out.println("checked='checked'");
			}%> name="environment" />
                                <label for="environmentId"> 环境 </label>
                            </td>
                            <td nowrap="" width="50%">
                                <!-- 
									<input id="bodyId" type="checkbox" value="true" 
									<%-- if (hasFilter && "true".equals(filterLB.getItemValue(IssueFilter.query_body))) {out.println("checked='checked'");} --%>
									 name="body" />
									<label for="bodyId">
										备注
									</label>
								 -->
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <th id="navigator.filter.subheading.issueattributesheader" class="rowHeader headerOpened" title="点击隐藏/显示区域 问题属性" onclick="GuiPrefs.toggleVisibility('navigator.filter.subheading.issueattributes');" colspan="2">问题属性</th>
        </tr>
        <tr id="reporterSelectFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="reporterSelect"> 报告人: </label>
            </td>
            <td class="fieldValueArea">
                <select id="reporterSelect" onchange="togglereporterField();" name="reporterSelect">
                    <%
                        String reporterSelect = null;
                    			if (hasFilter) {
                    				reporterSelect = filterLB.getItemValue(IssueFilter.reporterSelect);
                    			}
                    %>
                    <option value="-1" <%if ("-1".equals(reporterSelect)) {
				out.println("selected");
			}%>>
							任何用户
						</option>
                    <option value="issue_no_reporter" <%if ("issue_no_reporter".equals(reporterSelect)) {
				out.println("selected");
			}%>>
							没报告人
						</option>
                    <option value="issue_current_user" <%if ("issue_current_user".equals(reporterSelect)) {
				out.println("selected");
			}%>>
							当前用户
						</option>
                    <option value="specificuser" <%if ("specificuser".equals(reporterSelect)) {
				out.println("selected");
			}%>>
							特指的用户
						</option>
                </select>
            </td>
        </tr>
        <script language="javascript">
                                    function togglereporterField() {
                                        //alert("ok");
                                        var tt = document
                                                .getElementById("reporterSelect");
                                        var test = document
                                                .getElementById("reporter_container");
                                        var tes = document
                                                .getElementById("readonly");
                                        if (tt.value == 'specificuser') {
                                            tes.style.display = 'none';
                                            test.style.display = 'block';
                                        } else {
                                            test.style.display = 'none';
                                            tes.style.display = 'block';
                                        }
                                    }
                                    function toggleassigneeField() {
                                        //alert("ok");
                                        var tt = document
                                                .getElementById("assigneeSelect");
                                        var test = document
                                                .getElementById("assignee_container");
                                        var tes = document
                                                .getElementById("readassignee");
                                        if (tt.value == 'specificuser') {
                                            tes.style.display = 'none';
                                            test.style.display = 'block';
                                        } else {
                                            test.style.display = 'none';
                                            tes.style.display = 'block';
                                        }
                                    }
                                    function openWindow(element) {
                                        var vWinUsers = window
                                                .open(
                                                        '<c:url value="/jsp/backend/user/UserPickerBrowser.jsp"/>?element='
                                                                + element,
                                                        'UserPicker',
                                                        'status=yes,resizable=yes,top=100,left=200,width=580,height=600,scrollbars=yes');
                                        vWinUsers.opener = self;
                                        vWinUsers.focus();
                                    }
                                </script>
        <tr id="reporterFieldArea" class="fieldArea">
            <td class="fieldLabelArea"></td>
            <td class="fieldValueArea">
                <div style="display: block;" id="readonly">
                    <input class="standardInputField" type="text" readOnly="true" value="<%if (hasFilter) {
				out.println(StringUtils.removeNull(filterLB.getItemValue(IssueFilter.reporter)));
			}%>" />
                </div>
                <div id="reporter_container" class="ajax_autocomplete" style="display: none;">
                    <input id="reporter" class="standardInputField" type="text" name="reporter" value="<%if (hasFilter) {
				out.println(StringUtils.removeNull(filterLB.getItemValue(IssueFilter.reporter)));
			}%>" />
                    <a href="javascript:openWindow('reporter');">
                        <img hspace="0" height="16" border="0" width="16" style="vertical-align: top;" src="<c:url value='/images/icons/filter_public.gif'/>" name="assigneeImage" alt="选择一个用户" title="选择一个用户">
                    </a>
                    <div id="reporter_desc">
                        <font size="1">Start typing to get a list of possible matches.</font>
                    </div>
                </div>
            </td>
        </tr>
        <tr id="assigneeSelectFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="assigneeSelect"> 开发者: </label>
            </td>
            <td class="fieldValueArea">
                <%
                    String assigneeSelect = null;
                			if (hasFilter) {
                				assigneeSelect = filterLB.getItemValue(IssueFilter.assigneeSelect);
                			}
                %>
                <select id="assigneeSelect" onchange="toggleassigneeField();" name="assigneeSelect">
                    <option value="-1" <%if ("-1".equals(assigneeSelect)) {
				out.println("selected");
			}%>>
							任何用户
						</option>
                    <option value="unassigned" <%if ("unassigned".equals(assigneeSelect)) {
				out.println("selected");
			}%>>
							未分配
						</option>
                    <option value="issue_current_user" <%if ("issue_current_user".equals(assigneeSelect)) {
				out.println("selected");
			}%>>
							当前用户
						</option>
                    <option value="specificuser" <%if ("specificuser".equals(assigneeSelect)) {
				out.println("selected");
			}%>>
							特指用户
						</option>
                </select>
            </td>
        </tr>
        <tr id="assigneeFieldArea" class="fieldArea">
            <td class="fieldLabelArea"></td>
            <td class="fieldValueArea">
                <div style="display: block;" id="readassignee">
                    <input class="standardInputField" type="text" readOnly="true" value="<%if (hasFilter) {
				out.println(StringUtils.removeNull(filterLB.getItemValue(IssueFilter.assignee)));
			}%>" />
                </div>
                <div id="assignee_container" class="ajax_autocomplete" style="display: none;">
                    <input id="assignee" class="standardInputField" type="text" name="assignee" value="<%if (hasFilter) {
				out.println(StringUtils.removeNull(filterLB.getItemValue(IssueFilter.assignee)));
			}%>" />

                    <a href="javascript:openWindow('assignee');">
                        <img hspace="0" height="16" border="0" width="16" style="vertical-align: top;" src="<c:url value='/images/icons/filter_public.gif'/>" name="assigneeImage" alt="选择一个用户" title="选择一个用户">
                    </a>
                    <div id="assignee_desc">
                        <font size="1">Start typing to get a list of possible matches.</font>
                    </div>
                </div>
            </td>
        </tr>
        <tr id="statusFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="status"> 状态: </label>
            </td>
            <td class="fieldValueArea">
                <select id="status" class="standardInputField" size="3" multiple="multiple" name="status">
                    <option class="headerOption" value="-1">
							任何
						</option>
                    <%
                        IssueStatusBO isb = new IssueStatusBO();

                    			List statusList = isb.getIssueStatusList();

                    			for (int i = 0; i < statusList.size(); i++) {
                    				IssueStatus status = (IssueStatus) statusList.get(i);

                    				if (hasFilter && status.getName().equals(filterLB.getItemValue(IssueFilter.status))) {
                    					out.println("<option value='" + status.getName() + "' selected>" + status.getName() + "</option>");
                    				} else {
                    					out.println("<option value='" + status.getName() + "'>" + status.getName() + "</option>");
                    				}
                    			}
                    %>
                </select>
            </td>
        </tr>
        <tr id="resolutionFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="resolution"> 匹配的解决情况: </label>
            </td>
            <td class="fieldValueArea">
                <select id="resolution" class="standardInputField" size="3" multiple="multiple" name="resolution">
                    <option class="headerOption" value="-1">
							任何
						</option>
                    <option class="headerOption" value="-2" <%if (hasFilter && "未解决".equals(filterLB.getItemValue(IssueFilter.resolution))) {
				out.println("selected");
			}%>>
							未解决
						</option>
                    <%
                        ResolutionBO rb = new ResolutionBO();
                    			List resolutionList = rb.getAllResolutions();
                    			for (int i = 0; i < resolutionList.size(); i++) {
                    				Resolution resolution = (Resolution) resolutionList.get(i);
                    				if (hasFilter && resolution.getName().equals(filterLB.getItemValue(IssueFilter.resolution))) {
                    					out.println("<option value='" + resolution.getName() + "' selected>" + resolution.getName()
                    							+ "</option>");
                    				} else {
                    					out.println("<option value='" + resolution.getName() + "'>" + resolution.getName() + "</option>");
                    				}
                    			}
                    %>
                </select>
            </td>
        </tr>
        <tr id="priorityFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="priority"> 匹配的优先级: </label>
            </td>
            <td class="fieldValueArea">
                <select id="priority" class="standardInputField" size="3" multiple="multiple" name="priority">
                    <option class="headerOption" value="-1">
							任何
						</option>
                    <%
                        IssuePriorityBO ipb = new IssuePriorityBO();
                    			List priorityList = ipb.getIssuePriorityList();
                    			for (int i = 0; i < priorityList.size(); i++) {
                    				IssuePriority priority = (IssuePriority) priorityList.get(i);
                    				if (hasFilter && priority.getName().equals(filterLB.getItemValue(IssueFilter.priority))) {
                    					out.println(
                    							"<option value='" + priority.getName() + "' selected>" + priority.getName() + "</option>");
                    				} else {
                    					out.println("<option value='" + priority.getName() + "'>" + priority.getName() + "</option>");
                    				}

                    			}
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <th id="navigator.filter.subheading.datesandtimesheader" class="rowHeader headerOpened" title="点击隐藏/显示区域 日期时间" onclick="GuiPrefs.toggleVisibility('navigator.filter.subheading.datesandtimes');" colspan="2">日期时间</th>
        </tr>
        <tr id="created:afterFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="created:after"> 创建..之后: </label>
            </td>
            <td class="fieldValueArea">
                <div class="calendarPicker">
                    <img height="16" border="0" width="16" title="选择日期" alt="选择日期" src="<c:url value='/images/icons/cal.gif'/>" id="after_trigger_c" />
                </div>
                <input id="createdafter" class="dateSearcher" type="text" title="Retrieves issues 创建..之后 or on this date" value="<%if (hasFilter) {
				out.println(StringUtils.removeNull(filterLB.getItemValue(IssueFilter.createdafter)));
			}%>" name="createdafter" />
                <script type="text/javascript">
                                                                    Calendar
                                                                            .setup({
                                                                                firstDay : 0, // first day of the week
                                                                                inputField : "createdafter", // id of the input field
                                                                                button : "after_trigger_c", // trigger for the calendar (button ID)
                                                                                align : "Tl", // alignment (defaults to "Bl")
                                                                                singleClick : true,
                                                                                ifFormat : "%Y-%m-%e" // our date only format
                                                                            });
                                                                </script>
            </td>
        </tr>
        <tr id="created:beforeFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="created:before"> 创建..之前: </label>
            </td>
            <td class="fieldValueArea">
                <div class="calendarPicker">
                    <img height="16" border="0" width="16" title="选择日期" alt="选择日期" src="<c:url value='/images/icons/cal.gif'/>" id="before_trigger_c" />
                </div>
                <input id="createdbefore" class="dateSearcher" type="text" title="Retrieves issues 创建..之前 or on this date" value="<%if (hasFilter) {
				out.println(StringUtils.removeNull(filterLB.getItemValue(IssueFilter.createdbefore)));
			}%>" name="createdbefore" />
                <script type="text/javascript">
                                                                    Calendar
                                                                            .setup({
                                                                                firstDay : 0, // first day of the week
                                                                                inputField : "createdbefore", // id of the input field
                                                                                button : "before_trigger_c", // trigger for the calendar (button ID)
                                                                                align : "Tl", // alignment (defaults to "Bl")
                                                                                singleClick : true,
                                                                                ifFormat : "%Y-%m-%e" // our date only format
                                                                            });
                                                                </script>
            </td>
        </tr>
        <tr id="created:afterFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="created:after"> 逾期..之后: </label>
            </td>
            <td class="fieldValueArea">
                <div class="calendarPicker">
                    <img height="16" border="0" width="16" title="选择日期" alt="选择日期" src="<c:url value='/images/icons/cal.gif'/>" id="duedate_trigger_c" />
                </div>
                <input id="duedateafter" class="dateSearcher" type="text" title="Retrieves issues 创建..之后 or on this date" value="<%if (hasFilter) {
				out.println(StringUtils.removeNull(filterLB.getItemValue(IssueFilter.duedateafter)));
			}%>" name="duedateafter" />
                <script type="text/javascript">
                                                                    Calendar
                                                                            .setup({
                                                                                firstDay : 0, // first day of the week
                                                                                inputField : "duedateafter", // id of the input field
                                                                                button : "duedate_trigger_c", // trigger for the calendar (button ID)
                                                                                align : "Tl", // alignment (defaults to "Bl")
                                                                                singleClick : true,
                                                                                ifFormat : "%Y-%m-%e" // our date only format
                                                                            });
                                                                </script>
            </td>
        </tr>
        <tr id="created:beforeFieldArea" class="fieldArea">
            <td class="fieldLabelArea">
                <label for="created:before"> 逾期..之前: </label>
            </td>
            <td class="fieldValueArea">
                <div class="calendarPicker">
                    <img height="16" border="0" width="16" title="选择日期" alt="选择日期" src="<c:url value='/images/icons/cal.gif'/>" id="duedate_before_trigger_c" />
                </div>
                <input id="duedatebefore" class="dateSearcher" type="text" title="Retrieves issues 创建..之前 or on this date" value="<%if (hasFilter) {
				out.println(StringUtils.removeNull(filterLB.getItemValue(IssueFilter.duedatebefore)));
			}%>" name="duedatebefore" />
                <script type="text/javascript">
                                                                    Calendar
                                                                            .setup({
                                                                                firstDay : 0, // first day of the week
                                                                                inputField : "duedatebefore", // id of the input field
                                                                                button : "duedate_before_trigger_c", // trigger for the calendar (button ID)
                                                                                align : "Tl", // alignment (defaults to "Bl")
                                                                                singleClick : true,
                                                                                ifFormat : "%Y-%m-%e" // our date only format
                                                                            });
                                                                </script>
            </td>
        </tr>
        <tr>
            <td class="rowHeader fullyCentered" colspan="2">
                <input type="submit" value="<< 查看 & 隐藏" name="hide" />
                <input type="submit" value="查看 >>" name="show" />
            </td>
        </tr>
    </table>
</form>