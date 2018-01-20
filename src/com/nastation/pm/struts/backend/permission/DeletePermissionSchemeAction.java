package com.nastation.pm.struts.backend.permission;

import java.util.List;

import com.nastation.pm.bean.Project;
import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.business.PermissionSchemeBO;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeletePermissionSchemeAction extends ActionSupport {
    private int schemeId;
    private String name;
    private String desc;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
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
        ActionContext cx = ActionContext.getContext();
        ProjectBO projectBO = ProjectBO.getProjectBO();
        List<Project> list = projectBO.getProjectListByScheme(getSchemeId());
        if (list.size() > 0) {
            setFlag(true);
            cx.put("project", list);
        }

        return SUCCESS;
    }

}
