package com.nastation.pm.struts;

import com.nastation.pm.beanhbm.GroupUserhbm;
import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.GroupUserBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddUserAction extends ActionSupport {
    private String username;
    private String password;
    private String fullname;
    private String email;

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

        UserBO uBO = UserBO.getUserBO();
        GroupBO gBO = GroupBO.getGroupBO();

        Userhbm u = new Userhbm();
        u.setName(getUsername());
        u.setPassword(getPassword());
        u.setFullName(getFullname());
        u.setEmail(getEmail());

        if (uBO.addUser(u)) {
            if (gBO.groupNameExit("users")) {
                Grouphbm group = gBO.getGroup("users");
                Userhbm secondUser = uBO.getUser(getUsername());

                GroupUserBO groupUserBO = GroupUserBO.getGroupUserBO();
                GroupUserhbm groupUser = new GroupUserhbm();
                groupUser.setGroupId(group.getId());
                groupUser.setUserId(secondUser.getId());
                groupUserBO.addGroupUser(groupUser);
            }
            return SUCCESS;
        } else {
            ActionContext.getContext().put("choice", "ok");
            return INPUT;
        }

    }

}
