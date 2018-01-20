package com.nastation.pm.struts.frontend.issue;

import java.util.HashMap;
import java.util.Map;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.SearchRequesthbm;
import com.nastation.pm.business.FilterSummaryBO;
import com.nastation.pm.business.IssueFilterBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DoSaveAsFilterActionSupport extends ActionSupport {
    private String newfilterName;
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNewfilterName() {
        return newfilterName;
    }

    public void setNewfilterName(String newfilterName) {
        this.newfilterName = newfilterName;
    }

    @Override
    public String execute() throws Exception {

        boolean flag = false;
        IssueFilter filter = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);
        if (filter == null) {
            flag = true;
        }
        IssueFilterBO filterBO = IssueFilterBO.getIssueFilterBO();
        if (filterBO.checkFilterName(getNewfilterName())) {
            flag = true;
        }
        if (flag) {
            return ERROR;
        }

        User user = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        filter.setAuthorName(user.getName());
        filter.setDescription(getDescription());
        filter.setFilterName(getNewfilterName().trim());
        SearchRequesthbm sr = new SearchRequesthbm();
        sr.setId(filter.getId());
        sr.setAuthorName(filter.getAuthorName());
        sr.setDescription(filter.getDescription());
        sr.setFilterName(filter.getFilterName());
        sr.setRequest_content(filter.getRequestContent());
        sr.setProjectId(filter.getProjectId());
        filterBO.addFilter(sr);

        IssueFilter savedFilter = filterBO.getFilter(getNewfilterName());

        if (savedFilter != null) {
            filter.setId(savedFilter.getId());

            IssueFilterBO issueFilterBO = IssueFilterBO.getIssueFilterBO();
            issueFilterBO.addFilterParameterValues(savedFilter.getId(), filter.getParamValues());

            FilterSummaryBO filterSummaryBO = FilterSummaryBO.getFilterSummaryBO();
            filterSummaryBO.addFilterSummary(filter.getItem(), savedFilter.getId());

            ActionContext.getContext()
                    .setSession((Map<String, Object>) new HashMap().put(Global.SESSION_FILTER, filter));

        }

        return SUCCESS;
    }

}
