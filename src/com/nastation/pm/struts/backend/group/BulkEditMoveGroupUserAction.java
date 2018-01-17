package com.nastation.pm.struts.backend.group;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.business.GroupUserBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BulkEditMoveGroupUserAction extends ActionSupport {
    private String groupName;
    private int groupId;
    private int userCount;
    private boolean flag;
    

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public int getUserCount() {
        return userCount;
    }

    public void setUserCount(int userCount) {
        this.userCount = userCount;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isBlank(getGroupName())) {
            setGroupName("");
        }

        GroupUserBO guBO = GroupUserBO.getGroupUserBO();
        GroupBO moveGroupBO = GroupBO.getGroupBO();
        Grouphbm groupUser = moveGroupBO.getUserGroup(getGroupName());
        int groupId = groupUser.getId();
        Set<Userhbm> groupUserList = groupUser.getUsers();
        setUserCount(groupUserList.size());
        List<BulkEditMoveGroupUser> list = new ArrayList<>();

        if (groupUserList == null || groupUserList.size() == 0) {
            setFlag(true);
        } else {
            for (Userhbm user : groupUserList) {
                BulkEditMoveGroupUser bmgu = new BulkEditMoveGroupUser();
                int groupUserId = guBO.userGroupId(groupId, user.getId());
                bmgu.setGroupUserId(groupUserId);
                if (StringUtils.isBlank(user.getName())) {
                    bmgu.setFlag(true);
                } else {
                    bmgu.setGroupName(user.getName());
                }
                list.add(bmgu);

            }
        }
        ActionContext cx = ActionContext.getContext();
        cx.put("bmgu", list);

        return SUCCESS;
    }

}
