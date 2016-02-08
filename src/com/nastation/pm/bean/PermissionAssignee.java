package com.nastation.pm.bean;

/**
 * Permission Assignee bean
 * 
 * @author sun
 * 
 */
public class PermissionAssignee {
	
	private int id;// 权限分配ID
	private int permissionId;// 权限id
	private String assigneeType;
	private String assignee;
	private int schemeId;// 权限模块id
	private String createTime;// 权限分配创建时间
	private String permission;// 权限名字
	private String permissionDescription; // 权限描述
	private String permissionTypeName; // 权限类型名字
	private String permissionDateTime; // 权限创建时间
	private String schemeName; // 权限模块名字
	private String schemeDescription; // 权限模块描述
	private String schemeDateTime;// 权限模块创建时间

	public String getPermissionDescription() {
		return permissionDescription;
	}

	public void setPermissionDescription(String permissionDescription) {
		this.permissionDescription = permissionDescription;
	}

	public String getPermissionTypeName() {
		return permissionTypeName;
	}

	public void setPermissionTypeName(String permissionTypeName) {
		this.permissionTypeName = permissionTypeName;
	}

	public String getPermissionDateTime() {
		return permissionDateTime;
	}

	public void setPermissionDateTime(String permissionDateTime) {
		this.permissionDateTime = permissionDateTime;
	}

	public String getSchemeName() {
		return schemeName;
	}

	public void setSchemeName(String schemeName) {
		this.schemeName = schemeName;
	}

	public String getSchemeDescription() {
		return schemeDescription;
	}

	public void setSchemeDescription(String schemeDescription) {
		this.schemeDescription = schemeDescription;
	}

	public String getSchemeDateTime() {
		return schemeDateTime;
	}

	public void setSchemeDateTime(String schemeDateTime) {
		this.schemeDateTime = schemeDateTime;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPermissionId() {
		return permissionId;
	}

	public void setPermissionId(int permissionId) {
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

	public int getSchemeId() {
		return schemeId;
	}

	public void setSchemeId(int schemeId) {
		this.schemeId = schemeId;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
