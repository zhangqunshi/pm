package com.nastation.pm.struts.backend.issue.status;

import com.nastation.pm.business.IssueStatusBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteIssueStatusAction extends ActionSupport {
    private int IssueStatusId;

    public int getIssueStatusId() {
        return IssueStatusId;
    }

    public void setIssueStatusId(int issueStatusId) {
        IssueStatusId = issueStatusId;
    }

    @Override
    public String execute() throws Exception {
        IssueStatusBO is = IssueStatusBO.getIssueStatusBO();
        is.deleteIssueStatus(getIssueStatusId());

        return SUCCESS;
    }

}
