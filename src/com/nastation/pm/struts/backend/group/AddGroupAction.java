package com.nastation.pm.struts.backend.group;

import com.opensymphony.xwork2.ActionSupport;

public class AddGroupAction extends ActionSupport {
    private String exitName;

    public String getExitName() {
        return exitName;
    }

    public void setExitName(String exitName) {
        this.exitName = exitName;
    }

}
