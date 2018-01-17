package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.beanhbm.Issuehbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionSupport;

public class CloneIssueDetailsAction extends ActionSupport {
    private String issueName;
    private int issueId;

    public String getIssueName() {
        return issueName;
    }

    public void setIssueName(String issueName) {
        this.issueName = issueName;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    @Override
    public String execute() throws Exception {

        IssueBO bo = IssueBO.getIssueBO();
        Issuehbm oldIssue = bo.getIssue(getIssueId());

        ProjectBO projectBO = ProjectBO.getProjectBO();
        int nextId = projectBO.getProjectIssueMaxId(oldIssue.getProject().getId());
        Projecthbm project = projectBO.getProject(oldIssue.getProject().getId());
        String projectKey = project.getProjectKey();
        String newIssueKey = projectKey + "-" + nextId;

        Issuehbm newIssue = new Issuehbm();
        newIssue.setIssueType(oldIssue.getIssueType());
        newIssue.setName(getIssueName());
        newIssue.setPriorityLevel(oldIssue.getPriorityLevel());
        newIssue.setPlanEndTime(oldIssue.getPlanEndTime());
        newIssue.setComponentId(oldIssue.getComponentId());
        newIssue.setAssignee(oldIssue.getAssignee());
        newIssue.setReporter(oldIssue.getReporter());
        newIssue.setEnvironment(oldIssue.getEnvironment());
        newIssue.setDescription(oldIssue.getDescription());
        newIssue.setProject(oldIssue.getProject());
        newIssue.setCreateDate(new java.util.Date());
        newIssue.setLastUpdateDate(new java.util.Date());
        newIssue.setIssueStatus(oldIssue.getIssueStatus());
        newIssue.setIssueKey(newIssueKey);
        bo.addIssue(newIssue);

        return SUCCESS;
    }

}
