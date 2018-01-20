package com.nastation.pm.struts.backend.group;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EditLeaveUserGroupsdefaultAction extends ActionSupport {
    private String name;
    private int userId;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception {

        GroupBO leaveGroupBO = GroupBO.getGroupBO();
        UserBO leaveUserBO = UserBO.getUserBO();

        Userhbm leaveUser = leaveUserBO.getUser(getName());
        setUserId(leaveUser.getId());
        List<Grouphbm> leaveGroupList = leaveGroupBO.getUserGroupName(leaveUser.getId());
        List<EditJoinUserGroupsdefault> list = new ArrayList<>();

        if (leaveGroupList == null || leaveGroupList.size() == 0) {
            setFlag(true);
        } else {
            for (Grouphbm group : leaveGroupList) {
                EditJoinUserGroupsdefault eu = new EditJoinUserGroupsdefault();
                eu.setId(group.getId());
                eu.setName(eu.getName());
                list.add(eu);
            }
        }

        ActionContext cx = ActionContext.getContext();
        cx.put("groups", list);

        return SUCCESS;
    }

}
