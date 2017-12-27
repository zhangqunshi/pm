package com.nastation.pm.struts;

import com.nastation.pm.Global;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

    private String username;
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String execute() throws Exception {
        ActionContext ctx = ActionContext.getContext();
        String name = getUsername();
        String ps = getPassword();
        UserBO userBO = new UserBO();
        Userhbm u = new UserBO().login(name, ps);
        if (u != null) {
            User user = new User();
            user.setAdmin(u.isAdmin());
            user.setCreateDate(u.getCreateDate());
            user.setEmail(u.getEmail());
            user.setFullName(u.getFullName());
            user.setId(u.getId());
            user.setName(u.getName());
            user.setPassword(u.getPassword());
            user.setPermissions(userBO.getAllPermissions(u.getId()));

            ctx.getSession().put(Global.SESSION_USER, user);
            return SUCCESS;
        } else {
            return LOGIN;
        }

    }

    @Override
    public void validate() {
        if (getUsername() == null || getUsername().trim().equals("")) {
            addFieldError("username", getText("user.required"));
        }
        if (getPassword() == null || getPassword().trim().equals("")) {
            addFieldError("password", getText("pass.required"));
        }
    }

}
