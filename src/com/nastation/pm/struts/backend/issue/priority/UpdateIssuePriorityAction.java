package com.nastation.pm.struts.backend.issue.priority;

import com.nastation.pm.beanhbm.IssuePriorityhbm;
import com.nastation.pm.business.IssuePriorityBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateIssuePriorityAction extends ActionSupport {
    private int id;
    private String name;
    private String description;
    private String iconUrl;
    private String priorityColor;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public String getPriorityColor() {
        return priorityColor;
    }

    public void setPriorityColor(String priorityColor) {
        this.priorityColor = priorityColor;
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

        IssuePriorityBO issuePriorityBO = IssuePriorityBO.getIssuePriorityBO();

        IssuePriorityhbm issuePriority = issuePriorityBO.getIssuePriority(getId());

        setName(issuePriority.getName());
        setDescription(issuePriority.getDescription());
        setIconUrl(issuePriority.getIconUrl());
        setPriorityColor(issuePriority.getPriorityColor());

        return SUCCESS;
    }

}
