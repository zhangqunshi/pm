package com.nastation.pm.struts.backend.role;

import com.nastation.pm.beanhbm.Rolehbm;
import com.nastation.pm.business.RoleBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateRoleAction extends ActionSupport {

    private int id;
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
        setDesc(role.getRoleDesc());

        return super.execute();
    }

}
