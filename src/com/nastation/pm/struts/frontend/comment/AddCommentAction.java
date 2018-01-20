package com.nastation.pm.struts.frontend.comment;

import com.nastation.pm.Global;
import com.nastation.pm.PermissionConstants;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.User;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddCommentAction extends ActionSupport {
    private String issueKey;
    private String comment;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isBlank(getComment())) {
            setComment("");
        }

        Issue issueRB = new IssueBO().getIssueDetailByKey(getIssueKey());
        User curUser = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        int projectId = issueRB.getProjectId();
        if (curUser.validate(projectId, PermissionConstants.ADD_COMMENTS)) {
            setFlag(true);
        }

        return SUCCESS;
    }

}
