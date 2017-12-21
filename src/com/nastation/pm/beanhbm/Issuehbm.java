package com.nastation.pm.beanhbm;

public class Issuehbm {

    private int id;
    private String name;
    private String issueKey;
    private java.util.Date createDate;
    private java.util.Date startTime;
    private java.util.Date endTime;
    private java.util.Date planEndTime;
    private java.util.Date lastUpdateDate;
    private Integer resolutionId;
    private Integer componentId;
    private String environment;
    private String description;
    private Userhbm assignee;
    private Userhbm reporter;
    private Projecthbm project;
    private IssueTypehbm issueType;
    private IssuePriorityhbm priorityLevel;
    private IssueStatushbm issueStatus;

    public Projecthbm getProject() {
        return project;
    }

    public void setProject(Projecthbm project) {
        this.project = project;
    }

    public IssueTypehbm getIssueType() {
        return issueType;
    }

    public void setIssueType(IssueTypehbm issueType) {
        this.issueType = issueType;
    }

    public IssuePriorityhbm getPriorityLevel() {
        return priorityLevel;
    }

    public void setPriorityLevel(IssuePriorityhbm priorityLevel) {
        this.priorityLevel = priorityLevel;
    }

    public IssueStatushbm getIssueStatus() {
        return issueStatus;
    }

    public void setIssueStatus(IssueStatushbm issueStatus) {
        this.issueStatus = issueStatus;
    }

    public Userhbm getAssignee() {
        return assignee;
    }

    public void setAssignee(Userhbm assignee) {
        this.assignee = assignee;
    }

    public Userhbm getReporter() {
        return reporter;
    }

    public void setReporter(Userhbm reporter) {
        this.reporter = reporter;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEnvironment() {
        return environment;
    }

    public void setEnvironment(String environment) {
        this.environment = environment;
    }

    public Integer getComponentId() {
        return componentId;
    }

    public void setComponentId(Integer componentId) {
        this.componentId = componentId;
    }

    public Integer getResolutionId() {
        return resolutionId;
    }

    public void setResolutionId(Integer resolutionId) {
        this.resolutionId = resolutionId;
    }

    public java.util.Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(java.util.Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public java.util.Date getPlanEndTime() {
        return planEndTime;
    }

    public void setPlanEndTime(java.util.Date planEndTime) {
        this.planEndTime = planEndTime;
    }

    public java.util.Date getEndTime() {
        return endTime;
    }

    public void setEndTime(java.util.Date endTime) {
        this.endTime = endTime;
    }

    public java.util.Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(java.util.Date createDate) {
        this.createDate = createDate;
    }

    public java.util.Date getStartTime() {
        return startTime;
    }

    public void setStartTime(java.util.Date startTime) {
        this.startTime = startTime;
    }

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
