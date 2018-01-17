package com.nastation.pm.struts.backend.issue.type;

import java.util.List;

import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.business.IssueTypeBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewIssueTypeAction extends ActionSupport {

    @Override
    public String execute() throws Exception {

        IssueTypeBO issueTypeBO = IssueTypeBO.getIssueTypeBO();
        List<IssueTypehbm> list = issueTypeBO.getIssueTypeList();

        ActionContext cx = ActionContext.getContext();
        cx.put("issueTypeList", list);

        return SUCCESS;
    }

}
