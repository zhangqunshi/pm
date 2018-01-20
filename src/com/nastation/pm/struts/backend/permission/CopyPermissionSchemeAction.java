package com.nastation.pm.struts.backend.permission;

import java.util.List;

import com.nastation.pm.beanhbm.PermissionAssigneehbm;
import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionAssigneeBO;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionSupport;

public class CopyPermissionSchemeAction extends ActionSupport {
    private int schemeId;

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    @Override
    public String execute() throws Exception {

        PermissionSchemeBO psBO = PermissionSchemeBO.getPermissionSchemeBO();
        PermissionSchemehbm ps = psBO.getScheme(getSchemeId());
        String rename = psBO.renameScheme(ps.getName());
        ps.setName(rename);
        psBO.addPermissionScheme(ps);
        int id = psBO.getId(rename);
        PermissionAssigneeBO paBO = PermissionAssigneeBO.getPermissionAssigneeBO();
        List<PermissionAssigneehbm> list = paBO.getAllPermissionAssignee(getSchemeId());
        paBO.addAllPermissionAssignee(list, id);

        return SUCCESS;
    }

}
