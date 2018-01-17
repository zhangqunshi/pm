package com.nastation.pm.struts.backend.project;

import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AupdateProjectAction extends ActionSupport {
    private int projectId;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {
        ProjectBO pb = ProjectBO.getProjectBO();
        Projecthbm project = pb.getProject(getProjectId());
        ActionContext.getContext().put("project", project);
        return SUCCESS;
    }

}
