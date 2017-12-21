<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.bean.*"%>
<%@ page import="com.nastation.pm.business.*"%>
<%@ page import="com.nastation.pm.util.*"%>
<%@ page import="com.nastation.pm.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nastation.pm.beanhbm.*"%>
<%
    String id = request.getParameter("id");
    String assign = request.getParameter("assignee");
    String resolution = request.getParameter("newId");
    String comment = request.getParameter("comment");
    String status = request.getParameter("status");
    User user = (User)session.getAttribute(Global.SESSION_USER);
    Userhbm u = new Userhbm();
    u.setAdmin(user.isAdmin());
    u.setCreateDate(user.getCreateDate());
    u.setEmail(user.getEmail());
    u.setFullName(user.getFullName());
    u.setId(user.getId());
    u.setName(user.getName());
    u.setPassword(user.getPassword());
    
    int issueId = Integer.parseInt(id);
    IssueBO ib = new IssueBO();
    Issuehbm issue = ib.getIssue(issueId);
    if (assign.equals("-1")) {
        issue.setAssignee(u);
    } else {
        issue.setAssignee(new UserBO().getUser(Integer.parseInt(assign)));
    }
    issue.setResolutionId(Integer.parseInt(resolution));
    ib.updateIssueByLinkResolution(issue);
    if (!StringUtils.isBlank(comment)) {
        String createTime = StringUtils.toString(new java.util.Date());
        CommentBO cb = new CommentBO();
        Comment coment = new Comment();
        Commenthbm c = new Commenthbm();
        coment.setAuthor(user.getName());
        coment.setCommentContent(comment);
        coment.setIssueId(issue.getId());
        coment.setCreateDate(new java.util.Date());
        
        c.setAuthor(user.getName());
        c.setCommentContent(comment);
        c.setIssue(ib.getIssue(issue.getId()));
        c.setCreateDate(new java.util.Date());
        
        
        cb.addComment(c);
    }
    if (status.equals("close")) {
        String endTime = StringUtils.toString(new Date());
        Issuehbm newIssue = ib.getIssue(issueId);
        newIssue.setEndTime(new java.util.Date());
        newIssue.setLastUpdateDate(new java.util.Date());
        newIssue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.CLOSE));
        ib.updateIssueByLinkStatus(newIssue);
    }
    if (status.equals("resolved")) {
        String endTime = StringUtils.toString(new Date());
        Issuehbm newIssue = ib.getIssue(issueId);
        newIssue.setEndTime(new java.util.Date());
        newIssue.setLastUpdateDate(new java.util.Date());
        newIssue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.RESOLVED));
        ib.updateIssueByLinkStatus(newIssue);
    }
    if (status.equals("reopen")) {
        String updateTime = StringUtils.toString(new Date());
        Issuehbm newIssue = ib.getIssue(issueId);
        newIssue.setLastUpdateDate(new java.util.Date());
        newIssue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.REOPEN));
        ib.updateIssueByLinkStatus(newIssue);
    }
%>
<jsp:forward page="issueDetailLayout.jsp" />