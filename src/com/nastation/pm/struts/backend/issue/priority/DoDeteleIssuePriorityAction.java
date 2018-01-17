package com.nastation.pm.struts.backend.issue.priority;

import com.nastation.pm.business.IssuePriorityBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeteleIssuePriorityAction extends ActionSupport {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        IssuePriorityBO ipb = IssuePriorityBO.getIssuePriorityBO();
        ipb.deleteIssuePriority(getId());

        return SUCCESS;
    }

}
