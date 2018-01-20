package com.nastation.pm.struts.frontend.issue;

import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.ProjectUser;
import com.nastation.pm.beanhbm.IssuePriorityhbm;
import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.beanhbm.ProjectComponenthbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.IssuePriorityBO;
import com.nastation.pm.business.IssueTypeBO;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.ProjectComponentBO;
import com.nastation.pm.business.ProjectUserBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddIssueStep2Action extends ActionSupport {
    private int projectId;
    private int issueTypeId;
    private boolean flag;

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getIssueTypeId() {
        return issueTypeId;
    }

    public void setIssueTypeId(int issueTypeId) {
        this.issueTypeId = issueTypeId;
    }

    @Override
    public String execute() throws Exception {

        ProjectBO projectBO = ProjectBO.getProjectBO();
        Projecthbm project = projectBO.getProject(getProjectId());

        IssueTypeBO issueTypeBO = IssueTypeBO.getIssueTypeBO();
        IssueTypehbm issueType = issueTypeBO.getIssueType(getIssueTypeId());

        IssuePriorityBO issuePriorityBO = IssuePriorityBO.getIssuePriorityBO();
        List<IssuePriorityhbm> issuePriorityList = issuePriorityBO.getIssuePriorityList();
        List<AddIssueStep2> a2List = new ArrayList<>();
        for (IssuePriorityhbm ip : issuePriorityList) {
            AddIssueStep2 a2 = new AddIssueStep2();
            if (ip.getName().equals("Major")) {
                a2.setMajor(true);
            }
            a2.setIp(ip);
            a2List.add(a2);
        }

        ProjectComponentBO projectComponentBO = ProjectComponentBO.getProjectComponentBO();
        List<ProjectComponenthbm> projectComponentList = projectComponentBO.getProjectComponentList(getProjectId());
        if (projectComponentList == null || projectComponentList.size() <= 0) {
            setFlag(true);
        }

        ProjectUserBO projectUserBO = ProjectUserBO.getProjectUserBO();
        List<ProjectUser> projectUserList = projectUserBO.getProjectUserByProjectId(getProjectId());

        ActionContext cx = ActionContext.getContext();
        cx.put("a2List", a2List);
        cx.put("proj", project);
        cx.put("issueType", issueType);
        cx.put("pcList", projectComponentList);
        cx.put("projUsers", projectUserList);

        return SUCCESS;
    }

}
