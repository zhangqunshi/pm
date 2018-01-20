package com.nastation.pm.struts.frontend.issue;

import java.util.List;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.beanhbm.IssueStatushbm;
import com.nastation.pm.beanhbm.IssueTypehbm;
import com.nastation.pm.beanhbm.Issuehbm;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.IssueStatusBO;
import com.nastation.pm.business.IssueTypeBO;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MoveIssuedefaultAction extends ActionSupport {
    private String issueKey;
    private boolean over;
    private String projName;
    private int projId;
    private String issueTypeName;
    private int issueTypeId;

    public String getIssueTypeName() {
        return issueTypeName;
    }

    public void setIssueTypeName(String issueTypeName) {
        this.issueTypeName = issueTypeName;
    }

    public int getIssueTypeId() {
        return issueTypeId;
    }

    public void setIssueTypeId(int issueTypeId) {
        this.issueTypeId = issueTypeId;
    }

    public int getProjId() {
        return projId;
    }

    public void setProjId(int projId) {
        this.projId = projId;
    }

    public String getProjName() {
        return projName;
    }

    public void setProjName(String projName) {
        this.projName = projName;
    }

    public boolean isOver() {
        return over;
    }

    public void setOver(boolean over) {
        this.over = over;
    }

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    @Override
    public String execute() throws Exception {

        if (StringUtils.isBlank(getIssueKey())) {
            setOver(true);
        }

        IssueBO issueBo = IssueBO.getIssueBO();
        Issue issueW = new Issue();
        Issuehbm issue = issueBo.getIssueByKey(getIssueKey());
        ProjectBO projectBo = ProjectBO.getProjectBO();
        Projecthbm project = issue.getProject();
        List<Projecthbm> projectList = projectBo.getProjectList();
        IssueTypeBO issueTypeBo = IssueTypeBO.getIssueTypeBO();
        IssueTypehbm issueType = issue.getIssueType();
        List<IssueTypehbm> issueTypeList = issueTypeBo.getIssueTypeList();
        IssueStatusBO issueStatusBo = IssueStatusBO.getIssueStatusBO();
        IssueStatushbm issueStatus = issue.getIssueStatus();
        issue.getIssueStatus().setDescription(issueStatus.getName());
        setProjName(project.getName());
        setProjId(project.getId());
        setIssueTypeName(issueType.getName());
        setIssueTypeId(issueType.getId());

        ActionContext cx = ActionContext.getContext();
        cx.put("projList", projectList);
        cx.put("issueTypeList", issueTypeList);

        return SUCCESS;
    }

}
