package com.nastation.pm.struts.backend.project.category;

import java.util.List;

import com.nastation.pm.beanhbm.ProjectCategoryhbm;
import com.nastation.pm.business.ProjectCategoryBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewProjectCategoryForProjectAction extends ActionSupport {
    private int projectId;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {

        ProjectCategoryBO rb = ProjectCategoryBO.getProjectCategoryBO();
        List<ProjectCategoryhbm> list = rb.getCategoryList();
        ActionContext cx = ActionContext.getContext();
        cx.put("pcList", list);

        return SUCCESS;
    }

}
