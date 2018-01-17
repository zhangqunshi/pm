package com.nastation.pm.struts.backend.group;

import com.nastation.pm.beanhbm.GroupUserhbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupUserBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoEditJoinUserGroupsdefaultAction extends ActionSupport {
    private int userId;
    private int groupId;

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

    @Override
    public String execute() throws Exception {

        UserBO userBO = UserBO.getUserBO();
        GroupUserBO groupUserBO = GroupUserBO.getGroupUserBO();
        GroupUserhbm groupUser = new GroupUserhbm();
        Userhbm user = userBO.getUser(getUserId());

        groupUser.setUserId(getUserId());
        groupUser.setGroupId(getGroupId());

        if (groupUserBO.groupUserExit(groupUser)) {
            return ERROR;
        } else {
            groupUserBO.addGroupUser(groupUser);
        }

        return SUCCESS;
    }

}
