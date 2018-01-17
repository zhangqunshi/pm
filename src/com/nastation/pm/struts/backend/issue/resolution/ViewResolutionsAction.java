package com.nastation.pm.struts.backend.issue.resolution;

import java.util.List;

import com.nastation.pm.Global;
import com.nastation.pm.beanhbm.Resolutionhbm;
import com.nastation.pm.business.ResolutionBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewResolutionsAction extends ActionSupport {
    private int resolutionDefault;

    public int getResolutionDefault() {
        return resolutionDefault;
    }

    public void setResolutionDefault(int resolutionDefault) {
        this.resolutionDefault = resolutionDefault;
    }

    @Override
    public String execute() throws Exception {

        ResolutionBO bo = ResolutionBO.getResolutionBO();
        List<Resolutionhbm> list = bo.getAllResolutions();

        setResolutionDefault(Global.RESOLUTION_DEFAULT);

        ActionContext cx = ActionContext.getContext();
        cx.put("resolutionList", list);

        return SUCCESS;
    }

}
