package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.beanhbm.Issuehbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionSupport;

public class CloneIssueDetailsdefaultAction extends ActionSupport {
    private String issueKey;
    private String issueName;
    private int issueId;
    private boolean over;

    public boolean isOver() {
        return over;
    }

    public void setOver(boolean over) {
        this.over = over;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    public String getIssueName() {
        return issueName;
    }

    public void setIssueName(String issueName) {
        this.issueName = issueName;
    }

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    @Override
    public String execute() throws Exception {
        IssueBO issueBo = IssueBO.getIssueBO();
        Issuehbm issue = issueBo.getIssueByKey(getIssueKey());
        if (StringUtils.isBlank(getIssueKey())) {
            setOver(true);
        }
        if (issue == null) {
            setOver(true);
        }
        String issueName = "CLONE-" + issue.getName();
        setIssueName(issueName);
        setIssueId(issue.getId());

        return SUCCESS;
    }

}
