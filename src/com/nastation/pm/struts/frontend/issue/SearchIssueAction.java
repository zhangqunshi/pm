package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.bean.IssueFilter;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SearchIssueAction extends ActionSupport {

    @Override
    public String execute() throws Exception {

        IssueFilter filterLB = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);

        return super.execute();
    }

}
