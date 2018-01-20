package com.nastation.pm.struts.backend.project.category;

import com.nastation.pm.business.ProjectCategoryBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteProjectByCategoryAction extends ActionSupport {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        ProjectCategoryBO rb = ProjectCategoryBO.getProjectCategoryBO();

        rb.deleteProjectCategoryForLinkProject(getId());

        return SUCCESS;
    }

}
