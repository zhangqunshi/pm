package com.nastation.pm.struts.frontend.issue;

import java.util.List;

import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.IssueTypeBO;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddIssueStep1Action extends ActionSupport {

    @Override
    public String execute() throws Exception {

        ProjectBO projectBO = ProjectBO.getProjectBO();
        List<Projecthbm> projectList = projectBO.getProjectList();
        IssueTypeBO issueTypeBO = IssueTypeBO.getIssueTypeBO();
        List<IssueTypehbm> issueTypeList = issueTypeBO.getIssueTypeList();

        ActionContext cx = ActionContext.getContext();
        cx.put("projs", projectList);
        cx.put("issueTypes", issueTypeList);

        return SUCCESS;
    }

}
