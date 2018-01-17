package com.nastation.pm.struts.backend.user;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionSupport;

public class AddUserAction extends ActionSupport {
    private String fail;

    public String getFail() {
        return fail;
    }

    public void setFail(String fail) {
        this.fail = fail;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isBlank(getFail())) {
            setFail("");
        }

        return SUCCESS;
    }

}
