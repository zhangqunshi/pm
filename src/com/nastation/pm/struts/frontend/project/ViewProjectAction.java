package com.nastation.pm.struts.frontend.project;

import java.util.List;

import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewProjectAction extends ActionSupport {

    @Override
    public String execute() throws Exception {

        ProjectBO pb = ProjectBO.getProjectBO();
        List<Projecthbm> list = pb.getProjectList();
        ActionContext cx = ActionContext.getContext();
        cx.put("projects", list);

        return SUCCESS;
    }

}
