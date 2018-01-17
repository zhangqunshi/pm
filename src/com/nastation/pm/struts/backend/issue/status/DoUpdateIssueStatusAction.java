package com.nastation.pm.struts.backend.issue.status;

import com.nastation.pm.beanhbm.IssueStatushbm;
import com.nastation.pm.business.IssueStatusBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateIssueStatusAction extends ActionSupport {
    private int id;
    private String name;
    private String desc;
    private String filename;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Override
    public String execute() throws Exception {
        IssueStatusBO issueStatusBO = IssueStatusBO.getIssueStatusBO();
        IssueStatushbm issueStatus = issueStatusBO.getIssueStatus(getId());

        issueStatus.setName(issueStatus.getName());
        issueStatus.setDescription(issueStatus.getDescription());
        issueStatus.setIconUrl(issueStatus.getIconUrl());

        if (issueStatusBO.exist(issueStatus)) {
            return ERROR;
        } else {
            issueStatusBO.updateIssueStatus(issueStatus);
        }

        return SUCCESS;
    }

}
