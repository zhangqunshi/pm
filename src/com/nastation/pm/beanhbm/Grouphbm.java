/**
 * 描述:用户组javaBean
 *
 * @author liuliehui
 */
package com.nastation.pm.beanhbm;

import java.util.*;

public class Grouphbm {

    private int id;
    private String name;
    private int userCount;
    private Set<Userhbm> users = new HashSet<>();
    private PermissionSchemehbm permissionScheme;
    private java.util.Date createDate;

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

    public int getUserCount() {
        return userCount;
    }

    public void setUserCount(int userCount) {
        this.userCount = userCount;
    }

    public Set<Userhbm> getUsers() {
        return users;
    }

    public void setUsers(Set<Userhbm> users) {
        this.users = users;
        this.userCount = users.size();

    }

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

}
