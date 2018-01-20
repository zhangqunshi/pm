package com.nastation.pm.struts.backend.project.category;

import com.nastation.pm.beanhbm.ProjectCategoryhbm;
import com.nastation.pm.business.ProjectCategoryBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddProjectCategoryAction extends ActionSupport {
    private String name;
    private String desc;

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

    @Override
    public String execute() throws Exception {

        ProjectCategoryBO pb = ProjectCategoryBO.getProjectCategoryBO();
        ProjectCategoryhbm p = new ProjectCategoryhbm();
        p.setName(getName());
        p.setDescription(getDesc());

        if (pb.checkProjectCategory(p)) {
            pb.addProjectCategory(p);
            return SUCCESS;
        }
        return ERROR;
    }
}
