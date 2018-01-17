package com.nastation.pm.struts.backend.group;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EditJoinUserGroupsdefaultAction extends ActionSupport {
    private String name;
    private boolean flag;
    private int userId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

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

        GroupBO groupBO = GroupBO.getGroupBO();
        UserBO joinUserBO = UserBO.getUserBO();
        Userhbm joinUser = joinUserBO.getUser(getName());
        List<EditJoinUserGroupsdefault> list = new ArrayList<>();
        if (joinUser != null) {
            setUserId(joinUser.getId());
            List<Grouphbm> joinGroupList = groupBO.getUserGroupList(joinUser.getId());
            if (joinGroupList == null || joinGroupList.size() == 0) {
                setFlag(true);
            } else {
                for (Grouphbm group : joinGroupList) {
                    EditJoinUserGroupsdefault eu = new EditJoinUserGroupsdefault();
                    eu.setId(group.getId());
                    eu.setName(group.getName());
                    list.add(eu);
                }
            }

        }
        ActionContext cx = ActionContext.getContext();
        cx.put("groups", list);

        return SUCCESS;
    }

}
