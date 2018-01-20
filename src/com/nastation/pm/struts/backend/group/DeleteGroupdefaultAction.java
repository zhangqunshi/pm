package com.nastation.pm.struts.backend.group;

import com.opensymphony.xwork2.ActionSupport;

public class DeleteGroupdefaultAction extends ActionSupport {
    private String groupName;
    private boolean flag;
    private boolean flag2;

    public boolean isFlag2() {
        return flag2;
    }

    public void setFlag2(boolean flag2) {
        this.flag2 = flag2;
    }

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

        if (getGroupName().equals("administrators")) {
            setFlag(true);
        }
        if (getGroupName().equals("administrators")) {
            setFlag2(true);
        }

        return SUCCESS;
    }

}
