package com.nastation.pm.struts.frontend.issue;

import java.util.List;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.User;
import com.nastation.pm.business.IssueBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueForMeAction extends ActionSupport {
    private int issueListSize;
    private boolean flag;
    private boolean flag2;

    public boolean isFlag2() {
        return flag2;
    }

    public void setFlag2(boolean flag2) {
        this.flag2 = flag2;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public int getIssueListSize() {
        return issueListSize;
    }

    public void setIssueListSize(int issueListSize) {
        this.issueListSize = issueListSize;
    }

    @Override
    public String execute() throws Exception {
        User currentUser = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        int id = currentUser.getId();
        IssueBO issueBO = IssueBO.getIssueBO();
        List<Issue> issueList = issueBO.getIssueListByAssigneeId(id);

        if (issueList != null) {
            setIssueListSize(issueList.size());
            if (issueList.size() < 10) {
                setFlag(true);
            }
        }
        if (issueList != null && issueList.size() > 0) {
            setFlag2(true);
        }

        ActionContext.getContext().put("issue", issueList);

        return SUCCESS;
    }

}
