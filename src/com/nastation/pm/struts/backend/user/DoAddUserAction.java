package com.nastation.pm.struts.backend.user;

import com.nastation.pm.beanhbm.GroupUserhbm;
import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.GroupUserBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoAddUserAction extends ActionSupport {
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

        Userhbm u = new Userhbm();
        UserBO userBO = UserBO.getUserBO();
        GroupBO groupBO = GroupBO.getGroupBO();

        u.setName(getUsername());
        u.setEmail(getEmail());
        u.setFullName(getFullname());
        u.setPassword(getPassword());

        if (userBO.addUser(u)) {
            if (groupBO.groupNameExit("users")) {
                Grouphbm group = groupBO.getGroup("users");
                Userhbm secondUser = userBO.getUser(getUsername());

                GroupUserBO groupUserBO = GroupUserBO.getGroupUserBO();
                GroupUserhbm groupUser = new GroupUserhbm();
                groupUser.setGroupId(group.getId());
                groupUser.setUserId(secondUser.getId());
                groupUserBO.addGroupUser(groupUser);
            }
            return SUCCESS;
        } else {
            return ERROR;
        }

    }

}
