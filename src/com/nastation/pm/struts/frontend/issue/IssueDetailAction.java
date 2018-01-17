package com.nastation.pm.struts.frontend.issue;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.util.StringUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IssueDetailAction extends ActionSupport {
    private String projName;
    private String createDate;
    private String lastUpdateDate;
    private String planEndTime;
    private String issueName;
    private String componentName;
    private String enviroment;
    private String description;

    public String getProjName() {
        return projName;
    }

    public void setProjName(String projName) {
        this.projName = projName;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(String lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public String getPlanEndTime() {
        return planEndTime;
    }

    public void setPlanEndTime(String planEndTime) {
        this.planEndTime = planEndTime;
    }

    public String getIssueName() {
        return issueName;
    }

    public void setIssueName(String issueName) {
        this.issueName = issueName;
    }

    public String getComponentName() {
        return componentName;
    }

    public void setComponentName(String componentName) {
        this.componentName = componentName;
    }

    public String getEnviroment() {
        return enviroment;
    }

    public void setEnviroment(String enviroment) {
        this.enviroment = enviroment;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String execute() throws Exception {

        Issue issueR = (Issue) ActionContext.getContext().get("issue");
        if (issueR == null) {
            return ERROR;
        }
        setProjName(issueR.getProjectName());
        setCreateDate(issueR.getCreateDate());
        setLastUpdateDate(issueR.getLastUpdateDate());
        setPlanEndTime(issueR.getPlanEndTime());
        setDescription(StringUtils.replaceNewLineToBr(issueR.getDescription()));
        setComponentName(issueR.getComponentName());
        setEnviroment(issueR.getEnvironment());

        return SUCCESS;
    }

}
