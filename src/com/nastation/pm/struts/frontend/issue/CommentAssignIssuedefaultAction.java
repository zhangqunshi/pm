package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.User;
import com.nastation.pm.business.IssueBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentAssignIssuedefaultAction extends ActionSupport {
    private String issueKey;
    private String status;
    private int userId;
    private String userName;
    private boolean issueStatus;

    public boolean isIssueStatus() {
        return issueStatus;
    }

    public void setIssueStatus(boolean issueStatus) {
        this.issueStatus = issueStatus;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    @Override
    public String execute() throws Exception {
        IssueBO ib = IssueBO.getIssueBO();
        Issue issue = ib.getIssueDetailByKey(getIssueKey());
        User user = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        setUserId(user.getId());
        setUserName(user.getName());
        if (issue.getIssueStatus() == Global.CLOSE || issue.getIssueStatus() == Global.RESOLVED) {
            setIssueStatus(true);
        }

        return SUCCESS;
    }

}
