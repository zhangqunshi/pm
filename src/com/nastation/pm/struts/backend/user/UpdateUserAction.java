package com.nastation.pm.struts.backend.user;

import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateUserAction extends ActionSupport {
    private int id;
    private String name;
    private String fullname;
    private String email;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String execute() throws Exception {
        UserBO userBO = UserBO.getUserBO();
        Userhbm user = userBO.getUser(getId());
        setEmail(user.getEmail());
        setFullname(user.getFullName());
        setName(user.getName());

        return SUCCESS;
    }

}
