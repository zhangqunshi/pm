package com.nastation.pm.struts.backend.user;

import java.util.List;

import com.nastation.pm.Global;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewUserDetailAction extends ActionSupport {
    private String name;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception {

        User user = (User) ActionContext.getContext().get(Global.SESSION_USER);

        if (user == null) {
            if (getName() != null && !getName().trim().equals("")) {
                UserBO userBO = new UserBO();
                Userhbm ubm = userBO.getUser(getName());
                user = new User();
                user.setId(ubm.getId());
                user.setName(ubm.getName());
                user.setPassword(ubm.getPassword());
                user.setEmail(ubm.getEmail());
                user.setFullName(ubm.getFullName());
                user.setCreateDate(ubm.getCreateDate());
                user.setAdmin(ubm.isAdmin());

            }
        }
        if (user.getName() == null) {
            return ERROR;
        }

        GroupBO groupBO = GroupBO.getGroupBO();
        List<Grouphbm> groupList = groupBO.getUserGroupName(user.getId());
        setFlag(groupList == null || groupList.size() == 0);
        ActionContext cx = ActionContext.getContext();
        cx.put("user", user);
        cx.put("groupList", groupList);

        return SUCCESS;
    }

}
