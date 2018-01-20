package com.nastation.pm.struts.backend.group;

import java.util.List;

import com.nastation.pm.bean.PermissionScheme;

public class ViewGroup {
    private String name;
    private int userCount;
    private List<PermissionScheme> list;

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

    public List<PermissionScheme> getList() {
        return list;
    }

    public void setList(List<PermissionScheme> list) {
        this.list = list;
    }

}
