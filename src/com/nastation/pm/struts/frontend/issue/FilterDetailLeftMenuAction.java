package com.nastation.pm.struts.frontend.issue;

import com.opensymphony.xwork2.ActionSupport;

public class FilterDetailLeftMenuAction extends ActionSupport {
    private String mode;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    @Override
    public String execute() throws Exception {

        if ("show".equals(getMode())) {
            setFlag(true);
        }

        return SUCCESS;
    }

}
