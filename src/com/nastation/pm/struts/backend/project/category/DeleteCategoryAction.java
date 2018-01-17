package com.nastation.pm.struts.backend.project.category;

import com.nastation.pm.beanhbm.ProjectCategoryhbm;
import com.nastation.pm.business.ProjectCategoryBO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteCategoryAction extends ActionSupport {
    private int id;
    private String name;

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

        ProjectCategoryBO pcBO = ProjectCategoryBO.getProjectCategoryBO();
        ProjectCategoryhbm pc = pcBO.getProjectCategory(getId());
        setName(pc.getName());

        return SUCCESS;
    }

}
