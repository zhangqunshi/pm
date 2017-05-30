package com.nastation.pm.bean;

 /**
  * 功能：问题Issue 的Key,封装相关字段
  * @author 许希光
  *
  */
public class IssueKey {
    
	private String issueKey; // Key值
	private int issueId;     // 问题 Issue 对象 Id
	private int projectId;   // 项目 Project 对象 Id
	public String getIssueKey() {
		return issueKey;
	}
	
	public void setIssueKey(String issueKey) {
		this.issueKey = issueKey;
	}
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	
	
	
}
