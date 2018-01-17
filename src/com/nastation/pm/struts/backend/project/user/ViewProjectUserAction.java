package com.nastation.pm.struts.backend.project.user;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.ProjectUser;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.beanhbm.Rolehbm;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.ProjectUserBO;
import com.nastation.pm.business.RoleBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewProjectUserAction extends ActionSupport {
    private int projectId;
    private String name;
    private boolean flag;
    private boolean flag2;

    public boolean isFlag2() {
        return flag2;
    }

    public void setFlag2(boolean flag2) {
        this.flag2 = flag2;
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

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {

        if ((getProjectId() + "") == null || (getProjectId() + "").equals("")) {
            setFlag(true);
            return SUCCESS;
        }

        ProjectBO pBO = ProjectBO.getProjectBO();
        Projecthbm project = pBO.getProject(getProjectId());
        setName(project.getName());

        RoleBO rb = RoleBO.getRoleBO();
        List<Rolehbm> rList = rb.getRoleList();
        List<ViewProjectUser> vpList = new ArrayList<>();

        if (rList != null) {
            for (Rolehbm role : rList) {
                ProjectUserBO projectUserBO = ProjectUserBO.getProjectUserBO();

                List<ProjectUser> projectUserList = projectUserBO.getProjectUserByProjectIdRoleId(project.getId(),
                        role.getId());

                if (projectUserList == null || projectUserList.size() == 0) {
                    setFlag2(true);
                }
                vpList.add(new ViewProjectUser(role.getId(), role.getRoleName(), role.getRoleDesc(), projectUserList));

            }
        }

        ActionContext cx = ActionContext.getContext();
        cx.put("vpList", vpList);

        return SUCCESS;
    }

}
