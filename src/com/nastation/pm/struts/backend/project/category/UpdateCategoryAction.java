package com.nastation.pm.struts.backend.project.category;

import com.nastation.pm.beanhbm.ProjectCategoryhbm;
import com.nastation.pm.business.ProjectCategoryBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateCategoryAction extends ActionSupport {
    private int id;
    private String name;
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        ProjectCategoryBO rb = ProjectCategoryBO.getProjectCategoryBO();
        ProjectCategoryhbm category = rb.getProjectCategory(getId());
        setName(category.getName());
        setDescription(category.getDescription());

        return SUCCESS;
    }

}
