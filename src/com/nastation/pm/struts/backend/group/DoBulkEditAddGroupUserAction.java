package com.nastation.pm.struts.backend.group;

import com.nastation.pm.beanhbm.GroupUserhbm;
import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.GroupUserBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionSupport;

public class DoBulkEditAddGroupUserAction extends ActionSupport {
    private String groupName;
    private String users;

    public String getUsers() {
        return users;
    }

    public void setUsers(String users) {
        this.users = users;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    @Override
    public String execute() throws Exception {
        GroupBO groupBO = GroupBO.getGroupBO();
        Grouphbm group = groupBO.getGroupInformation(getGroupName());

        String[] type1 = (getUsers()).split(",");
        String type = "";
        for (int i = 0; i < type1.length; i++) {
            type = type1[i];

            UserBO userBo = UserBO.getUserBO();
            Userhbm user = userBo.getUser(type);

            if (!userBo.exist(type)) {

                return ERROR;
            }

            GroupUserBO groupUserBO = GroupUserBO.getGroupUserBO();
            GroupUserhbm groupUser = new GroupUserhbm();

            groupUser.setGroupId(group.getId());
            groupUser.setUserId(user.getId());

            if (groupUserBO.groupUserExit(groupUser)) {
                return ERROR;
            } else {
                groupUserBO.addGroupUser(groupUser);
            }
        }

        return SUCCESS;
    }

}
