package com.nastation.pm.struts.backend.issue.status;

import com.nastation.pm.beanhbm.IssueStatushbm;
import com.nastation.pm.business.IssueStatusBO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteIssueStatusAction extends ActionSupport {
    private int id;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        IssueStatushbm is = issueStatusBO.getIssueStatus(getId());
        String name = is.getName();
        setName(name);

        return SUCCESS;
    }

}
