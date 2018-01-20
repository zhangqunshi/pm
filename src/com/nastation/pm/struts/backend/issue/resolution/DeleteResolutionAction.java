package com.nastation.pm.struts.backend.issue.resolution;

import java.util.List;

import com.nastation.pm.bean.Resolution;
import com.nastation.pm.beanhbm.Resolutionhbm;
import com.nastation.pm.business.ResolutionBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteResolutionAction extends ActionSupport {
    private int id;
    private int count;
    private String name;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
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

        ResolutionBO rb = ResolutionBO.getResolutionBO();
        Resolutionhbm resolution = rb.getResolution(getId());
        List<Resolution> list = rb.getIssueByLinkIssue(getId());
        setCount(list.size());
        setName(resolution.getName());

        List<Resolutionhbm> resolutionList = rb.getAllResolutions();
        ActionContext cx = ActionContext.getContext();
        cx.put("resolutionList", resolutionList);

        return SUCCESS;
    }

}
