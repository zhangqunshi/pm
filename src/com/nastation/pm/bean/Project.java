package com.nastation.pm.bean;


/**
 * 
 * @author Zhangbo
 * 该类是项目javabean
 */

public class Project {
	
	private int projectId;
	private String name; //项目名称
	private String projectKey; 
	private String description; //描述
	private String url;  //项目路径
	private String leader;  //管理员id
	private int categoryId;  //类型id
	private String createDate;  //创建日期
	private int permissionSchemeId;//该项目使用的权限模板id
	
	

	public int getPermissionSchemeId() {
		return permissionSchemeId;
	}

	public void setPermissionSchemeId(int permissionSchemeId) {
		this.permissionSchemeId = permissionSchemeId;
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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	
}
