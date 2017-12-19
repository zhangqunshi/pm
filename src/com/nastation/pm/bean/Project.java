package com.nastation.pm.bean;

/**
 * 
 * @author Zhangbo 该类是项目javabean
 */

public class Project {

	private int projectId;
	private String name; // 项目名称
	private String projectKey;
	private String description; // 描述
	private String url; // 项目路径
	private String leader; // 管理员id
	private java.util.Date createDate;

	// private int categoryId; //类型id
	private ProjectCategory categoryId;
	// private int permissionSchemeId;//该项目使用的权限模板id
	private PermissionScheme permissionSchemeId;

	public PermissionScheme getPermissionSchemeId() {
		return permissionSchemeId;
	}

	public void setPermissionSchemeId(PermissionScheme permissionSchemeId) {
		this.permissionSchemeId = permissionSchemeId;
	}

	public java.util.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProjectKey() {
		return projectKey;
	}

	public void setProjectKey(String projectKey) {
		this.projectKey = projectKey;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public ProjectCategory getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(ProjectCategory categoryId) {
		this.categoryId = categoryId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

}
