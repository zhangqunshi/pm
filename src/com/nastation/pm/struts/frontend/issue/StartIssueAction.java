package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.beanhbm.Issuehbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.IssueStatusBO;
import com.opensymphony.xwork2.ActionSupport;

public class StartIssueAction extends ActionSupport {
    private String issueKey;
    private String action;

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Override
    public String execute() throws Exception {

        IssueBO ib = IssueBO.getIssueBO();
        Issuehbm issue = ib.getIssueByKey(getIssueKey());
        issue.setIssueStatus(new IssueStatusBO().getIssueStatus(Global.IN_PROGRESS));
        issue.setLastUpdateDate(new java.util.Date());
        ib.updateIssueByLinkStatus(issue);

        return SUCCESS;
    }

}
