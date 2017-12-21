/**
 * 描述:用户组javaBean
 * @author liuliehui
 */
package com.nastation.pm.bean;

import java.util.*;

public class Group {
    private int id; // 组ID
    private String name; // 组名
    private int userCount; // 一个组对应的用户数
    private int permissionSchemeId; // 权限模板ID
    private String createDate; // 创建日期
    private String permissionSchemeName; // 权限模板名
    private int userId; // 用户ID
    private int groupUserId; // 用户组ID
    private String userName; // 用户名
    private String userFullName; // 用户全名
    private String userEmail; // 用户邮箱

    public int getGroupUserId() {
        return groupUserId;
    }

    public void setGroupUserId(int groupUserId) {
        this.groupUserId = groupUserId;
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

    public int getUserCount() {
        return userCount;
    }

    public void setUserCount(int userCount) {
        this.userCount = userCount;
    }

    public int getPermissionSchemeId() {
        return permissionSchemeId;
    }

    public void setPermissionSchemeId(int permissionSchemeId) {
        this.permissionSchemeId = permissionSchemeId;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getPermissionSchemeName() {
        return permissionSchemeName;
    }

    public void setPermissionSchemeName(String permissionSchemeName) {
        this.permissionSchemeName = permissionSchemeName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserFullName() {
        return userFullName;
    }

    public void setUserFullName(String userFullName) {
        this.userFullName = userFullName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

}
