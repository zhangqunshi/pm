package com.nastation.pm.struts.frontend.issue;

import java.util.HashMap;
import java.util.Map;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.beanhbm.SearchRequesthbm;
import com.nastation.pm.business.IssueFilterBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DoRenameFilterAction extends ActionSupport {
    private String filterName;
    private String description;
    private String saveName;

    public String getFilterName() {
        return filterName;
    }

    public void setFilterName(String filterName) {
        this.filterName = filterName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSaveName() {
        return saveName;
    }

    public void setSaveName(String saveName) {
        this.saveName = saveName;
    }

    @Override
    public String execute() throws Exception {

        boolean flag = false;
        boolean ud = false;

        if (StringUtils.isNotBlank(getSaveName()) && getSaveName().equals(getFilterName())) {
            ud = true;
        }
        if (getDescription() != null) {
            setDescription(getDescription().trim());
        }

        IssueFilterBO filterBO = IssueFilterBO.getIssueFilterBO();
        if (!ud && filterBO.checkFilterName(getFilterName())) {
            flag = true;
        }

        if (flag) {
            return ERROR;
        }

        IssueFilter filter = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);

        filter.setFilterName(getFilterName());
        filter.setDescription(getDescription());
        SearchRequesthbm sr = new SearchRequesthbm();
        sr.setId(filter.getId());
        sr.setAuthorName(filter.getAuthorName());
        sr.setDescription(filter.getDescription());
        sr.setFilterName(filter.getFilterName());
        sr.setProjectId(filter.getProjectId());
        sr.setRequest_content(filter.getRequestContent());

        filterBO.updateFilterBasicInfo(sr);
        ActionContext.getContext().setSession((Map<String, Object>) new HashMap().put(Global.SESSION_FILTER, filter));

        return SUCCESS;
    }

}
