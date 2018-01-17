package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.business.IssueBO;
import com.opensymphony.xwork2.ActionSupport;

public class IssueNavigatorRAction extends ActionSupport {
    private int projectId;
    private String action;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Override
    public String execute() throws Exception {

        IssueBO issueBO = IssueBO.getIssueBO();

        return super.execute();
    }

}
