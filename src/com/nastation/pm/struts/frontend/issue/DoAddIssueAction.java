package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.Global;
import com.nastation.pm.beanhbm.IssuePriorityhbm;
import com.nastation.pm.beanhbm.IssueStatushbm;
import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.beanhbm.Issuehbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.IssuePriorityBO;
import com.nastation.pm.business.IssueStatusBO;
import com.nastation.pm.business.IssueTypeBO;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.UserBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddIssueAction extends ActionSupport {
    private String summary;
    private int projectId;
    private int issueTypeId;
    private int priorityLevelId;
    private int componentId;
    private int developerId;
    private String reporter;
    private String environment;
    private String description;
    private String projectKey;
    private String planEndTime;
    private String issueKeyEncode;

    public String getIssueKeyEncode() {
        return issueKeyEncode;
    }

    public void setIssueKeyEncode(String issueKeyEncode) {
        this.issueKeyEncode = issueKeyEncode;
    }

    public String getPlanEndTime() {
        return planEndTime;
    }

    public void setPlanEndTime(String planEndTime) {
        this.planEndTime = planEndTime;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getIssueTypeId() {
        return issueTypeId;
    }

    public void setIssueTypeId(int issueTypeId) {
        this.issueTypeId = issueTypeId;
    }

    public int getPriorityLevelId() {
        return priorityLevelId;
    }

    public void setPriorityLevelId(int priorityLevelId) {
        this.priorityLevelId = priorityLevelId;
    }

    public int getComponentId() {
        return componentId;
    }

    public void setComponentId(int componentId) {
        this.componentId = componentId;
    }

    public int getDeveloperId() {
        return developerId;
    }

    public void setDeveloperId(int developerId) {
        this.developerId = developerId;
    }

    public String getReporter() {
        return reporter;
    }

    public void setReporter(String reporter) {
        this.reporter = reporter;
    }

    public String getEnvironment() {
        return environment;
    }

    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProjectKey() {
        return projectKey;
    }

    public void setProjectKey(String projectKey) {
        this.projectKey = projectKey;
    }

    @Override
    public String execute() throws Exception {
        Userhbm userD = UserBO.getUserBO().getUser(getDeveloperId());
        Projecthbm proj = ProjectBO.getProjectBO().getProject(getProjectId());
        IssueTypehbm issueType = IssueTypeBO.getIssueTypeBO().getIssueType(getIssueTypeId());
        IssuePriorityhbm issuePriority = new IssuePriorityBO().getIssuePriority(getPriorityLevelId());

        Issuehbm issue = new Issuehbm();
        issue.setIssueType(issueType);
        issue.setName(StringUtils.removeHtmlTag(getSummary()));
        issue.setPriorityLevel(issuePriority);
        issue.setPlanEndTime(StringUtils.parseDate(getPlanEndTime()));
        issue.setComponentId(getComponentId());
        issue.setAssignee(userD);

        Userhbm user = UserBO.getUserBO().getUser(getReporter());
        issue.setReporter(user);
        issue.setEnvironment(StringUtils.removeHtmlTag(getEnvironment()));
        issue.setDescription(StringUtils.removeHtmlTag(getDescription()));
        issue.setProject(proj);
        issue.setCreateDate(new java.util.Date());
        issue.setLastUpdateDate(new java.util.Date());
        IssueStatushbm is = IssueStatusBO.getIssueStatusBO().getIssueStatus(Global.OPEN);
        issue.setIssueStatus(is);

        ProjectBO projectBO = ProjectBO.getProjectBO();
        int nextId = projectBO.getProjectIssueMaxId(getProjectId());
        String issueKey = getProjectKey() + "-" + nextId;
        issue.setIssueKey(issueKey);

        IssueBO issueBO = IssueBO.getIssueBO();
        issueBO.addIssue(issue);

        String issueKeyEncode = java.net.URLEncoder.encode(issueKey, "UTF-8");
        setIssueKeyEncode(issueKeyEncode);

        return SUCCESS;
    }

}
