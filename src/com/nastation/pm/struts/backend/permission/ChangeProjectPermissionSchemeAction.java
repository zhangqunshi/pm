package com.nastation.pm.struts.backend.permission;

import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionSupport;

public class ChangeProjectPermissionSchemeAction extends ActionSupport {
    private int projectId;
    private int schemeId;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    @Override
    public String execute() throws Exception {

        ProjectBO projectBO = ProjectBO.getProjectBO();
        projectBO.changeScheme(getProjectId(), getSchemeId());

        return SUCCESS;
    }

}
