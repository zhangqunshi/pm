package com.nastation.pm.struts.backend.issue.priority;

import com.nastation.pm.beanhbm.IssuePriorityhbm;
import com.nastation.pm.business.IssuePriorityBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateIssuePriorityAction extends ActionSupport {
    private String name;
    private String description;
    private String color;
    private String iconUrl;
    private int id;

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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {

        IssuePriorityBO issuePriorityBO = IssuePriorityBO.getIssuePriorityBO();
        IssuePriorityhbm issuePriority = issuePriorityBO.getIssuePriority(getId());

        issuePriority.setName(getName());
        issuePriority.setDescription(getDescription());
        issuePriority.setPriorityColor(getColor());
        issuePriority.setIconUrl(getIconUrl());

        if (issuePriorityBO.exist(issuePriority)) {
            return ERROR;
        } else {
            issuePriorityBO.updateIssuePriority(issuePriority);
        }

        return SUCCESS;
    }

}
