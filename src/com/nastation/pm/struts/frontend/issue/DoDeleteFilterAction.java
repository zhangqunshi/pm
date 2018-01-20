package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.business.IssueFilterBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteFilterAction extends ActionSupport {
    private int fileterId;

    public int getFileterId() {
        return fileterId;
    }

    public void setFileterId(int fileterId) {
        this.fileterId = fileterId;
    }

    @Override
    public String execute() throws Exception {
        IssueFilterBO bo = IssueFilterBO.getIssueFilterBO();
        bo.deleteFilter(getFileterId());

        return SUCCESS;
    }

}
