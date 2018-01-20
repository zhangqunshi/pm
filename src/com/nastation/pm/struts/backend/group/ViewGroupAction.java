package com.nastation.pm.struts.backend.group;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.PermissionScheme;
import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.PermissionSchemeBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewGroupAction extends ActionSupport {
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String execute() throws Exception {

        GroupBO groupBO = GroupBO.getGroupBO();
        List<Grouphbm> groupList = groupBO.getViewGroups();
        List<ViewGroup> viewGroupList = new ArrayList<>();

        if (groupList == null || groupList.size() == 0) {
            setFlag(true);
        } else {
            for (int i = 0; i < groupList.size(); i++) {
                ViewGroup vg = new ViewGroup();
                Grouphbm groupView = groupList.get(i);
                vg.setName(groupView.getName());
                vg.setUserCount(groupView.getUserCount());
                PermissionSchemeBO permissionSchemeBO = PermissionSchemeBO.getPermissionSchemeBO();
                List<PermissionScheme> permissionSchemeList = permissionSchemeBO.getPermissionSchemeList("Group",
                        groupView.getName());
                for (PermissionScheme ps : permissionSchemeList) {
                    vg.getList().add(ps);
                }
                viewGroupList.add(vg);
            }
        }

        ActionContext cx = ActionContext.getContext();
        cx.put("viewGroupList", viewGroupList);

        return SUCCESS;
    }

}
