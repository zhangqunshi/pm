package com.nastation.pm.struts.backend.project;

import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.ProjectIssueSequenceBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteProjectAction extends ActionSupport {
    private int projectId;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {
        UserBO userBO = UserBO.getUserBO();
        if (userBO.checkProjectUser(projectId)) {
            userBO.deleteAllProjectUser(projectId);
        }

        // 删除项目中的projectIssueSequence
        ProjectIssueSequenceBO pis = ProjectIssueSequenceBO.getProjectIssueSequenceBO();
        if (pis.checkProjectLinkProjectIssueSequence(projectId)) {
            pis.deleteAllProjectIssueSequence(projectId);
        }

        // 删除项目
        ProjectBO pb = ProjectBO.getProjectBO();
        pb.deleteProject(projectId);
        return SUCCESS;
    }

}
