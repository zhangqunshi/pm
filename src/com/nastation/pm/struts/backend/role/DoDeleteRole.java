package com.nastation.pm.struts.backend.role;

import com.nastation.pm.business.ProjectUserBO;
import com.nastation.pm.business.RoleBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteRole extends ActionSupport {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        RoleBO rb = RoleBO.getRoleBO();
        if (rb.checkRoleByLink(getId())) {
            ProjectUserBO puBo = ProjectUserBO.getProjectUserBO();
            puBo.deleteAllProjectUser(getId());
        }
        rb.deleteRole(getId());

        return SUCCESS;
    }

}
