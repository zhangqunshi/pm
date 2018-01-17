package com.nastation.pm.struts.backend.project.user;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteProjectUserAction extends ActionSupport {
    private int projectUserId;

    public int getProjectUserId() {
        return projectUserId;
    }

    public void setProjectUserId(int projectUserId) {
        this.projectUserId = projectUserId;
    }

}
