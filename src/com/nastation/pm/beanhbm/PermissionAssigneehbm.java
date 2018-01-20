package com.nastation.pm.beanhbm;

/**
 * Permission Assignee bean
 *
 * @author sun
 *
 */
public class PermissionAssigneehbm {

    private int id;// 权限分配ID
<<<<<<< HEAD
    private Permissionhbm permission;// 权限
    private String assigneeType;
    private String assignee;
    private PermissionSchemehbm scheme;// 权限模块
=======
    private Permissionhbm permission;// 权限id
    private String assigneeType;
    private String assignee;
    private PermissionSchemehbm scheme;// 权限模块id
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
    private java.util.Date createTime;// 权限分配创建时间

    public PermissionAssigneehbm() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Permissionhbm getPermission() {
        return permission;
    }

    public void setPermission(Permissionhbm permission) {
        this.permission = permission;
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

    public PermissionSchemehbm getScheme() {
        return scheme;
    }

    public void setScheme(PermissionSchemehbm scheme) {
        this.scheme = scheme;
    }

    public java.util.Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(java.util.Date createTime) {
        this.createTime = createTime;
    }

}
