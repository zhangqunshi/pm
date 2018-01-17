package com.nastation.pm.struts.backend.user;

import com.nastation.pm.business.IssueBO;
import com.opensymphony.xwork2.ActionSupport;

public class UserDeleteConfirmAction extends ActionSupport {
    private int id;
    private int assigneeCount;
    private int reporterCount;

    public int getAssigneeCount() {
        return assigneeCount;
    }

    public void setAssigneeCount(int assigneeCount) {
        this.assigneeCount = assigneeCount;
    }

    public int getReporterCount() {
        return reporterCount;
    }

    public void setReporterCount(int reporterCount) {
        this.reporterCount = reporterCount;
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

        setAssigneeCount(issueBO.assigneeCount(getId()));
        setReporterCount(issueBO.reporterCount(getId()));

        return SUCCESS;
    }

}
