package com.nastation.pm.struts.backend.project;

import com.nastation.pm.bean.Project;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddProjectAction extends ActionSupport {
    private String name;
    private String projectKey;
    private String url;
    private String lead;
    private String description;
    private int permission_scheme_id;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProjectKey() {
        return projectKey;
    }

    public void setProjectKey(String projectKey) {
        this.projectKey = projectKey;
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

    public int getPermission_scheme_id() {
        return permission_scheme_id;
    }

    public void setPermission_scheme_id(int permission_scheme_id) {
        this.permission_scheme_id = permission_scheme_id;
    }

    @Override
    public String execute() throws Exception {

        boolean flag = false;
        ProjectBO pb = ProjectBO.getProjectBO();
        UserBO user = UserBO.getUserBO();
        Project project = new Project();
        project.setName(getName());
        projectKey = getProjectKey().toUpperCase();
        project.setProjectKey(projectKey);
        project.setUrl(getUrl());
        project.setDescription(getDescription());
        project.setLeader(getLead());
        project.setPermissionSchemeId(getPermission_scheme_id());

        Projecthbm phbm = new Projecthbm();
        phbm.setName(getName());
        phbm.setProjectKey(projectKey);

        boolean existName = pb.existName(phbm);
        boolean existKey = pb.existKey(phbm);
        if (!user.exist(getLead())) {
            flag = true;
        }
        if (existName) {
            flag = true;
        }
        if (existKey) {
            flag = true;
        }

        if (flag) {
            return ERROR;
        }

        pb.addProject(project);
        int id = pb.getProjectId(getName());
        setId(id);

        return SUCCESS;
    }
}
