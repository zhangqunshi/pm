package com.nastation.pm.struts.backend.permission;

import java.util.List;

import com.nastation.pm.bean.Project;
import com.nastation.pm.business.PermissionAssigneeBO;
import com.nastation.pm.business.PermissionSchemeBO;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeletePermissionSchemeAction extends ActionSupport {
    private int schemeId;

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    @Override
    public String execute() throws Exception {

        ProjectBO projectBO = ProjectBO.getProjectBO();
        List<Project> list = projectBO.getProjectListByScheme(getSchemeId());
        if (list.size() > 0) {
            for (Project project : list) {
                projectBO.changeScheme(project.getProjectId(), 1);
            }
        }

        PermissionAssigneeBO paBO = PermissionAssigneeBO.getPermissionAssigneeBO();
        paBO.deleteSchemePermission(getSchemeId());
        PermissionSchemeBO schemeBO = PermissionSchemeBO.getPermissionSchemeBO();
        schemeBO.deletePermissionScheme(getSchemeId());

        return SUCCESS;
    }

}
