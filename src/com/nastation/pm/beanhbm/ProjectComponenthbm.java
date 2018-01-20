package com.nastation.pm.beanhbm;

/**
 * @author weiboyuan 项目模块java bean
 */
public class ProjectComponenthbm {

    public int id;
    public String name;
    public Projecthbm project;
    public String description;
    public String leader;
    public java.util.Date createDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Projecthbm getProject() {
        return project;
    }

    public void setProject(Projecthbm project) {
        this.project = project;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public java.util.Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(java.util.Date createDate) {
        this.createDate = createDate;
    }

}
