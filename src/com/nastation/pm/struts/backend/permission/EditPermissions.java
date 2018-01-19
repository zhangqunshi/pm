package com.nastation.pm.struts.backend.permission;

import java.util.List;

import com.nastation.pm.bean.Permission;
import com.nastation.pm.beanhbm.PermissionAssigneehbm;

public class EditPermissions {
    private String type;
    private List<Permission> permissionList;
    private List<List<PermissionAssigneehbm>> list;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Permission> getPermissionList() {
        return permissionList;
    }

    public void setPermissionList(List<Permission> permissionList) {
        this.permissionList = permissionList;
    }

    public List<List<PermissionAssigneehbm>> getList() {
        return list;
    }

    public void setList(List<List<PermissionAssigneehbm>> list) {
        this.list = list;
    }

}
