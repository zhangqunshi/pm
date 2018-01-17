package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.Commenthbm;
import com.nastation.pm.business.CommentBO;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DoAssigneeAction extends ActionSupport {
    private int issueId;
    private int projectid;
    private int assigneeId;
    private String content;
    private String assignee;
    private String issueKey;

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    public int getProjectid() {
        return projectid;
    }

    public void setProjectid(int projectid) {
        this.projectid = projectid;
    }

    public int getAssigneeId() {
        return assigneeId;
    }

    public void setAssigneeId(int assigneeId) {
        this.assigneeId = assigneeId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String execute() throws Exception {
        User user = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        if (StringUtils.isNotBlank(getContent())) {
            CommentBO commentBO = CommentBO.getCommentBO();
            Commenthbm c = new Commenthbm();

            c.setAuthor(user.getName());
            c.setCommentContent(getContent());
            c.setCreateDate(new java.util.Date());
            c.setIssue(new IssueBO().getIssue(getIssueId()));

            commentBO.addComment(c);
        }

        IssueBO issueBO = IssueBO.getIssueBO();
        Issue issue = issueBO.getIssueDetail(getIssueId());
        if (issue.getAssigneeId() == getAssigneeId()) {
            setAssignee(issue.getAssignee());
            return ERROR;
        }

        issueBO.setAssignee(getIssueId(), getAssigneeId());
        setIssueKey(issue.getIssueKey());

        return SUCCESS;
    }

}
