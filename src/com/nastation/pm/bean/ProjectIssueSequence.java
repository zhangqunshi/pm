package com.nastation.pm.bean;

public class ProjectIssueSequence {
	
	private int id;
	private Project projectId;
	private Integer maxIdValue;
	
	public ProjectIssueSequence() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Project getProjectId() {
		return projectId;
	}

	public void setProjectId(Project projectId) {
		this.projectId = projectId;
	}

	public Integer getMaxIdValue() {
		return maxIdValue;
	}

	public void setMaxIdValue(Integer maxIdValue) {
		this.maxIdValue = maxIdValue;
	}
	
	
}
