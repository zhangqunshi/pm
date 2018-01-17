package com.nastation.pm.struts.backend.project.component;

import com.nastation.pm.beanhbm.ProjectComponenthbm;
import com.nastation.pm.business.ProjectComponentBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateProjectComponentAction extends ActionSupport {
    private int idd;
    private int id;
    private String name;
    private String description;
    private String leader;

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

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public int getIdd() {
        return idd;
    }

    public void setIdd(int idd) {
        this.idd = idd;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        ProjectComponentBO pcbo = ProjectComponentBO.getProjectComponentBO();
        ProjectComponenthbm pc = pcbo.getProjectComponent(getIdd());

        setName(pc.getName());
        setDescription(pc.getDescription());
        setLeader(pc.getLeader());

        return SUCCESS;
    }

}
