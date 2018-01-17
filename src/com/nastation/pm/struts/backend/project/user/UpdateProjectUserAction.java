package com.nastation.pm.struts.backend.project.user;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.ProjectUser;
import com.nastation.pm.bean.Role;
import com.nastation.pm.bean.User;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.beanhbm.Rolehbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.ProjectUserBO;
import com.nastation.pm.business.RoleBO;
import com.nastation.pm.business.UserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateProjectUserAction extends ActionSupport {
    private int projectUserId;
    private String projectName;
    private boolean ul;
    private boolean rl;
    private int projectId;
    private int projectUserOfUserId;

    public int getProjectUserOfUserId() {
        return projectUserOfUserId;
    }

    public void setProjectUserOfUserId(int projectUserOfUserId) {
        this.projectUserOfUserId = projectUserOfUserId;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public boolean isUl() {
        return ul;
    }

    public void setUl(boolean ul) {
        this.ul = ul;
    }

    public boolean isRl() {
        return rl;
    }

    public void setRl(boolean rl) {
        this.rl = rl;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public int getProjectUserId() {
        return projectUserId;
    }

    public void setProjectUserId(int projectUserId) {
        this.projectUserId = projectUserId;
    }

    @Override
    public String execute() throws Exception {

        ProjectUserBO pub = ProjectUserBO.getProjectUserBO();
        ProjectUser projectUser = pub.getProjectUser(getProjectUserId());
        setProjectUserOfUserId(projectUser.getUserId());
        ProjectBO projectBo = ProjectBO.getProjectBO();
        UserBO userBo = UserBO.getUserBO();
        RoleBO roleBo = RoleBO.getRoleBO();

        Projecthbm project = projectBo.getProject(projectUser.getProjectId());
        setProjectName(project.getName());
        setProjectId(project.getId());

        List<Userhbm> userList = userBo.viewUsers();
        List<Rolehbm> roleList = roleBo.getRoleList();

        List<User> uList = new ArrayList<>();
        if (userList == null || userList.size() == 0) {
            setUl(true);
        } else {
            for (Userhbm u : userList) {

                User user = new User();
                user.setId(u.getId());
                user.setName(u.getName());
                uList.add(user);

            }
        }

        List<Role> lList = new ArrayList<>();
        if (roleList == null || roleList.size() == 0) {
            setRl(true);
        } else {
            for (Rolehbm r : roleList) {
                Role role = new Role();
                role.setRoleId(r.getId());
                role.setRoleName(r.getRoleName());
                lList.add(role);
            }
        }

        ActionContext cx = ActionContext.getContext();
        cx.put("uList", uList);
        cx.put("lList", lList);

        return SUCCESS;
    }

}
