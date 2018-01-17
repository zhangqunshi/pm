package com.nastation.pm.struts.backend.project.user;

import com.nastation.pm.bean.ProjectUser;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.ProjectUserBO;
import com.nastation.pm.business.UserBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddProjectUserAction extends ActionSupport {
    private int projectId;
    private int roleId;
    private String users;

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

    public String getUsers() {
        return users;
    }

    public void setUsers(String users) {
        this.users = users;
    }

    @Override
    public String execute() throws Exception {

        String[] type1 = getUsers().split(",");
        String type = "";

        if (type1 != null) {
            UserBO userBo = new UserBO();
            ProjectUserBO pb = new ProjectUserBO();

            for (int i = 0; i < type1.length; i++) {

                type = type1[i];
                Userhbm user = userBo.getUser(type);

                if (user != null) {
                    ProjectUser projectUser = new ProjectUser();
                    String createTime = StringUtils.toString(new java.util.Date());
                    projectUser.setProjectId(getProjectId());
                    projectUser.setUserId(user.getId());
                    projectUser.setRoleId(getRoleId());
                    projectUser.setCreateDate(createTime);
                    pb.addProjectUser(projectUser);
                }
            }
        }

        return SUCCESS;
    }

}
