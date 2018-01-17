package com.nastation.pm.struts.backend.project;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ADetailProjectAction extends ActionSupport {
    private int projectId;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {
        ActionContext.getContext().put("projectId", getProjectId());
        return SUCCESS;
    }

}
