package com.nastation.pm.struts.backend.issue.status;

import com.nastation.pm.beanhbm.IssueStatushbm;
import com.nastation.pm.business.IssueStatusBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddIssueStatusAction extends ActionSupport {
    private String name;
    private String description;
    private String filename;

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

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Override
    public String execute() throws Exception {

        IssueStatushbm i = new IssueStatushbm();
        i.setName(getName());
        i.setDescription(getDescription());
        i.setIconUrl(getFilename());
        IssueStatusBO issueStatusBO = IssueStatusBO.getIssueStatusBO();
        if (!issueStatusBO.exist(i)) {
            issueStatusBO.addIssueStatus(i);
        } else {
            return ERROR;
        }

        return SUCCESS;
    }

}
