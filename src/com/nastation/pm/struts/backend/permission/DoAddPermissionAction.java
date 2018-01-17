package com.nastation.pm.struts.backend.permission;

import com.nastation.pm.beanhbm.PermissionAssigneehbm;
import com.nastation.pm.business.PermissionAssigneeBO;
import com.nastation.pm.business.PermissionBO;
import com.nastation.pm.business.PermissionSchemeBO;
import com.nastation.pm.business.UserBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddPermissionAction extends ActionSupport {
    private String type;
    private int permissions;
    private String Group;
    private String SingleUser;
    private String ProjectRole;
    private int schemeId;
    private String assignee;

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPermissions() {
        return permissions;
    }

    public void setPermissions(int permissions) {
        this.permissions = permissions;
    }

    public String getGroup() {
        return Group;
    }

    public void setGroup(String group) {
        Group = group;
    }

    public String getSingleUser() {
        return SingleUser;
    }

    public void setSingleUser(String singleUser) {
        SingleUser = singleUser;
    }

    public String getProjectRole() {
        return ProjectRole;
    }

    public void setProjectRole(String projectRole) {
        ProjectRole = projectRole;
    }

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    @Override
    public String execute() throws Exception {
        setAssignee(getType());
        boolean flag = false;
        if (StringUtils.isNotBlank(getType())) {
            if (!"SingleUser".equals(getType()) && !"ProjectRole".equals(getType()) && !"Group".equals(getType())) {
                flag = true;
            }
            if ("SingleUser".equals(getType())) {
                UserBO userBo = UserBO.getUserBO();
                if (StringUtils.isBlank(getSingleUser())) {
                    flag = true;
                } else if (!userBo.exist(getAssignee())) {
                    flag = true;
                }
            } else if ("ProjectRole".equals(getType()) && StringUtils.isBlank(getProjectRole())) {
                flag = true;
            } else if ("Group".equals(getType()) && StringUtils.isBlank(getGroup())) {
                flag = true;
            }
        }

        if (flag) {
            return ERROR;
        }

        PermissionAssigneeBO paBO = PermissionAssigneeBO.getPermissionAssigneeBO();
        PermissionAssigneehbm pa = new PermissionAssigneehbm();
        pa.setAssignee(assignee);
        pa.setAssigneeType(type);
        pa.setScheme(new PermissionSchemeBO().getScheme(getSchemeId()));
        pa.setPermission(new PermissionBO().idGetPermission(getPermissions()));

        if (!paBO.exist(pa)) {
            paBO.addPermissionAssignee(pa);
        }

        return SUCCESS;
    }

}
