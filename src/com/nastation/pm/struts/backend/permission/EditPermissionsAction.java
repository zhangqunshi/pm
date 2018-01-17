package com.nastation.pm.struts.backend.permission;

import java.util.HashMap;
import java.util.List;

import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionAssigneeBO;
import com.nastation.pm.business.PermissionBO;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionSupport;

public class EditPermissionsAction extends ActionSupport {
    private int schemeId;
    private String name;

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
        PermissionAssigneeBO paBO = PermissionAssigneeBO.getPermissionAssigneeBO();
        PermissionBO pBO = PermissionBO.getPermissionBO();
        HashMap<String, List> hm = pBO.getAllTypeList(getSchemeId());

        setName(scheme.getName());

        return SUCCESS;
    }

}
