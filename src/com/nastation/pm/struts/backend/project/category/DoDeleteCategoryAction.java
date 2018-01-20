package com.nastation.pm.struts.backend.project.category;

import com.nastation.pm.beanhbm.ProjectCategoryhbm;
import com.nastation.pm.business.ProjectCategoryBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteCategoryAction extends ActionSupport {
    private int id;
    private String name;
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
        boolean flag = rb.checkLinkProject(getId());
        setFlag(flag);
        if (flag) {
            setName(category.getName());
            return ERROR;
        } else {
            rb.deleteCategory(getId());
        }

        return SUCCESS;
    }

}
