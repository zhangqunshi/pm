package com.nastation.pm.struts.backend.project.user;

import com.nastation.pm.business.ProjectUserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteProjectUserAction extends ActionSupport {
    private int projectId;
    private int roleId;
    private String allid;

    public String getAllid() {
        return allid;
    }

    public void setAllid(String allid) {
        this.allid = allid;
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

        String[] type = getAllid().split(",");
        for (int i = 0; i < type.length; i++) {

            if (type[i] == null || type[i].equals("")) {
                return ERROR;
            }
            int projectUserId = Integer.parseInt(type[i]);
            ProjectUserBO pb = ProjectUserBO.getProjectUserBO();

            pb.deleteProjectUser(projectUserId);
        }

        return SUCCESS;
    }

}
