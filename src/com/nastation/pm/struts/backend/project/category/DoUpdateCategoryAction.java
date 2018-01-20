package com.nastation.pm.struts.backend.project.category;

import com.nastation.pm.beanhbm.ProjectCategoryhbm;
import com.nastation.pm.business.ProjectCategoryBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateCategoryAction extends ActionSupport {
    private String name;
    private String desc;
    private int id;

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        ProjectCategoryBO rb = ProjectCategoryBO.getProjectCategoryBO();

        if (rb.exists(getName())) {
            return ERROR;
        } else {
            ProjectCategoryhbm category = new ProjectCategoryhbm();
            category.setId(getId());
            category.setName(getName());
            category.setDescription(getDesc());
            rb.updateCategory(category);
        }

        return SUCCESS;

    }

}
