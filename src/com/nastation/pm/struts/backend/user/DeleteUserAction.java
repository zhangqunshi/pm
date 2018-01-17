package com.nastation.pm.struts.backend.user;

import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteUserAction extends ActionSupport {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        UserBO userBo = UserBO.getUserBO();
        boolean hasForeignKey = userBo.hasForeignKey(id);

        if (hasForeignKey) {
            return ERROR;
        } else {
            userBo.deleteUser(id);
        }

        return SUCCESS;
    }

}
