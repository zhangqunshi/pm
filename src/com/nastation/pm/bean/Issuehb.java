package com.nastation.pm.bean;

public class Issuehb {

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
	private User assigneeId;
	private User reporterId;
	private Project projectId;
	private IssueType issueTypeId;
	private IssuePriority priorityLevelId;
	private IssueStatus issueStatus;
	private String issueStatusName;
	private String projectName;
	private String issueTypeName;

	public Issuehb() {

	}
	
	public String getIssueTypeName() {
		return issueTypeName;
	}

	public void setIssueTypeName(String issueTypeName) {
		this.issueTypeName = issueTypeName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getIssueStatusName() {
		return issueStatusName;
	}

	public void setIssueStatusName(String issueStatusName) {
		this.issueStatusName = issueStatusName;
	}

	public Project getProjectId() {
		return projectId;
	}

	public void setProjectId(Project projectId) {
		this.projectId = projectId;
	}

	public IssueType getIssueTypeId() {
		return issueTypeId;
	}

	public void setIssueTypeId(IssueType issueTypeId) {
		this.issueTypeId = issueTypeId;
	}

	public IssuePriority getPriorityLevelId() {
		return priorityLevelId;
	}

	public void setPriorityLevelId(IssuePriority priorityLevelId) {
		this.priorityLevelId = priorityLevelId;
	}

	public IssueStatus getIssueStatus() {
		return issueStatus;
	}

	public void setIssueStatus(IssueStatus issueStatus) {
		this.issueStatus = issueStatus;
	}

	public User getAssigneeId() {
		return assigneeId;
	}

	public void setAssigneeId(User assigneeId) {
		this.assigneeId = assigneeId;
	}

	public User getReporterId() {
		return reporterId;
	}

	public void setReporterId(User reporterId) {
		this.reporterId = reporterId;
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
