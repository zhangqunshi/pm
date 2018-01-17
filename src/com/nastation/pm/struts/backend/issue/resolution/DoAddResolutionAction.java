package com.nastation.pm.struts.backend.issue.resolution;

import java.util.List;

import com.nastation.pm.beanhbm.Resolutionhbm;
import com.nastation.pm.business.ResolutionBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddResolutionAction extends ActionSupport {
    private String name;
    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String execute() throws Exception {

        ResolutionBO rb = ResolutionBO.getResolutionBO();
        Resolutionhbm r = new Resolutionhbm();
        List<Resolutionhbm> list = rb.getAllResolutions();
        if (list == null || list.size() <= 0) {
            r.setName(getName());
            r.setDescription(getDescription());
            r.setIsDefault(1);
            rb.addResolution(r);
        } else {
            r.setName(getName());
            r.setDescription(getDescription());
            r.setIsDefault(0);
            if (!rb.checkExistResolution(r)) {
                rb.addResolution(r);
            } else {
                return ERROR;
            }
        }

        return SUCCESS;
    }

}
