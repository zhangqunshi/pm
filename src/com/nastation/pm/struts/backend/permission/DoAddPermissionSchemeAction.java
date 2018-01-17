package com.nastation.pm.struts.backend.permission;

import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddPermissionSchemeAction extends ActionSupport {
    private String name;
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception {

        PermissionSchemeBO schemeBO = PermissionSchemeBO.getPermissionSchemeBO();
        if (schemeBO.exist(getName())) {
            return ERROR;
        } else {
            PermissionSchemehbm p = new PermissionSchemehbm();
            p.setName(getName());
            p.setDescription(getDescription());
            schemeBO.addPermissionScheme(p);
        }

        return SUCCESS;
    }

}
