package com.nastation.pm.struts.backend.permission;

import java.util.List;

import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.beanhbm.Permissionhbm;
import com.nastation.pm.beanhbm.Rolehbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.PermissionBO;
import com.nastation.pm.business.PermissionSchemeBO;
import com.nastation.pm.business.RoleBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddPermissionAction extends ActionSupport {

    private int schemeId;
    private int permissionId;
    private String name;

    public int getSchemeId() {
        return schemeId;
    }

    public void setSchemeId(int schemeId) {
        this.schemeId = schemeId;
    }

    public int getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(int permissionId) {
        this.permissionId = permissionId;
    }

    @Override
    public String execute() throws Exception {

        PermissionSchemeBO psBO = PermissionSchemeBO.getPermissionSchemeBO();
        PermissionSchemehbm ps = psBO.getScheme(getSchemeId());
        PermissionBO permissionBO = PermissionBO.getPermissionBO();
        RoleBO roleBO = RoleBO.getRoleBO();
        GroupBO groupBO = GroupBO.getGroupBO();
        List<Permissionhbm> list = permissionBO.getAllPermission();
        List<Rolehbm> roleList = roleBO.getRoleList();
        List<Grouphbm> groupList = groupBO.getViewGroups();

        ActionContext cx = ActionContext.getContext();
        cx.put("permissionList", list);
        cx.put("roleList", roleList);
        cx.put("groupList", groupList);

        return SUCCESS;
    }

}
