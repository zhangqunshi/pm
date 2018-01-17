package com.nastation.pm.struts.backend.user;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewUserAction extends ActionSupport {
    private String group;

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    @Override
    public String execute() throws Exception {

        UserBO userBO = UserBO.getUserBO();
        GroupBO groupBO = GroupBO.getGroupBO();
        ActionContext cx = ActionContext.getContext();

        if (StringUtils.isBlank(getGroup())) {
            List<Userhbm> list = userBO.viewUsers();
            cx.put("userList", list);
        } else {
            Grouphbm userGroup = groupBO.getUserGroup(getGroup());
            cx.put("userGroup", userGroup);
        }

        return SUCCESS;
    }

}
