package com.nastation.pm.struts.backend.group;

import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.GroupUserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteGroupAction extends ActionSupport {
    private String groupName;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    @Override
    public String execute() throws Exception {

        GroupBO groupBO = GroupBO.getGroupBO();
        GroupUserBO groupUserBO = GroupUserBO.getGroupUserBO();

        Grouphbm moveGroup = groupBO.getGroupInformation(getGroupName());

        if (groupUserBO.groupUserExit(moveGroup.getId())) {
            groupUserBO.deleteGroupUser(moveGroup.getId());
        }
        groupBO.deleteGroup(moveGroup.getId());

        return SUCCESS;
    }

}
