package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FilterDetailAction extends ActionSupport {
    private String filterName;
    private String description;

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

    @Override
    public String execute() throws Exception {
        IssueFilter filterDetail = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);

        if (filterDetail != null && filterDetail.isSaved()) {
            setFilterName(filterDetail.getFilterName());
            if (!StringUtils.isBlank(filterDetail.getDescription())) {
                setDescription(filterDetail.getDescription());
            }
        }

        return SUCCESS;
    }

}
