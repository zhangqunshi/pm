package com.nastation.pm.struts.backend.issue.priority;

import java.util.List;

import com.nastation.pm.beanhbm.IssuePriorityhbm;
import com.nastation.pm.business.IssuePriorityBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewIssuePriorityAction extends ActionSupport {

    @Override
    public String execute() throws Exception {

        IssuePriorityBO issuePriorityBO = IssuePriorityBO.getIssuePriorityBO();
        List<IssuePriorityhbm> list = issuePriorityBO.getIssuePriorityList();
        ActionContext cx = ActionContext.getContext();
        cx.put("issuePriorityList", list);

        return SUCCESS;
    }

}
