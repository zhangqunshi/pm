package com.nastation.pm.struts.backend.project.component;

import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionSupport;

public class AddProjectComponentAction extends ActionSupport {
    private int projectId;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {

        ProjectBO pb = ProjectBO.getProjectBO();
        Projecthbm pc = pb.getProject(getProjectId());
        setName(pc.getName());

        return SUCCESS;
    }

}
