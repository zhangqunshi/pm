package com.nastation.pm.struts.backend.role;

import com.nastation.pm.beanhbm.Rolehbm;
import com.nastation.pm.business.RoleBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateRoleAction extends ActionSupport {

    private String name;
    private String desc;
    private int id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
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
        Rolehbm role = new Rolehbm();
        role.setRoleName(getName());
        role.setId(getId());
        role.setRoleName(getName());
        role.setRoleDesc(getDesc());

        if (rb.checkRole(role)) {
            return ERROR;
        }

        rb.updateRole(role);

        return SUCCESS;
    }

}
