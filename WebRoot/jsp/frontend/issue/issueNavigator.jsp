<%-- 
    此页面用于显示一个项目中所有问题/分配给我的问题/正在进行的问题。
    参数:action , projectId。
    如果用于显示项目中所有问题，需要传递action , projectId两个参数，即action=all 。
    如果用于显示分配给我的问题，需要传递action参数，即action=forMe 。
    如果用于显示正在进行的问题，需要传递action参数，即action=inProgress 。
    
    ChangeLog:
	2009-1-9 use Global.SESSION_FILTER
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%
    String filterId = request.getParameter("filterId");
    String mode = request.getParameter("mode");
    String createNew = request.getParameter("createNew");

    if (StringUtils.isNotBlank(request.getParameter("action"))) {
        session.removeAttribute(Global.SESSION_FILTER);
    }

    //如果有filterId, 就说明它想使用它, 否则请不要传递filterId
    if (StringUtils.isNotBlank(filterId)) {
        IssueFilterBO filterBO = new IssueFilterBO();
        IssueFilter issueF = filterBO.getFilterById(Integer.parseInt(filterId));
        session.setAttribute(Global.SESSION_FILTER, issueF); //从这里开始把问题过滤条件添加到session中的
    }

    //如果是新建，就删除session中所有的filter
    if ("true".equals(createNew)) {
        session.removeAttribute(Global.SESSION_FILTER);
    }
%>
<html>
<head>
<script src="/pmhb/includes/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/includes/js/calendar/calendar-min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/includes/js/calendar/calendar-setup-min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/includes/js/calendar/calendar-zh.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/includes/js/calendar/skins/aqua/calendar.css" media="all" rel="styleSheet" type="text/css" />
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
</head>




<body>

    <div class="container">

        <div class="row">
            <div class="col-md-4">
                <!-- 左侧导航 -->
                <%@include file="/jsp/frontend/issue/searchIssueTopMenu.jsp"%>
                <%@include file="/jsp/frontend/issue/filterDetailLeftMenu.jsp"%>
                <%
                    //只有编辑或新建时才显示
                    if ("show".equals(mode) || "true".equals(createNew)) {
                %>
                <%@include file="/jsp/frontend/issue/searchIssue.jsp"%>
                <%
                    } //endif
                %>


            </div>

            <div class="col-md-8">
                <!-- 右侧问题列表 -->
                <%@include file="/jsp/frontend/issue/issueNavigatorR.jsp"%>
            </div>

        </div>

    </div>




</body>
</html>
