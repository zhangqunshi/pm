package com.nastation.pm.struts.backend.project.component;

import com.nastation.pm.business.ProjectComponentBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteProjectComponentAction extends ActionSupport {
    private int idd;

    public int getIdd() {
        return idd;
    }

    public void setIdd(int idd) {
        this.idd = idd;
    }

    @Override
    public String execute() throws Exception {

        ProjectComponentBO pb = ProjectComponentBO.getProjectComponentBO();
        pb.deleteProjectComponent(getIdd());
        return SUCCESS;
    }

}
