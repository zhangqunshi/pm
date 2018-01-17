package com.nastation.pm.struts.backend.user;

import com.nastation.pm.Global;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DoUpdateUserAction extends ActionSupport {
    private int id;
    private String fullname;
    private String email;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    @Override
    public String execute() throws Exception {
        Userhbm u = new UserBO().getUser(getId());
        u.setFullName(getFullname());
        u.setEmail(getEmail());
        UserBO userBO = new UserBO();
        userBO.updateUser(u);

        User user = new User();
        user.setId(getId());
        user.setFullName(getFullname());
        user.setEmail(getEmail());
        user.setAdmin(u.isAdmin());
        user.setName(u.getName());
        user.setPassword(u.getPassword());
        user.setCreateDate(u.getCreateDate());
        ActionContext cx = ActionContext.getContext();
        cx.put(Global.SESSION_USER, user);

        return SUCCESS;
    }

}
