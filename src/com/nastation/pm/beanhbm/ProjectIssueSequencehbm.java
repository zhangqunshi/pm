package com.nastation.pm.beanhbm;

public class ProjectIssueSequencehbm {

    private int id;
    private Projecthbm project;
    private Integer maxIdValue;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Projecthbm getProject() {
        return project;
    }

    public void setProject(Projecthbm project) {
        this.project = project;
    }

    public Integer getMaxIdValue() {
        return maxIdValue;
    }

    public void setMaxIdValue(Integer maxIdValue) {
        this.maxIdValue = maxIdValue;
    }

}
