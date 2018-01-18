package com.nastation.pm.struts.backend.issue.status;

import java.util.List;

import com.nastation.pm.Global;
import com.nastation.pm.beanhbm.IssueStatushbm;
import com.nastation.pm.business.IssueStatusBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewIssueStatusAction extends ActionSupport {

    private int open;
    private int close;
    private int inProgress;
    private int reopen;
    private int resolved;

    public int getOpen() {
        return open;
    }

    public void setOpen(int open) {
        this.open = open;
    }

    public int getClose() {
        return close;
    }

    public void setClose(int close) {
        this.close = close;
    }

    public int getInProgress() {
        return inProgress;
    }

    public void setInProgress(int inProgress) {
        this.inProgress = inProgress;
    }

    public int getReopen() {
        return reopen;
    }

    public void setReopen(int reopen) {
        this.reopen = reopen;
    }

    public int getResolved() {
        return resolved;
    }

    public void setResolved(int resolved) {
        this.resolved = resolved;
    }

    @Override
    public String execute() throws Exception {

        setOpen(Global.OPEN);
        setClose(Global.CLOSE);
        setInProgress(Global.IN_PROGRESS);
        setReopen(Global.REOPEN);
        setResolved(Global.RESOLVED);

        IssueStatusBO issueStatusBO = IssueStatusBO.getIssueStatusBO();
        List<IssueStatushbm> list = issueStatusBO.getIssueStatusList();
        ActionContext cx = ActionContext.getContext();
        cx.put("issueStatus", list);

        return SUCCESS;
    }

}
