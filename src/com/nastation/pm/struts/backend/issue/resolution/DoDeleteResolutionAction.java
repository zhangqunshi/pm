package com.nastation.pm.struts.backend.issue.resolution;

import java.util.List;

import com.nastation.pm.bean.Resolution;
import com.nastation.pm.beanhbm.Resolutionhbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.ResolutionBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoDeleteResolutionAction extends ActionSupport {
    private int id;
    private int newId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNewId() {
        return newId;
    }

    public void setNewId(int newId) {
        this.newId = newId;
    }

    @Override
    public String execute() throws Exception {

        ResolutionBO rb = ResolutionBO.getResolutionBO();
        Resolutionhbm resolution = rb.getResolution(getId());
        List<Resolution> list = rb.getIssueByLinkIssue(getId());
        if (list == null || list.size() <= 0) {
            rb.deleteResolution(getId());
        } else {
            IssueBO ib = IssueBO.getIssueBO();
            ib.updateIssueByResolution(getId(), getNewId());
            rb.deleteResolution(getId());
        }

        return SUCCESS;
    }

}
