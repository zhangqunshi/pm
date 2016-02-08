<%-- 
	描述： issue search
	作者: zhanglei
	日期: 2008-1-5
	修改: Kris 2008-1-8
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*,java.util.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
	//获取参数
	String modex = request.getParameter("mode");
	String show = request.getParameter("show");
	String hide = request.getParameter("hide");
	String pid = request.getParameter("pid");
	String type = request.getParameter("type");
	String query = request.getParameter("query");
	String summary = request.getParameter("summary");
	String description = request.getParameter("description");
	String body = request.getParameter("body");
	String environment = request.getParameter("environment");
	String reporterSelect = request.getParameter("reporterSelect");
	String reporter = request.getParameter("reporter");
	String assigneeSelect = request.getParameter("assigneeSelect");
	String assignee = request.getParameter("assignee");
	String status = request.getParameter("status");
	String resolution = request.getParameter("resolution");
	String priority = request.getParameter("priority");
	String createdafter = request.getParameter("createdafter");
	String createdbefore = request.getParameter("createdbefore");
	String duedateafter = request.getParameter("duedateafter");
	String duedatebefore = request.getParameter("duedatebefore");

	//打印参数
	System.out.println("======modex========" + modex);
	System.out.println("======show========" + show);
	System.out.println("======hide========" + hide);
	System.out.println("======pid========" + pid);
	System.out.println("======type========" + type);
	System.out.println("======query========" + query);
	System.out.println("======summary========" + summary);
	System.out.println("======description========" + description);
	System.out.println("======body========" + body);
	System.out.println("======environment========" + environment);
	System.out.println("======reporterSelect========" + reporterSelect);
	System.out.println("======reporter========" + reporter);
	System.out.println("======assigneeSelect========" + assigneeSelect);
	System.out.println("======assignee========" + assignee);
	System.out.println("======status========" + status);
	System.out.println("======resolution========" + resolution);
	System.out.println("======createdafter========" + createdafter);
	System.out.println("======priority========" + priority);
	System.out.println("======createdbefore========" + createdbefore);
	System.out.println("======duedateafter========" + duedateafter);
	System.out.println("======duedatebefore========" + duedatebefore);

	//----------------构建filter所需的item------------------------
	HashMap item = new HashMap();

	String querySql = "";
	List paramValues = new ArrayList();

	//项目
	if (StringUtils.isNotBlank(pid) && !"-1".equals(pid)) {
		querySql += " and project_id= " + pid;
		ProjectBO projectBO = new ProjectBO();
		Project tempP = projectBO.getProject(Integer.parseInt(pid));
		System.out.println("======tempP=====" + tempP);
		if (tempP != null) {
			System.out.println("======tempP=====" + tempP.getName());
			item.put(IssueFilter.pid, tempP.getName());
		}
	}

	//问题类型
	if (StringUtils.isNotBlank(type) && !"-1".equals(type)) {
		querySql += " and issue_type_name=? ";
		paramValues.add(type);
		item.put(IssueFilter.issue_type, type);
	}

	//查询
	if (StringUtils.isNotBlank(query)) {
		String tempSql = "";

		int count = 0;
		if (StringUtils.isNotBlank(summary)) {
			count++;
			tempSql += " issue_name like ? ";
			paramValues.add("%" + query + "%");
			item.put(IssueFilter.query_summary, summary);
		}
		if (StringUtils.isNotBlank(description)) {
			if (count > 0) {
				tempSql += " or ";
			}
			count++;
			tempSql += " description like ? ";
			paramValues.add("%" + query + "%");
			item.put(IssueFilter.query_description, description);
		}
		if (StringUtils.isNotBlank(body)) {
			//暂时去掉
		}
		if (StringUtils.isNotBlank(environment)) {
			if (count > 0) {
				tempSql += " or ";
			}
			count++;
			tempSql += " environment like ? ";
			paramValues.add("%" + query + "%");
			item.put(IssueFilter.query_environment, environment);
		}
		if (count > 0) {
			querySql += " and ( " + tempSql + " ) ";
			item.put(IssueFilter.query, query);
		}
	}

	//报告人选择
	if ("issue_no_reporter".equals(reporterSelect)) {
		item.put(IssueFilter.reporterSelect, reporterSelect);
		querySql += " and reporter_id is null ";
	}
	User currUser = (User) session.getAttribute(Global.SESSION_USER);
	if ("issue_current_user".equals(reporterSelect)) {
		if (currUser != null) {
			item.put(IssueFilter.reporterSelect, reporterSelect);
			paramValues.add(currUser.getName());
			querySql += " and reporter=? ";
		}
	}
	if ("specificuser".equals(reporterSelect)) {
		if (StringUtils.isNotBlank(reporter)) {
			UserBO userBO = new UserBO();
			if (userBO.exist(reporter)) { //如果存在这个用户
				item.put(IssueFilter.reporterSelect, reporterSelect);
				item.put(IssueFilter.reporter, reporter);
				paramValues.add(reporter);
				querySql += " and reporter=? ";
			}
		}
	}

	//开发者选择
	if ("unassigned".equals(assigneeSelect)) {
		item.put(IssueFilter.assigneeSelect, assigneeSelect);
		querySql += " and assignee_id is null ";
	}
	if ("issue_current_user".equals(assigneeSelect)) {
		item.put(IssueFilter.assigneeSelect, assigneeSelect);
		querySql += " and assignee=? ";
	}
	if ("specificuser".equals(assigneeSelect)) {
		if (StringUtils.isNotBlank(assignee)) {
			UserBO userBO = new UserBO();
			if (userBO.exist(assignee)) { //如果存在这个用户
				item.put(IssueFilter.assigneeSelect, assigneeSelect);
				item.put(IssueFilter.assignee, assignee);
				paramValues.add(assignee);
				querySql += " and assignee=? ";
			}
		}
	}

	//状态
	if (StringUtils.isNotBlank(status) && !"-1".equals(status)) {
		item.put(IssueFilter.status, status);
		paramValues.add(status);
		querySql += " and status_name=? ";
	}

	//匹配的解决情况
	if (StringUtils.isNotBlank(resolution)) {
		if ("-2".equals(resolution)) {
			querySql += " and resolution_id is null ";
			item.put(IssueFilter.resolution, "未解决");
		} else if (!"-1".equals(resolution)) {
			querySql += " and resolution_name=? ";
			paramValues.add(resolution);
			item.put(IssueFilter.resolution, resolution);
		}
	}

	//匹配的优先级
	if (StringUtils.isNotBlank(priority) && !"-1".equals(priority)) {
		item.put(IssueFilter.priority, priority);
		paramValues.add(priority);
		querySql += " and priority_level_name = ? ";
	}

	//日期时间 
	if (StringUtils.isNotBlank(createdafter)) {
		item.put(IssueFilter.createdafter, createdafter);
		paramValues.add(createdafter);
		querySql += " and  create_date > ? ";
	}
	if (StringUtils.isNotBlank(createdbefore)) {
		item.put(IssueFilter.createdbefore, createdbefore);
		paramValues.add(createdbefore);
		querySql += " and  create_date < ? ";
	}
	if (StringUtils.isNotBlank(duedateafter)) {
		item.put(IssueFilter.duedateafter, duedateafter);
		paramValues.add(duedateafter);
		querySql += " and  plan_end_time > ? ";
	}
	if (StringUtils.isNotBlank(duedatebefore)) {
		item.put(IssueFilter.duedatebefore, duedatebefore);
		paramValues.add(duedatebefore);
		querySql += " and  plan_end_time < ? ";
	}

	String sql = "select * from v_issue_detail ";
	if (StringUtils.isNotBlank(querySql)) {
		sql += " where 1=1 " + querySql;
	}
	sql += " order by id desc";

	System.out.println("===doSearchIssue.jsp=======sql=======" + sql);

	//根据查询得到issue列表	
	IssueBO issueBO = new IssueBO();
	List issueList = issueBO.getIssueSearchList(sql, paramValues);

	//把issue列表保存到request, 供issueNavigatorR.jsp页面使用
	request.setAttribute("issueList", issueList);

	//新过滤器
	IssueFilter filter = new IssueFilter();
	if (StringUtils.isNotBlank(pid) && !pid.equals("-1")) {
		filter.setProjectId(Integer.parseInt(pid));
	}
	filter.setRequestContent(sql);
	filter.setItem(item);
	filter.setParamValues(paramValues);
		
	
	
	//如果有一个已保存的filter, 就属于更新操作，而不是新建。
	IssueFilter filterInSession = (IssueFilter)session.getAttribute(Global.SESSION_FILTER);
	if (filterInSession != null && filterInSession.isSaved()) {
		IssueFilterBO issueFilterBO = new IssueFilterBO();
		boolean changed = filterInSession.isChanged(filter);
		if (changed) { //如果改变了更新到数据库中
			if (StringUtils.isNotBlank(pid) && !pid.equals("-1")) {
				filterInSession.setProjectId(Integer.parseInt(pid));
			} else {
				filterInSession.setProjectId(-1);
			}
			filterInSession.setRequestContent(sql);
			filterInSession.setItem(item);
			filterInSession.setParamValues(paramValues);
			issueFilterBO.updateFilter(filterInSession);
			session.setAttribute(Global.SESSION_FILTER, filterInSession);
		}
	} else {
		session.setAttribute(Global.SESSION_FILTER, filter);
	}

//判断点击那一个按钮
	String mode = null;
	if (StringUtils.isNotBlank(show)) {
		mode = "show";
	}
	if (StringUtils.isNotBlank(hide)) {
		mode = "hide";
	}
%>
<jsp:forward page="issueNavigator.jsp">
	<jsp:param name="mode" value="<%=mode%>" />
</jsp:forward>