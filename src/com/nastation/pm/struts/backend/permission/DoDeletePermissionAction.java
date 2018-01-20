package com.nastation.pm.struts.backend.permission;

import com.nastation.pm.business.PermissionAssigneeBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeletePermissionAction extends ActionSupport {
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

        PermissionAssigneeBO assigneeBO = PermissionAssigneeBO.getPermissionAssigneeBO();
        assigneeBO.deletePermission(getId());

        return SUCCESS;
    }

}
