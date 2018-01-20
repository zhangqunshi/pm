package com.nastation.pm.struts.backend.group;

import com.nastation.pm.business.GroupUserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoMoveGroupUserAction extends ActionSupport {
    private int groupUserId;
    private String groupName;

    public int getGroupUserId() {
        return groupUserId;
    }

    public void setGroupUserId(int groupUserId) {
        this.groupUserId = groupUserId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    @Override
    public String execute() throws Exception {
        GroupUserBO groupUserBO = GroupUserBO.getGroupUserBO();
        groupUserBO.deleteGroupUser(getGroupUserId());
        return SUCCESS;
    }

}
