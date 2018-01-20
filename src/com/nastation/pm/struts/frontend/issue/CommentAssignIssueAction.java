package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.Commenthbm;
import com.nastation.pm.beanhbm.Issuehbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.CommentBO;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.IssueStatusBO;
import com.nastation.pm.business.UserBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentAssignIssueAction extends ActionSupport {
    private int id;
    private String assignee;
    private int newId;
    private String comment;
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public int getNewId() {
        return newId;
    }

    public void setNewId(int newId) {
        this.newId = newId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String execute() throws Exception {

        User user = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        Userhbm u = new Userhbm();
        u.setAdmin(user.isAdmin());
        u.setCreateDate(user.getCreateDate());
        u.setEmail(user.getEmail());
        u.setFullName(user.getFullName());
        u.setId(user.getId());
        u.setName(user.getName());
        u.setPassword(user.getPassword());

        IssueBO ib = IssueBO.getIssueBO();
        Issuehbm issue = ib.getIssue(getId());

        if (getAssignee().equals("-1")) {
            issue.setAssignee(u);
        } else {
            issue.setAssignee(new UserBO().getUser(Integer.parseInt(getAssignee())));
        }
        issue.setResolutionId(getNewId());
        ib.updateIssueByLinkResolution(issue);

        if (!StringUtils.isBlank(getComment())) {
            String createTime = StringUtils.toString(new java.util.Date());
            CommentBO cb = CommentBO.getCommentBO();
            Commenthbm c = new Commenthbm();

            c.setAuthor(user.getName());
            c.setCommentContent(getComment());
            c.setIssue(ib.getIssue(issue.getId()));
            c.setCreateDate(new java.util.Date());

            cb.addComment(c);
        }

        if (getStatus().equals("close")) {
            String endTime = StringUtils.toString(new java.util.Date());
            Issuehbm newIssue = ib.getIssue(getId());
            newIssue.setEndTime(new java.util.Date());
            newIssue.setLastUpdateDate(new java.util.Date());
            newIssue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.CLOSE));
            ib.updateIssueByLinkStatus(newIssue);
        }
        if (getStatus().equals("resolved")) {
            String endTime = StringUtils.toString(new java.util.Date());
            Issuehbm newIssue = ib.getIssue(getId());
            newIssue.setEndTime(new java.util.Date());
            newIssue.setLastUpdateDate(new java.util.Date());
            newIssue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.RESOLVED));
            ib.updateIssueByLinkStatus(newIssue);
        }
        if (getStatus().equals("reopen")) {
            String updateTime = StringUtils.toString(new java.util.Date());
            Issuehbm newIssue = ib.getIssue(getId());
            newIssue.setLastUpdateDate(new java.util.Date());
            newIssue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.REOPEN));
            ib.updateIssueByLinkStatus(newIssue);
        }

        return SUCCESS;
    }

}
