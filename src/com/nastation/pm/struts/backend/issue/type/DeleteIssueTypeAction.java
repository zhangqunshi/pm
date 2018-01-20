package com.nastation.pm.struts.backend.issue.type;

import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.business.IssueTypeBO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteIssueTypeAction extends ActionSupport {
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

        IssueTypeBO issueTypeBO = IssueTypeBO.getIssueTypeBO();
        IssueTypehbm issueType = issueTypeBO.getIssueType(getId());
        setName(issueType.getName());

        return SUCCESS;
    }

}
