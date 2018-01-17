package com.nastation.pm.struts.frontend.issue;

import com.opensymphony.xwork2.ActionSupport;

public class DoSearchIssueAction extends ActionSupport {
    private String mode;
    private String show;
    private String hide;
    private int pid;
    private String type;
    private String query;
    private String summary;
    private String description;
    private String body;
    private String enviroment;
    private String reporterSelect;
    private String reporter;
    private String assigneeSelect;
    private String assignee;
    private String status;
    private String resolution;
    private String priority;
    private String createdafter;
    private String createbefore;
    private String duedateafter;
    private String duedatebefore;

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getShow() {
        return show;
    }

    public void setShow(String show) {
        this.show = show;
    }

    public String getHide() {
        return hide;
    }

    public void setHide(String hide) {
        this.hide = hide;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getEnviroment() {
        return enviroment;
    }

    public void setEnviroment(String enviroment) {
        this.enviroment = enviroment;
    }

    public String getReporterSelect() {
        return reporterSelect;
    }

    public void setReporterSelect(String reporterSelect) {
        this.reporterSelect = reporterSelect;
    }

    public String getReporter() {
        return reporter;
    }

    public void setReporter(String reporter) {
        this.reporter = reporter;
    }

    public String getAssigneeSelect() {
        return assigneeSelect;
    }

    public void setAssigneeSelect(String assigneeSelect) {
        this.assigneeSelect = assigneeSelect;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getResolution() {
        return resolution;
    }

    public void setResolution(String resolution) {
        this.resolution = resolution;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getCreatedafter() {
        return createdafter;
    }

    public void setCreatedafter(String createdafter) {
        this.createdafter = createdafter;
    }

    public String getCreatebefore() {
        return createbefore;
    }

    public void setCreatebefore(String createbefore) {
        this.createbefore = createbefore;
    }

    public String getDuedateafter() {
        return duedateafter;
    }

    public void setDuedateafter(String duedateafter) {
        this.duedateafter = duedateafter;
    }

    public String getDuedatebefore() {
        return duedatebefore;
    }

    public void setDuedatebefore(String duedatebefore) {
        this.duedatebefore = duedatebefore;
    }

    @Override
    public String execute() throws Exception {
        // TODO Auto-generated method stub
        return super.execute();
    }

}
