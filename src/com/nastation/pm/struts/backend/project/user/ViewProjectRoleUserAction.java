package com.nastation.pm.struts.backend.project.user;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.ProjectUser;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.ProjectUserBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class ViewProjectRoleUserAction extends ActionSupport {
    private int projectId;
    private int roleId;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
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
        UserBO userBo = UserBO.getUserBO();
        ProjectUserBO projectUserBo = ProjectUserBO.getProjectUserBO();
        List<ProjectUser> projectUserList2 = projectUserBo.getProjectUserByProjectIdRoleId(getProjectId(), getRoleId());
        setFlag(projectUserList2 == null || projectUserList2.size() == 0);
        List<ProjectUser> puList = new ArrayList<>();

        if (projectUserList2 != null || projectUserList2.size() >= 1) {
            for (ProjectUser projectUser2 : projectUserList2) {
                Userhbm u = new Userhbm();
                u = userBo.getUser(projectUser2.getProjectId());
                ProjectUser projectUser3 = projectUserBo.getProjectUser5(getProjectId(), getRoleId(),
                        projectUser2.getProjectId());
                projectUser3.setUsername(u.getName());

                puList.add(projectUser3);
            }
        }

        return super.execute();
    }

}
