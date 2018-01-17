package com.nastation.pm.struts.backend.project;

import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateProjectAction extends ActionSupport {
    private int projectId;
    private String name;
    private String url;
    private String leader;
    private String description;

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

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        Projecthbm project = pb.getProject(getProjectId());
        setName(project.getName());
        setDescription(project.getDescription());
        setLeader(project.getLeader());
        setUrl(project.getUrl());

        return SUCCESS;
    }

}
