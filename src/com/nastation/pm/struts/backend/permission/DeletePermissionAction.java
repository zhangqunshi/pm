package com.nastation.pm.struts.backend.permission;

import com.nastation.pm.beanhbm.PermissionAssigneehbm;
import com.nastation.pm.business.PermissionAssigneeBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeletePermissionAction extends ActionSupport {
    private int id;
    private int schemeId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    @Override
    public String execute() throws Exception {

        PermissionAssigneeBO paBO = PermissionAssigneeBO.getPermissionAssigneeBO();
        PermissionAssigneehbm pa = paBO.getPermissionAssignee(id);

        ActionContext cx = ActionContext.getContext();
        cx.put("permissionAssignee", pa);

        return SUCCESS;
    }

}
