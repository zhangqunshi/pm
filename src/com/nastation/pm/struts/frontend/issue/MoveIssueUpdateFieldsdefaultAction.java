package com.nastation.pm.struts.frontend.issue;

import java.util.HashMap;
import java.util.Map;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.IssueTypeBO;
import com.nastation.pm.business.ProjectBO;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MoveIssueUpdateFieldsdefaultAction extends ActionSupport {
    private int issuetype;
    private int pid;
    private boolean flag;
    private boolean flag2;
    private String issueKey;

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

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

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getIssuetype() {
        return issuetype;
    }

    public void setIssuetype(int issuetype) {
        this.issuetype = issuetype;
    }

    @SuppressWarnings("unused")
    @Override
    public String execute() throws Exception {

        Issue issue = (Issue) ActionContext.getContext().getSession().get("moveIssue");
        setIssueKey(issue.getIssueKey());

        if (issue == null) {
            setFlag(true);
            return SUCCESS;
        }

        ProjectBO projectBo = ProjectBO.getProjectBO();
        Projecthbm project = projectBo.getProject(getPid());

        IssueTypeBO issueTypeBo = IssueTypeBO.getIssueTypeBO();
        IssueTypehbm issueType = issueTypeBo.getIssueType(getIssuetype());

        if (issue.getProjectId() == getPid() && issue.getIssueTypeId() == getIssuetype()) {
            return ERROR;
        }
        ActionContext cx = ActionContext.getContext();
        cx.put("proj", project);
        cx.put("issueType", issueType);

        issue.setProjectId(project.getId());
        issue.setProjectName(project.getName());
        issue.setIssueTypeId(issueType.getId());
        issue.setIssueTypeName(issueType.getName());

        ActionContext.getContext().setSession((Map<String, Object>) new HashMap().put("moveIssue", issue));

        return SUCCESS;
    }

}
