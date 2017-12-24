package com.nastation.pm.beanhbm;

/**
 *
 * @author Zhangbo 该类是项目javabean
 */
public class Projecthbm {

    private int id;
    private String name; // 项目名称
    private String projectKey;
    private String description; // 描述
    private String url; // 项目路径
    private String leader; // 管理员id
    private java.util.Date createDate;
    private ProjectCategoryhbm category;
    private PermissionSchemehbm permissionScheme;

    public PermissionSchemehbm getPermissionScheme() {
        return permissionScheme;
    }

    public void setPermissionScheme(PermissionSchemehbm permissionScheme) {
        this.permissionScheme = permissionScheme;
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

    public ProjectCategoryhbm getCategory() {
        return category;
    }

    public void setCategory(ProjectCategoryhbm category) {
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
