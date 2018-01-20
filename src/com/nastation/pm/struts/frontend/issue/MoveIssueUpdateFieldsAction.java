package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.beanhbm.Issuehbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.IssueTypeBO;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MoveIssueUpdateFieldsAction extends ActionSupport {
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String execute() throws Exception {

        Issue newIssue = (Issue) ActionContext.getContext().getSession().get("moveIssue");

        if (newIssue == null) {
            setFlag(true);
            return SUCCESS;
        }

        IssueBO issueBo = IssueBO.getIssueBO();
        Issuehbm oldIssue = issueBo.getIssueByKey(newIssue.getIssueKey());

        ProjectBO projectBo = ProjectBO.getProjectBO();
        Projecthbm project = oldIssue.getProject();

        IssueTypeBO issueTypeBo = IssueTypeBO.getIssueTypeBO();
        IssueTypehbm issueType = oldIssue.getIssueType();

        ActionContext cx = ActionContext.getContext();
        cx.put("proj", project);
        cx.put("issueType", issueType);
        cx.put("issue", newIssue);

        return SUCCESS;
    }

}
