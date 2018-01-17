package com.nastation.pm.struts.backend.project.user;

import java.util.List;

import com.nastation.pm.bean.ProjectUser;

public class ViewProjectUser {
    private int roleId;
    private String roleName;
    private String roleDesc;
    private List<ProjectUser> projectUserList;

    public ViewProjectUser() {

    }

    public ViewProjectUser(int id, String name, String desc, List<ProjectUser> l) {
        this.roleId = id;
        this.roleName = name;
        this.roleDesc = desc;
        this.projectUserList = l;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public List<ProjectUser> getProjectUserList() {
        return projectUserList;
    }

    public void setProjectUserList(List<ProjectUser> projectUserList) {
        this.projectUserList = projectUserList;
    }

}
