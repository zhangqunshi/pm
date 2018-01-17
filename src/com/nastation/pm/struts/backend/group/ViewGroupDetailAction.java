package com.nastation.pm.struts.backend.group;

import java.util.List;

import com.nastation.pm.bean.PermissionScheme;
import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewGroupDetailAction extends ActionSupport {
    private String groupName;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    @Override
    public String execute() throws Exception {
        GroupBO groupBO = GroupBO.getGroupBO();
        Grouphbm groupInformation = groupBO.getGroupInformation(getGroupName());
        ViewGroup vg = new ViewGroup();
        vg.setName(groupInformation.getName());
        vg.setUserCount(groupInformation.getUserCount());

        PermissionSchemeBO permissionSchemeBO = PermissionSchemeBO.getPermissionSchemeBO();
        List<PermissionScheme> PermissionSchemeList = permissionSchemeBO.getPermissionSchemeList("Group",
                getGroupName());

        if (PermissionSchemeList == null || PermissionSchemeList.size() == 0) {
            setFlag(true);
        } else {
            for (int i = 0; i < PermissionSchemeList.size(); i++) {
                PermissionScheme permissionScheme = PermissionSchemeList.get(i);
                vg.getList().add(permissionScheme);
            }
        }

        ActionContext cx = ActionContext.getContext();
        cx.put("viewGroup", vg);

        return SUCCESS;
    }

}
