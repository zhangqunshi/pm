package com.nastation.pm.struts.frontend.issue;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueDetailLeftMenuCenterAction extends ActionSupport {
    private int open;
    private int inProgress;
    private int resolved;
    private int close;
    private int reopen;

    public int getOpen() {
        return open;
    }

    public void setOpen(int open) {
        this.open = open;
    }

    public int getInProgress() {
        return inProgress;
    }

    public void setInProgress(int inProgress) {
        this.inProgress = inProgress;
    }

    public int getResolved() {
        return resolved;
    }

    public void setResolved(int resolved) {
        this.resolved = resolved;
    }

    public int getClose() {
        return close;
    }

    public void setClose(int close) {
        this.close = close;
    }

    public int getReopen() {
        return reopen;
    }

    public void setReopen(int reopen) {
        this.reopen = reopen;
    }

    @Override
    public String execute() throws Exception {
        Issue issueLC = (Issue) ActionContext.getContext().get("issue");
        if (issueLC == null) {
            return SUCCESS;
        }
        HttpServletRequest request = ServletActionContext.getRequest();

        String stop = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='" + request.getContextPath()
                + "/images/icons/bullet_creme.gif' /><b> <a href='stopIssue.jsp?issueKey=" + issueLC.getIssueKey()
                + "&action=forMe'>停止进行</a></b></td></tr>";
        String resolved = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='"
                + request.getContextPath()
                + "/images/icons/bullet_creme.gif' /><b> <a href='commentAssignIssue!default.jsp?issueKey="
                + issueLC.getIssueKey() + "&status=resolved'>解决问题</a></b></td></tr>";
        String start = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='" + request.getContextPath()
                + "/images/icons/bullet_creme.gif' /><b> <a href='startIssue.jsp?issueKey=" + issueLC.getIssueKey()
                + "&action=forMe'>开始进行</a></b></td></tr>";
        String closed = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='"
                + request.getContextPath()
                + "/images/icons/bullet_creme.gif' /><b> <a href='commentAssignIssue!default.jsp?issueKey="
                + issueLC.getIssueKey() + "&status=close'>关闭问题</a></b></td></tr>";
        String reOpened = "<tr><td><img height='8' border='0' align='absmiddle' width='8' src='"
                + request.getContextPath()
                + "/images/icons/bullet_creme.gif' /><b> <a href='commentAssignIssue!default.jsp?issueKey="
                + issueLC.getIssueKey() + "&status=reopen'>恢复开启问题</a></b></td></tr>";

        int issueStatus = issueLC.getIssueStatus();
        List<String> open = new ArrayList<String>();
        open.add(start);
        open.add(closed);
        open.add(resolved);
        String[] progressStatus = { stop, resolved, closed };
        String[] resolvedStatus = { closed, reOpened };

        setOpen(Global.OPEN);
        setInProgress(Global.IN_PROGRESS);
        setResolved(Global.RESOLVED);
        setClose(Global.CLOSE);
        setReopen(Global.REOPEN);

        return SUCCESS;
    }

}
