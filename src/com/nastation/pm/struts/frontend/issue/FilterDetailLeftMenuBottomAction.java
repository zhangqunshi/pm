package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FilterDetailLeftMenuBottomAction extends ActionSupport {
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String execute() throws Exception {
        IssueFilter filterOperation = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);
        if (filterOperation != null && filterOperation.isSaved()) {
            setFlag(true);
        }

        return SUCCESS;
    }

}
