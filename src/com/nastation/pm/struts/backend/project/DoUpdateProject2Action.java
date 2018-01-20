package com.nastation.pm.struts.backend.project;

import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.ProjectCategoryBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateProject2Action extends ActionSupport {
    private int projectId;
    private int categoryId;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String execute() throws Exception {
        ProjectBO pb = ProjectBO.getProjectBO();
        ProjectCategoryBO pcBO = ProjectCategoryBO.getProjectCategoryBO();
        Projecthbm project = pb.getProject(getProjectId());
        project.setCategory(pcBO.getProjectCategory(categoryId));
        pb.updateProject1(project);

        return SUCCESS;
    }

}
