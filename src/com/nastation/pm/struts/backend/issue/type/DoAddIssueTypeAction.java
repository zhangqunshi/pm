package com.nastation.pm.struts.backend.issue.type;

import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.business.IssueTypeBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddIssueTypeAction extends ActionSupport {
    private String name;
    private String description;
    private String iconurl;

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

    public String getIconurl() {
        return iconurl;
    }

    public void setIconurl(String iconurl) {
        this.iconurl = iconurl;
    }

    @Override
    public String execute() throws Exception {

        IssueTypeBO issueTypeBO = IssueTypeBO.getIssueTypeBO();
        IssueTypehbm i = new IssueTypehbm();
        i.setName(getName());
        i.setDescription(getDescription());
        i.setIconUrl(getIconurl());
        i.setCreateDate(new java.util.Date());
        if (issueTypeBO.checkIssueType(i)) {
            issueTypeBO.addIssueType(i);
        } else {
            return ERROR;
        }

        return SUCCESS;
    }

}
