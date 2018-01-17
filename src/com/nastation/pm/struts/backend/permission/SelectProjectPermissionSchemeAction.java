package com.nastation.pm.struts.backend.permission;

import java.util.List;

import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SelectProjectPermissionSchemeAction extends ActionSupport {
    private int projectId;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {

        PermissionSchemeBO psBO = PermissionSchemeBO.getPermissionSchemeBO();
        List<PermissionSchemehbm> list = psBO.getSchemeList();
        ActionContext cx = ActionContext.getContext();
        cx.put("psList", list);

        return SUCCESS;
    }

}
