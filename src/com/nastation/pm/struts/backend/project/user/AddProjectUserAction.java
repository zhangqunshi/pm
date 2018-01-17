package com.nastation.pm.struts.backend.project.user;

import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.beanhbm.Rolehbm;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.RoleBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionSupport;

public class AddProjectUserAction extends ActionSupport {
    private int projectId;
    private int roleId;
    private String roleName;
    private String projectName;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isBlank(getProjectId() + "")) {
            setFlag(true);
            return SUCCESS;
        }
        if (StringUtils.isBlank(getRoleId() + "")) {
            setFlag(true);
            return SUCCESS;
        }

        ProjectBO projectbo = ProjectBO.getProjectBO();
        Projecthbm project = projectbo.getProject(getProjectId());
        RoleBO rb = RoleBO.getRoleBO();
        Rolehbm role = rb.getRole(getRoleId());

        setProjectName(project.getName());
        setRoleName(role.getRoleName());

        return SUCCESS;
    }

}
