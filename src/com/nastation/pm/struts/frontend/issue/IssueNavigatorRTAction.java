package com.nastation.pm.struts.frontend.issue;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueNavigatorRTAction extends ActionSupport {
    private String createNew;
    private boolean flag;
    private boolean flag2;
    private int issueListSize;

    public int getIssueListSize() {
        return issueListSize;
    }

    public void setIssueListSize(int issueListSize) {
        this.issueListSize = issueListSize;
    }

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

    public String getCreateNew() {
        return createNew;
    }

    public void setCreateNew(String createNew) {
        this.createNew = createNew;
    }

    @Override
    public String execute() throws Exception {

        if ("true".equals(getCreateNew())) {
            setFlag(true);
        } else {
            List issueListInPage = (List) ServletActionContext.getPageContext().getAttribute("issueList");
            if (issueListInPage == null || issueListInPage.size() == 0) {
                setFlag2(true);
            } else {
                setIssueListSize(issueListInPage.size());
            }

        }

        IssueFilter temp = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);

        return SUCCESS;
    }

}
