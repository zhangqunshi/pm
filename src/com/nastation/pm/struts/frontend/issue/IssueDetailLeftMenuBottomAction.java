package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.User;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueDetailLeftMenuBottomAction extends ActionSupport {
    private String action;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isNotBlank(action)) {
            ActionContext.getContext().put("action", getAction());
        }
        Issue issueLCMB = (Issue) ActionContext.getContext().get("issue");
        if (issueLCMB == null) {
            return ERROR;
        }
        User currentUser = (User) ActionContext.getContext().get(Global.SESSION_USER);

        return super.execute();
    }

}
