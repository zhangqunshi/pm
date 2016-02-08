package com.nastation.pm.bean;

public class IssueChangeLog {
	private int id;
	private int issueId;
	private String changeField;
	private String oldValue;
	private String newValue;
	private String createDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIssueId() {
		return issueId;
	}

	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}

	public String getChangeField() {
		return changeField;
	}

	public void setChangeField(String changeField) {
		this.changeField = changeField;
	}

	public String getOldValue() {
		return oldValue;
	}

	public void setOldValue(String oldValue) {
		this.oldValue = oldValue;
	}

	public String getNewValue() {
		return newValue;
	}

	public void setNewValue(String newValue) {
		this.newValue = newValue;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

}
