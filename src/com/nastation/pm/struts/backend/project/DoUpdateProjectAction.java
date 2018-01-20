package com.nastation.pm.struts.backend.project;

import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateProjectAction extends ActionSupport {
    private int projectId;
    private String name;
    private String url;
    private String lead;
    private String description;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getLead() {
        return lead;
    }

    public void setLead(String lead) {
        this.lead = lead;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String execute() throws Exception {

        ProjectBO pb = ProjectBO.getProjectBO();

        boolean flag = false;

        Projecthbm p = pb.getProject(getProjectId());
        p.setName(getName());
        p.setUrl(getUrl());
        p.setDescription(getDescription());
        p.setLeader(getLead());

        if (pb.existName(p)) {
            return ERROR;
        }
        pb.updateProject(p);

        return SUCCESS;
    }
}
