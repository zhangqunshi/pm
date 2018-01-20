package com.nastation.pm.struts.backend.project.component;

import java.util.List;

import com.nastation.pm.beanhbm.ProjectComponenthbm;
import com.nastation.pm.business.ProjectComponentBO;
import com.opensymphony.xwork2.ActionSupport;

public class ViewComponentsAction extends ActionSupport {
    private int projectId;
    private boolean size;

    public boolean isSize() {
        return size;
    }

    public void setSize(boolean size) {
        this.size = size;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {

        ProjectComponentBO pcbo = ProjectComponentBO.getProjectComponentBO();
        List<ProjectComponenthbm> componentList = pcbo.getProjectComponentList(getProjectId());
        setSize(componentList.size() == 0);

        List<ProjectComponenthbm> componentList2 = pcbo.getProjectComponentList(getProjectId());

        return SUCCESS;
    }

}
