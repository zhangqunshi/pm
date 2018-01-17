package com.nastation.pm.struts.backend.permission;

import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdatePermissionSchemeAction extends ActionSupport {
    private int schemeId;
    private String name;
    private String desc;

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    @Override
    public String execute() throws Exception {

        PermissionSchemeBO schemeBO = PermissionSchemeBO.getPermissionSchemeBO();
        PermissionSchemehbm scheme = schemeBO.getScheme(getSchemeId());
        setName(scheme.getName());
        setDesc(scheme.getDescription());

        return SUCCESS;
    }

}
