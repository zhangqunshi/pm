<%-- 
	把session中未保存的filter保存到数据库中
	
	@author: Kris
	@date 2008-1-9
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
    //获得参数
    String newFilterName = request.getParameter("newfilterName");
    String description = request.getParameter("description");

    //判断参数
    boolean hasErr = false;
    String errMsg = "";
    if (StringUtils.isBlank(newFilterName)) {
        errMsg += "Filter name cannot be empty!";
        hasErr = true;
    }

    //从session中取出filter
    IssueFilter filter = (IssueFilter) session.getAttribute(Global.SESSION_FILTER);

    if (filter == null) {
        errMsg += "Cannot found a filter in session";
        hasErr = true;
    }

    //保存filter到数据库中
    IssueFilterBO filterBO = new IssueFilterBO();
    boolean exist = filterBO.checkFilterName(newFilterName);
<<<<<<< HEAD
=======
    
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
    if (exist) { //判断重名
        hasErr = true;
        errMsg += "The filter name already exist!";
    }

    if (hasErr) {
        request.setAttribute("error", errMsg);
%>
<jsp:forward page="saveAsFilter.jsp" />
<%
    } //endif

    User user = (User) session.getAttribute(Global.SESSION_USER);
    filter.setAuthorName(user.getName());
    filter.setDescription(description);
    filter.setFilterName(newFilterName.trim());
    SearchRequesthbm sr = new SearchRequesthbm();
    sr.setId(filter.getId());
    sr.setAuthorName(filter.getAuthorName());
    sr.setDescription(filter.getDescription());
    sr.setFilterName(filter.getFilterName());
    sr.setRequest_content(filter.getRequestContent());
    sr.setProjectId(filter.getProjectId());
    filterBO.addFilter(sr);

    //从数据库中取得对象获得id
    IssueFilter savedFilter = filterBO.getFilter(newFilterName);

    //保存filterSummary
    if (savedFilter != null) {
        filter.setId(savedFilter.getId());

        //保存sql语句的参数值
        IssueFilterBO issueFilterBO = new IssueFilterBO();
        issueFilterBO.addFilterParameterValues(savedFilter.getId(), filter.getParamValues());

        FilterSummaryBO filterSummaryBO = new FilterSummaryBO();
        filterSummaryBO.addFilterSummary(filter.getItem(), savedFilter.getId());

        //更新filter
        session.setAttribute(Global.SESSION_FILTER, filter);
    }
%>
<jsp:forward page="issueNavigator.jsp" />