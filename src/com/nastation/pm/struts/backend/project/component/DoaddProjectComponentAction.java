package com.nastation.pm.struts.backend.project.component;

import com.nastation.pm.beanhbm.ProjectComponenthbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.ProjectComponentBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoaddProjectComponentAction extends ActionSupport {
    private String name;
    private String description;
    private String leader;
    private int projectId;

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

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {

        ProjectBO pBO = ProjectBO.getProjectBO();
        ProjectComponentBO pcbo = ProjectComponentBO.getProjectComponentBO();
        UserBO userbo = new UserBO();
        Projecthbm phbm = pBO.getProject(getProjectId());
        ProjectComponenthbm p = new ProjectComponenthbm();
        p.setProject(phbm);
        p.setName(getName());
        p.setDescription(getDescription());
        p.setLeader(getLeader());

        if (!pcbo.checkProjectComponent(p)) {
            return ERROR;
        } else if (!userbo.exist(getLeader())) {
            return ERROR;
        } else {
            pcbo.addProjectComponent(p);

        }
        return SUCCESS;
    }

}
