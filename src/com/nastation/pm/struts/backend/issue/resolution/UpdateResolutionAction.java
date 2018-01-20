package com.nastation.pm.struts.backend.issue.resolution;

import com.nastation.pm.beanhbm.Resolutionhbm;
import com.nastation.pm.business.ResolutionBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateResolutionAction extends ActionSupport {
    private int id;
    private String name;
    private String description;
    private int isDefault;

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

    public int getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(int isDefault) {
        this.isDefault = isDefault;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        ResolutionBO resolutionBO = ResolutionBO.getResolutionBO();
        Resolutionhbm resolution = resolutionBO.getResolution(getId());
        setName(resolution.getName());
        setDescription(resolution.getDescription());
        setIsDefault(resolution.getIsDefault());

        return SUCCESS;
    }

}
