package com.nastation.pm.struts.backend.user;

import com.opensymphony.xwork2.ActionSupport;

public class ChangePasswordSuccessAction extends ActionSupport {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
