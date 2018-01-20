package com.nastation.pm.struts.backend.role;

import com.nastation.pm.beanhbm.Rolehbm;
import com.nastation.pm.business.RoleBO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteRoleAction extends ActionSupport {
    private int id;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        RoleBO rb = RoleBO.getRoleBO();
        Rolehbm role = rb.getRole(getId());
        setName(role.getRoleName());

        return SUCCESS;
    }

}
