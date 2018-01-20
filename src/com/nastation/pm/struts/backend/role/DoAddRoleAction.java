package com.nastation.pm.struts.backend.role;

import com.nastation.pm.beanhbm.Rolehbm;
import com.nastation.pm.business.RoleBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddRoleAction extends ActionSupport {
    private String name;
    private String desc;

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

    @Override
    public String execute() throws Exception {

        RoleBO rb = RoleBO.getRoleBO();
        Rolehbm role = new Rolehbm();
        role.setRoleName(name);
        role.setRoleDesc(desc);
        role.setCreateDate(new java.util.Date());

        if (!rb.checkRole(role)) {
            rb.addRole(role);
            return SUCCESS;
        }

        return ERROR;

    }
}
