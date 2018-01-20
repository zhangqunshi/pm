package com.nastation.pm.struts.backend.group;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.business.GroupBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BulkEditViewGroupAction extends ActionSupport {
    private String groupName;
    private int groupCount;

    public int getGroupCount() {
        return groupCount;
    }

    public void setGroupCount(int groupCount) {
        this.groupCount = groupCount;
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

        GroupBO viewGroupBO = GroupBO.getGroupBO();
        List<Grouphbm> groupList = viewGroupBO.getViewGroups();
        setGroupCount(groupList.size());
        List<BulkEditViewGroup> list = new ArrayList<>();

        for (Grouphbm group : groupList) {
            BulkEditViewGroup bevg = new BulkEditViewGroup();
            if (group.getName().equals(getGroupName())) {
                bevg.setFlag(true);
            }
            bevg.setName(group.getName());
            list.add(bevg);
        }

        ActionContext cx = ActionContext.getContext();
        cx.put("gourpList", list);

        return SUCCESS;
    }

}
