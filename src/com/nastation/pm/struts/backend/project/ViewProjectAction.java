package com.nastation.pm.struts.backend.project;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Project;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewProjectAction extends ActionSupport {

    @Override
    public String execute() throws Exception {

        ProjectBO pb = ProjectBO.getProjectBO();
        List<Projecthbm> list = pb.getProjectList();
        List<Project> pList = new ArrayList<>();
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                Projecthbm p = list.get(i);
                Project project = new Project();
                project.setProjectId(p.getId());
                project.setName(p.getName());
                project.setProjectKey(p.getProjectKey());

                if (p.getUrl().equals("http://")) {
                    project.setUrl("not url");
                } else {
                    project.setUrl(p.getUrl());
                }

                project.setLeader(p.getLeader());
                project.setCreateDate(p.getCreateDate());
                pList.add(project);

            }
        }
        ActionContext.getContext().put("projList", pList);
        return SUCCESS;
    }

}
