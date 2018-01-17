package com.nastation.pm.struts.backend.issue.type;

import com.nastation.pm.business.IssueTypeBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteIssueTypeAction extends ActionSupport {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        IssueTypeBO ib = IssueTypeBO.getIssueTypeBO();
        ib.deleteIssueType(getId());

        return SUCCESS;
    }

}
