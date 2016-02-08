package com.nastation.pm.bean;

import java.util.List;
/**
 * javabean for PermissionScheme
 * @author sun
 */
public class PermissionScheme {
    private int id;
    private String name;
    private String description;
    private String createDate;
    private List<Project> projectList;  //用于存放使用该PermissionScheme的所有项目信息。
    
	public List getProjectList() {
		return projectList;
	}
	public void setProjectList(List projectList) {
		this.projectList = projectList;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}
