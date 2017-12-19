package com.nastation.pm.bean;

import java.util.*;
/**
 * javabean for PermissionScheme
 * @author sun
 */
public class PermissionScheme {
    private int id;
    private String name;
    private String description;
    private java.util.Date createDate;
    private Set<Project> projectList = new HashSet<>();
    
    public PermissionScheme() {
    	
    }
    
	public Set<Project> getProjectList() {
		return projectList;
	}
	public void setProjectList(Set<Project> projectList) {
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
	public java.util.Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}
}
