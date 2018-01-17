package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.business.IssueBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteIssueAction extends ActionSupport {
    private int id;
    private String action;
    private String projName;
    private int projId;

    public int getProjId() {
        return projId;
    }

    public void setProjId(int projId) {
        this.projId = projId;
    }

    public String getProjName() {
        return projName;
    }

    public void setProjName(String projName) {
        this.projName = projName;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        IssueBO issueBO = IssueBO.getIssueBO();
        Issue issue = issueBO.getIssueDetail(getId());
        String action = (String) ActionContext.getContext().getSession().get("action");
        setProjId(issue.getProjectId());
        setProjName(issue.getProjectName());
        issueBO.deleteIssue(getId());

        if (action.equals("all")) {
            setAction("all");
        } else if (action.equals("forMe")) {
            setAction("forMe");
        } else {
            setAction("inProgress");
        }

        return SUCCESS;
    }

}
