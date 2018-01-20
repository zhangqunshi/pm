package com.nastation.pm.struts.frontend.issue;

import java.util.List;

import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserDeployAction extends ActionSupport {
    private String name;
    private String fullname;
    private String email;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception {
        UserBO userBO = UserBO.getUserBO();
        Userhbm user = userBO.getUser(getName());
        setFullname(user.getFullName());
        setEmail(user.getEmail());

        GroupBO groupBO = GroupBO.getGroupBO();
        List<Grouphbm> secondUserGroupList = groupBO.getUserGroupName(user.getId());
        if (secondUserGroupList == null || secondUserGroupList.size() == 0) {
            setFlag(true);
        } else {
            ActionContext cx = ActionContext.getContext();
            cx.put("groupList", secondUserGroupList);
        }

        return SUCCESS;
    }

}
