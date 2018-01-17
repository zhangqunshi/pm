package com.nastation.pm.struts.backend.permission;

import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdatePermissionSchemeAction extends ActionSupport {
    private int schemeId;
    private String name;
    private String description;

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String execute() throws Exception {

        PermissionSchemeBO schemeBO = PermissionSchemeBO.getPermissionSchemeBO();
        if (schemeBO.exist(getName()) && schemeBO.getId(getName()) != getSchemeId()) {
            return ERROR;
        } else {
            PermissionSchemehbm scheme = schemeBO.getScheme(getSchemeId());
            scheme.setDescription(getDescription());
            scheme.setName(getName());
            schemeBO.updatePermissionScheme(scheme);
        }

        return SUCCESS;
    }

}
