package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.bean.Issue;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueDetailLeftMenuCenterAction extends ActionSupport {

    @Override
    public String execute() throws Exception {
        Issue issueLC = (Issue) ActionContext.getContext().get("issue");
        if (issueLC == null) {
            return ERROR;
        }

        return super.execute();
    }

}
