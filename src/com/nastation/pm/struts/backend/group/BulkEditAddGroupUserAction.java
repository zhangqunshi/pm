package com.nastation.pm.struts.backend.group;

import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionSupport;

public class BulkEditAddGroupUserAction extends ActionSupport {
    private String groupName;
    private boolean flag;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isBlank(getGroupName())) {
            setFlag(true);
        }

        return SUCCESS;
    }

}
