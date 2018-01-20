package com.nastation.pm.struts.backend.issue.resolution;

import com.nastation.pm.business.ResolutionBO;
import com.opensymphony.xwork2.ActionSupport;

public class MakeDefaultResolutionAction extends ActionSupport {
    private int make;

    public int getMake() {
        return make;
    }

    public void setMake(int make) {
        this.make = make;
    }

    @Override
    public String execute() throws Exception {
        ResolutionBO resolutionBO = ResolutionBO.getResolutionBO();
        resolutionBO.updateResolutionDefault(getMake());

        return SUCCESS;
    }

}
