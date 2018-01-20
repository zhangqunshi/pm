package com.nastation.pm.struts.frontend.issue;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.PageContext;

import org.apache.struts2.ServletActionContext;

import com.nastation.pm.Global;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.bean.User;
import com.nastation.pm.business.IssueBO;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueNavigatorRAction extends ActionSupport {
    private int projectId;
    private String action;

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    @Override
    public String execute() throws Exception {
        IssueBO issueBO = IssueBO.getIssueBO();
        User user = (User) ActionContext.getContext().getSession().get(Global.SESSION_USER);
        List<Issue> issueList = null;
        if ("all".equals(getAction())) {
            issueList = issueBO.getIssueDetailList(getProjectId());
        } else if ("forMe".equals(getAction())) {
            issueList = issueBO.getIssueListByAssigneeId(user.getId());
        } else if ("inProgress".equals(getAction())) {
            issueList = issueBO.getIssueInProgressList(user.getId());
        }

        if (StringUtils.isBlank(getAction())) {
            issueList = (List) ActionContext.getContext().get("issueList");
        }

        if (issueList == null) {
            IssueFilter filterR = (IssueFilter) ActionContext.getContext().getSession().get(Global.SESSION_FILTER);
            if (filterR != null) {
                if (filterR.isSaved()) {
                    issueList = issueBO.getIssueByFilterId(filterR.getId());
                } else {
                    issueList = issueBO.getIssueSearchList(filterR.getRequestContent(), filterR.getParamValues());
                }
            }
        }
        PageContext page = ServletActionContext.getPageContext();
        page.setAttribute("issueList", issueList);
        List<IssueNavigatorR> inList = new ArrayList<>();
        if (issueList != null) {
            String trClassName = null;
            for (int i = 0; i < issueList.size(); i++) {
                IssueNavigatorR in = new IssueNavigatorR();
                Issue issue = (Issue) issueList.get(i);
                in.setIssues(issue);
                if (i % 2 == 0) {
                    trClassName = "rowAlternate";
                } else {
                    trClassName = "rowNormal";
                }
                in.setClassName(trClassName);
                inList.add(in);
            }
        }
        ActionContext cx = ActionContext.getContext();
        cx.put("issues", inList);

        return SUCCESS;
    }

}
