package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueDetailLeftMenuTopAction extends ActionSupport {
    private boolean flag;
    private boolean resolution;

    public boolean isResolution() {
        return resolution;
    }

    public void setResolution(boolean resolution) {
        this.resolution = resolution;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String execute() throws Exception {
        Issue issueLT = (Issue) ActionContext.getContext().get("issue");

        UserBO ubo = UserBO.getUserBO();
        Userhbm user = ubo.getUser("username");

        if (issueLT == null) {
            setFlag(true);
            return SUCCESS;
        }

        if (issueLT.getIssueStatus() == Global.CLOSE || issueLT.getIssueStatus() == Global.RESOLVED) {
            setResolution(true);
        }

        ActionContext.getContext().put("issue", issueLT);

        return SUCCESS;
    }

}
