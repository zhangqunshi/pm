<%-- 
	描述： 移动问题第四步
	作者: 刘列辉
	日期: 2008-12-22
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="java.util.*"%>
<html>
	<head>
	</head>

	<body>
	<%
			//从session中获得issue信息;
			Issue issue = (Issue)session.getAttribute("moveIssue");
            
			//判断参数是否为空
			if (issue == null) {
				System.out.println("问题信息为null");
				System.out.println("=======step3==issue=========="+issue);
				return;
			}
			
			System.out.println("=======step3==newIssue.getProjectName=========="+issue.getProjectName());
			System.out.println("=======step3==newIssue.getIssueTypeName=========="+issue.getIssueTypeName());
			
            //通过projectId获得一个新的issueKey 
			IssueBO issueBo = new IssueBO();
            String issueKey = issueBo.getMoveIssueDetail(issue.getProjectId());
            issue.setIssueKey(issueKey);
            
            //根据issue更新已知的记录
            issueBo.updateMoveIssue(issue);
            issueKey = java.net.URLEncoder.encode(issueKey,"UTF-8");
            response.sendRedirect("../issue/issueDetailLayout.jsp?issueKey="+issueKey);  
		%>

  </body>
</html>
