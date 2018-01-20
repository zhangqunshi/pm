package com.nastation.pm.struts.backend.project.category;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.beanhbm.ProjectCategoryhbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectCategoryBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewProjectCategoryAction extends ActionSupport {

    @Override
    public String execute() throws Exception {

        ProjectCategoryBO rb = ProjectCategoryBO.getProjectCategoryBO();
        List<ProjectCategoryhbm> list = rb.getCategoryList();
        List<ViewProjectCategory> vpcList = new ArrayList<>();
        if (list != null) {
            for (ProjectCategoryhbm pc : list) {

                if (rb.checkLinkProject(pc.getId())) {
                    List<Projecthbm> list1 = rb.getAllProject(pc.getId());
                    ViewProjectCategory vpc = new ViewProjectCategory(pc.getId(), pc.getName(), pc.getDescription(),
                            list1);
                    vpcList.add(vpc);
                }
            }
        }

        ActionContext cx = ActionContext.getContext();
        cx.put("vpcList", vpcList);

        return SUCCESS;
    }

}
