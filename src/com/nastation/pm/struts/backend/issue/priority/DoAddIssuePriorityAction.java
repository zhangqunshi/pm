package com.nastation.pm.struts.backend.issue.priority;

import com.nastation.pm.beanhbm.IssuePriorityhbm;
import com.nastation.pm.business.IssuePriorityBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddIssuePriorityAction extends ActionSupport {
    private String name;
    private String description;
    private String color;
    private String iconUrl;

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

    @Override
    public String execute() throws Exception {

        IssuePriorityhbm ip = new IssuePriorityhbm();

        ip.setName(getName());
        ip.setDescription(getDescription());
        ip.setPriorityColor(getColor());
        ip.setIconUrl(getIconUrl());

        IssuePriorityBO issuePriorityBO = IssuePriorityBO.getIssuePriorityBO();
        if (!issuePriorityBO.exist(ip)) {
            issuePriorityBO.addIssuePriority(ip);
        } else {
            return ERROR;
        }

        return SUCCESS;
    }

}
