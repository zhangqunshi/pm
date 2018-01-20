package com.nastation.pm.struts.frontend.issue;

import java.util.List;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.beanhbm.IssuePriorityhbm;
import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.beanhbm.ProjectComponenthbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.IssuePriorityBO;
import com.nastation.pm.business.IssueTypeBO;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.ProjectComponentBO;
import com.nastation.pm.business.ProjectUserBO;
import com.nastation.pm.business.UserBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateIssueAction extends ActionSupport {
    private String issueKey;
    private boolean flag;
    private boolean flag2;
    private String issueResolution;
    private boolean issueTypeFlag;

    public boolean isIssueTypeFlag() {
        return issueTypeFlag;
    }

    public void setIssueTypeFlag(boolean issueTypeFlag) {
        this.issueTypeFlag = issueTypeFlag;
    }

    public String getIssueResolution() {
        return issueResolution;
    }

    public void setIssueResolution(String issueResolution) {
        this.issueResolution = issueResolution;
    }

    public boolean isFlag2() {
        return flag2;
    }

    public void setFlag2(boolean flag2) {
        this.flag2 = flag2;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isBlank(issueKey)) {
            setFlag(true);
            return SUCCESS;
        }
        Issue issue = new IssueBO().getIssueDetailByKey(getIssueKey());
        ActionContext cx = ActionContext.getContext();
        cx.put("issue", issue);

        Projecthbm project = new ProjectBO().getProject(issue.getProjectId());
        List<IssuePriorityhbm> issuePriorityList = new IssuePriorityBO().getIssuePriorityList();

        ProjectComponentBO projectComponentBO = ProjectComponentBO.getProjectComponentBO();
        List<ProjectComponenthbm> projectComponentList = projectComponentBO
                .getProjectComponentList(issue.getProjectId());

        Userhbm user = new UserBO().getUser(issue.getReporterId());

        ProjectUserBO projectUserBO = ProjectUserBO.getProjectUserBO();
        List projectUserList = projectUserBO.getProjectUser();

        List<IssueTypehbm> issueTypeList = new IssueTypeBO().getIssueTypeList();

        if (issue.getIssueStatus() == Global.CLOSE || issue.getIssueStatus() == Global.RESOLVED) {
            setFlag2(true);
            setIssueResolution(issue.getResolution());
        }

        cx.put("issueTypeList", issueTypeList);

        return SUCCESS;
    }

}
