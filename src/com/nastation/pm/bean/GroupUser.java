/**
 * 描述:组和用户关联的javaBean
 * @author liuliehui
 */
package com.nastation.pm.bean;

public class GroupUser {
    private int id; // 用户组ID
    private int userId; // 用户ID
    private int groupId; // 组ID

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

}
