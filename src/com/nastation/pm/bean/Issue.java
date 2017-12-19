package com.nastation.pm.bean;

/**
 * 功能：问题基本信息 bean 类,封装字段
 * 
 * @author 许希光
 */
public class Issue {

	private int id; // 问题ID    1
	private String issueKey;        //  1
	private int issueTypeId; // 问题类型ID  1
	private String issueTypeName; // 问题类型名称
	private String issueTypeIcon;
	private String name; // 问题概要       1
	private int priorityLevelId; // 优先级ID    1
	private String priorityLevel; // 优先级名称
	private String priorityLevelIcon;
	private String startTime; // 实际开始时间       1
	private String endTime; // 实际结束日期         1
	private String planEndTime; // 计划结束时间     1
	private int componentId; // 模块ID			1
	private String componentName; // 模块名称
	private int assigneeId; // 开发者ID			1
	private String assignee; // 开发者姓名
	private String assigneeFullname;
	private int reporterId; // 报告人ID			1
	private String reporter; // 报告人姓名
	private String reporterFullname;
	private String environment; // 环境			1
	private String description; // 问题描述		1
	private int projectId; // 项目ID				1
	private String projectName; // 项目名称
	private String lastUpdateDate; // 最后更改日期	1
	private String createDate; // 产生日期		1
	private int issueStatus; // 问题状态			1
	private int resolutionId;			//	1
	private String resolution;
	private String issueStatusName;
	private String issueStatusIcon;			

	public String getIssueStatusName() {
		return issueStatusName;
	}
	
	public void setIssueStatusName(String issueStatusName) {
		this.issueStatusName = issueStatusName;
	}
	
	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getPlanEndTime() {
		return planEndTime;
	}

	public void setPlanEndTime(String planEndTime) {
		this.planEndTime = planEndTime;
	}

	public int getIssueStatus() {
		return issueStatus;
	}

	public void setIssueStatus(int issueStatus) {
		this.issueStatus = issueStatus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIssueTypeId() {
		return issueTypeId;
	}

	public void setIssueTypeId(int issueTypeId) {
		this.issueTypeId = issueTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPriorityLevelId() {
		return priorityLevelId;
	}

	public void setPriorityLevelId(int priorityLevelId) {
		this.priorityLevelId = priorityLevelId;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public int getComponentId() {
		return componentId;
	}

	public void setComponentId(int componentId) {
		this.componentId = componentId;
	}

	public int getAssigneeId() {
		return assigneeId;
	}

	public void setAssigneeId(int assigneeId) {
		this.assigneeId = assigneeId;
	}

	public int getReporterId() {
		return reporterId;
	}

	public void setReporterId(int reporterId) {
		this.reporterId = reporterId;
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

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(String lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getIssueKey() {
		return issueKey;
	}

	public void setIssueKey(String issueKey) {
		this.issueKey = issueKey;
	}

	public String getIssueTypeName() {
		return issueTypeName;
	}

	public void setIssueTypeName(String issueTypeName) {
		this.issueTypeName = issueTypeName;
	}

	public String getPriorityLevel() {
		return priorityLevel;
	}

	public void setPriorityLevel(String priorityLevel) {
		this.priorityLevel = priorityLevel;
	}

	public String getComponentName() {
		return componentName;
	}

	public void setComponentName(String componentName) {
		this.componentName = componentName;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getIssueTypeIcon() {
		return issueTypeIcon;
	}

	public void setIssueTypeIcon(String issueTypeIcon) {
		this.issueTypeIcon = issueTypeIcon;
	}

	public String getPriorityLevelIcon() {
		return priorityLevelIcon;
	}

	public void setPriorityLevelIcon(String priorityLevelIcon) {
		this.priorityLevelIcon = priorityLevelIcon;
	}

	public String getIssueStatusIcon() {
		return issueStatusIcon;
	}

	public void setIssueStatusIcon(String issueStatusIcon) {
		this.issueStatusIcon = issueStatusIcon;
	}

	public int getResolutionId() {
		return resolutionId;
	}

	public void setResolutionId(int resolutionId) {
		this.resolutionId = resolutionId;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	public String getAssigneeFullname() {
		return assigneeFullname;
	}

	public void setAssigneeFullname(String assigneeFullname) {
		this.assigneeFullname = assigneeFullname;
	}

	public String getReporterFullname() {
		return reporterFullname;
	}

	public void setReporterFullname(String reporterFullname) {
		this.reporterFullname = reporterFullname;
	}

}
