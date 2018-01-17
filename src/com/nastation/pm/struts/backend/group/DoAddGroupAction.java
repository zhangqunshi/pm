package com.nastation.pm.struts.backend.group;

import com.nastation.pm.business.GroupBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddGroupAction extends ActionSupport {
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

        if (groupBO.groupNameExit(getGroupName())) {

            return ERROR;
        }
        groupBO.addGroup(getGroupName());

        return SUCCESS;
    }

}
