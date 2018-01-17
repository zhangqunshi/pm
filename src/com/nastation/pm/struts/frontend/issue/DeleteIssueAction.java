package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.business.IssueBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteIssueAction extends ActionSupport {
    private int issueId;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    @Override
    public String execute() throws Exception {

        Issue issue = new IssueBO().getIssueDetail(getIssueId());
        if (issue.getIssueStatus() == Global.CLOSE || issue.getIssueStatus() == Global.RESOLVED) {
            setFlag(true);
        }

        ActionContext cx = ActionContext.getContext();
        cx.put("issue", issue);

        return SUCCESS;
    }

}
