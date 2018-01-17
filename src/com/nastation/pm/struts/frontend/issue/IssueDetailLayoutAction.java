package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueDetailLayoutAction extends ActionSupport {
    private String issueKey;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    @Override
    public String execute() throws Exception {

        Issue issue = new IssueBO().getIssueDetailByKey(getIssueKey());
        ActionContext.getContext().put("issue", issue);
        if (StringUtils.isBlank(issueKey)) {
            setFlag(true);
        }

        return SUCCESS;
    }

}
