package com.nastation.pm.struts.frontend.issue;

import java.util.HashMap;
import java.util.Map;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.business.IssueFilterBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueNavigatorAction extends ActionSupport {
    private int filterId;
    private String mode;
    private String createNew;
    private String action;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public int getFilterId() {
        return filterId;
    }

    public void setFilterId(int filterId) {
        this.filterId = filterId;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getCreateNew() {
        return createNew;
    }

    public void setCreateNew(String createNew) {
        this.createNew = createNew;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isNotBlank(getAction())) {
            ActionContext.getContext().getSession().remove(Global.SESSION_FILTER);
        }
        if (StringUtils.isNotBlank(getFilterId() + "")) {
            IssueFilterBO filterBO = IssueFilterBO.getIssueFilterBO();
            IssueFilter issueF = filterBO.getFilterById(getFilterId());
            ActionContext.getContext()
                    .setSession((Map<String, Object>) new HashMap().put(Global.SESSION_FILTER, issueF));
        }
        if ("true".equals(getCreateNew())) {
            ActionContext.getContext().getSession().remove(Global.SESSION_FILTER);
        }

        if ("show".equals(getMode()) || "true".equals(getCreateNew())) {
            setFlag(true);
        }

        return SUCCESS;
    }

}
