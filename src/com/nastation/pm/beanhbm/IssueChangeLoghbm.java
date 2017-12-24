package com.nastation.pm.beanhbm;

public class IssueChangeLoghbm {

    private int id;
    private Issuehbm issue;
    private String changeField;
    private String oldValue;
    private String newValue;
    private java.util.Date createDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Issuehbm getIssue() {
        return issue;
    }

    public void setIssue(Issuehbm issue) {
        this.issue = issue;
    }

    public String getChangeField() {
        return changeField;
    }

    public void setChangeField(String changeField) {
        this.changeField = changeField;
    }

    public String getOldValue() {
        return oldValue;
    }

    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }

    public String getNewValue() {
        return newValue;
    }

    public void setNewValue(String newValue) {
        this.newValue = newValue;
    }

    public java.util.Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(java.util.Date createDate) {
        this.createDate = createDate;
    }

}
