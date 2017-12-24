package com.nastation.pm.beanhbm;

/**
 * 项目成员
 *
 * @author Kris
 */
public class ProjectUserhbm {

    private int projectUserId;
    private int projectId;
    private int userId;
    private String username;
    private int roleId;
    private String createDate;

    public int getProjectUserId() {
        return projectUserId;
    }

    public void setProjectUserId(int projectUserId) {
        this.projectUserId = projectUserId;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
