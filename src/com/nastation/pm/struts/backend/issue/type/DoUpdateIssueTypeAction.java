package com.nastation.pm.struts.backend.issue.type;

import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.business.IssueTypeBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateIssueTypeAction extends ActionSupport {
    private String name;
    private String desc;
    private String url;
    private int id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        IssueTypeBO issueTypeBO = IssueTypeBO.getIssueTypeBO();
        IssueTypehbm i = new IssueTypehbm();
        i.setId(getId());
        i.setName(getName());
        i.setDescription(getDesc());
        i.setIconUrl(getUrl());

        if (issueTypeBO.exist(i)) {
            return ERROR;
        } else {
            issueTypeBO.updateIssueType(i);
        }

        return SUCCESS;
    }

}
