package com.nastation.pm.struts.backend.project.user;

import com.nastation.pm.bean.ProjectUser;
import com.nastation.pm.business.ProjectUserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateProjectUserAction extends ActionSupport {
    private int projectId;
    private int userId;
    private int roleId;
    private int projectUserId;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getProjectUserId() {
        return projectUserId;
    }

    public void setProjectUserId(int projectUserId) {
        this.projectUserId = projectUserId;
    }

    @Override
    public String execute() throws Exception {
        ProjectUserBO pub = ProjectUserBO.getProjectUserBO();
        ProjectUser projectUser = new ProjectUser();
        projectUser.setProjectUserId(getProjectUserId());
        projectUser.setUserId(getUserId());
        projectUser.setRoleId(getRoleId());
        projectUser.setProjectId(getProjectId());

        return SUCCESS;
    }

}
