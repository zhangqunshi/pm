package com.nastation.pm.struts.backend.permission;

import java.util.List;

import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionSupport;

public class ViewPermissionSchemesAction extends ActionSupport {

    @Override
    public String execute() throws Exception {

        PermissionSchemeBO permissionSchemeBO = PermissionSchemeBO.getPermissionSchemeBO();
        List<PermissionSchemehbm> schemeList = permissionSchemeBO.getSchemeList();

        return SUCCESS;
    }

}
