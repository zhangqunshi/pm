package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.beanhbm.Issuehbm;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.business.IssuePriorityBO;
import com.nastation.pm.business.IssueStatusBO;
import com.nastation.pm.business.IssueTypeBO;
import com.nastation.pm.business.ProjectBO;
import com.nastation.pm.business.UserBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MoveIssueConfirmAction extends ActionSupport {
    private String issueKey;

    public String getIssueKey() {
        return issueKey;
    }

    public void setIssueKey(String issueKey) {
        this.issueKey = issueKey;
    }

    @Override
    public String execute() throws Exception {

        Issue issue = (Issue) ActionContext.getContext().get("issue");
        if (issue == null) {
            return SUCCESS;
        }
        IssueBO issueBo = IssueBO.getIssueBO();
        String issueKey = issueBo.getMoveIssueDetail(issue.getProjectId());
        issue.setIssueKey(issueKey);
        UserBO uBo = UserBO.getUserBO();

        Issuehbm im = new Issuehbm();
        im.setAssignee(uBo.getUser(issue.getAssignee()));
        im.setComponentId(issue.getComponentId());
        im.setCreateDate(StringUtils.parseDate(issue.getCreateDate()));
        im.setDescription(issue.getDescription());
        im.setEndTime(StringUtils.parseDate(issue.getEndTime()));
        im.setEnvironment(issue.getEnvironment());
        im.setId(issue.getId());
        im.setIssueKey(issueKey);
        im.setIssueStatus(new IssueStatusBO().getIssueStatus(issue.getIssueStatus()));
        im.setIssueType(new IssueTypeBO().getIssueType(issue.getIssueTypeId()));
        im.setLastUpdateDate(StringUtils.parseDate(issue.getLastUpdateDate()));
        im.setName(issue.getName());
        im.setPlanEndTime(StringUtils.parseDate(issue.getPlanEndTime()));
        im.setPriorityLevel(new IssuePriorityBO().getIssuePriority(issue.getPriorityLevelId()));
        im.setProject(new ProjectBO().getProject(issue.getProjectId()));
        im.setReporter(uBo.getUser(issue.getReporter()));
        im.setResolutionId(issue.getResolutionId());
        im.setStartTime(StringUtils.parseDate(issue.getStartTime()));

        issueBo.updateMoveIssue(im);
        setIssueKey(java.net.URLEncoder.encode(issueKey, "UTF-8"));

        return SUCCESS;
    }

}
