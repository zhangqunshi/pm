package com.nastation.pm.struts.frontend.issue;

import java.util.List;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.ProjectUser;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.ProjectUserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AssigneeAction extends ActionSupport {
    private int issueId;
    private int projId;
    private boolean issueStatus;
    private boolean projUsers;

    public boolean isProjUsers() {
        return projUsers;
    }

    public void setProjUsers(boolean projUsers) {
        this.projUsers = projUsers;
    }

    public boolean isIssueStatus() {
        return issueStatus;
    }

    public void setIssueStatus(boolean issueStatus) {
        this.issueStatus = issueStatus;
    }

    public int getProjId() {
        return projId;
    }

    public void setProjId(int projId) {
        this.projId = projId;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    @Override
    public String execute() throws Exception {

        Issue issue = new IssueBO().getIssueDetail(getIssueId());
        int projectId = issue.getProjectId();
        setProjId(projectId);

        ProjectUserBO projectUserBO = ProjectUserBO.getProjectUserBO();
        List<ProjectUser> projectUsers = projectUserBO.getProjectUserByProjectId(projectId);
        ActionContext cx = ActionContext.getContext();
        if (issue.getIssueStatus() == Global.CLOSE || issue.getIssueStatus() == Global.RESOLVED) {
            setIssueStatus(true);
        }
        if (projectUsers == null || projectUsers.size() == 0) {
            setProjUsers(true);
        } else {
            cx.put("projUsers", projectUsers);
        }

        cx.put("issue", issue);

        return SUCCESS;
    }

}
