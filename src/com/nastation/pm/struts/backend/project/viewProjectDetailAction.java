package com.nastation.pm.struts.backend.project;

import com.nastation.pm.bean.Project;
import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class viewProjectDetailAction extends ActionSupport {
    private int projectId;
    private String categoryName;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    @Override
    public String execute() throws Exception {
        ProjectBO pb = ProjectBO.getProjectBO();
        Projecthbm ph = pb.getProject(getProjectId());

        PermissionSchemehbm ps = ph.getPermissionScheme();

        Project project = new Project();
        project.setProjectId(ph.getId());
        project.setName(ph.getName());
        project.setProjectKey(ph.getProjectKey());
        project.setUrl(ph.getUrl());
        project.setDescription(ph.getDescription());
        project.setLeader(ph.getLeader());

        if (ph.getCategory() == null) {
            project.setCategoryId(0);
            setCategoryName("not");

        } else {
            project.setCategoryId(ph.getCategory().getId());
            setCategoryName(ph.getCategory().getName());
        }

        ActionContext cx = ActionContext.getContext();
        cx.put("project", project);
        cx.put("ps", ps);
        cx.put("category", ph.getCategory());
        cx.put("components", ph.getComponents());
        return SUCCESS;
    }
}
