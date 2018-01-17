package com.nastation.pm.struts.backend.project.component;

import com.nastation.pm.beanhbm.ProjectComponenthbm;
import com.nastation.pm.business.ProjectComponentBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateProjectComponentAction extends ActionSupport {
    private String name;
    private String description;
    private String lead;
    private int projectId;
    private int idd;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLead() {
        return lead;
    }

    public void setLead(String lead) {
        this.lead = lead;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getIdd() {
        return idd;
    }

    public void setIdd(int idd) {
        this.idd = idd;
    }

    @Override
    public String execute() throws Exception {

        ProjectComponentBO pcbo = ProjectComponentBO.getProjectComponentBO();
        UserBO userbo = UserBO.getUserBO();
        ProjectComponenthbm pc = pcbo.getProjectComponent(getIdd());
        pc.setName(getName());
        pc.setDescription(getDescription());
        pc.setLeader(getLead());

        if (!pcbo.checkProjectComponent(pc)) {
            return ERROR;
        } else if (!userbo.exist(getLead())) {
            return ERROR;
        } else {
            pcbo.updateProjectComponent(pc);
        }

        return SUCCESS;
    }

}
