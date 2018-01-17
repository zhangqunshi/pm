package com.nastation.pm.struts.backend.user;

import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoChangePasswordAction extends ActionSupport {
    private int id;
    private String newpwd;
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNewpwd() {
        return newpwd;
    }

    public void setNewpwd(String newpwd) {
        this.newpwd = newpwd;
    }

    @Override
    public String execute() throws Exception {
        UserBO userBO = UserBO.getUserBO();
        boolean success = userBO.changePassword(id, newpwd);
        if (success) {
            Userhbm user = userBO.getUser(id);
            setName(user.getName());
            return SUCCESS;
        }
        return ERROR;
    }

}
