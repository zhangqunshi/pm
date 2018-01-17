package com.nastation.pm.struts.backend.issue.type;

import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.business.IssueTypeBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateIssueTypeAction extends ActionSupport {
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

        IssueTypeBO issueTypeBO = IssueTypeBO.getIssueTypeBO();
        IssueTypehbm issueType = issueTypeBO.getIssueType(getId());
        setName(issueType.getName());
        setDescription(issueType.getDescription());
        setIconUrl(issueType.getIconUrl());

        return SUCCESS;
    }

}
