package com.nastation.pm.beanhbm;

import java.util.*;

/**
 * javabean for PermissionScheme
 * 
 * @author sun
 */
public class PermissionSchemehbm {

    private int id;
    private String name;
    private String description;
    private java.util.Date createDate;
    private Set<Projecthbm> projectList = new HashSet<>();

    public Set<Projecthbm> getProjectList() {
        return projectList;
    }

    public void setProjectList(Set<Projecthbm> projectList) {
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
