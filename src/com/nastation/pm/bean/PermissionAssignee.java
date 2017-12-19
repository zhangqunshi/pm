package com.nastation.pm.bean;

/**
 * Permission Assignee bean
 * 
 * @author sun
 * 
 */
public class PermissionAssignee {
	
	private int id;// 权限分配ID
	private Permission permissionId;// 权限id
	private String assigneeType;
	private String assignee;
	private PermissionScheme schemeId;// 权限模块id
	private java.util.Date createTime;// 权限分配创建时间

	public PermissionAssignee() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Permission getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(Permission permissionId) {
		this.permissionId = permissionId;
	}

	public String getAssigneeType() {
		return assigneeType;
	}

	public void setAssigneeType(String assigneeType) {
		this.assigneeType = assigneeType;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public PermissionScheme getSchemeId() {
		return schemeId;
	}

	public void setSchemeId(PermissionScheme schemeId) {
		this.schemeId = schemeId;
	}

	public java.util.Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

}
