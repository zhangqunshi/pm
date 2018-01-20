package com.nastation.pm.struts.backend.issue.priority;

import com.nastation.pm.beanhbm.IssuePriorityhbm;
import com.nastation.pm.business.IssuePriorityBO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteIssuePriorityAction extends ActionSupport {
    private int id;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        IssuePriorityBO issuePriorityBO = IssuePriorityBO.getIssuePriorityBO();
        IssuePriorityhbm ip = issuePriorityBO.getIssuePriority(getId());
        String name = ip.getName();
        setName(name);

        return SUCCESS;
    }

}
