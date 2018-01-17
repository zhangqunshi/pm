package com.nastation.pm.struts.backend.issue.status;

import com.nastation.pm.beanhbm.IssueStatushbm;
import com.nastation.pm.business.IssueStatusBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateIssueStatusAction extends ActionSupport {
    private int id;
    private String name;
    private String description;
    private String iconUrl;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        IssueStatusBO issueStatusBO = IssueStatusBO.getIssueStatusBO();
        IssueStatushbm issueStatus = issueStatusBO.getIssueStatus(getId());
        setName(issueStatus.getName());
        setDescription(issueStatus.getDescription());
        setIconUrl(issueStatus.getIconUrl());

        return SUCCESS;
    }

}
