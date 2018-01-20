package com.nastation.pm.struts.backend.project.category;

import java.util.List;

import com.nastation.pm.beanhbm.Projecthbm;

public class ViewProjectCategory {
    private int categoryId;
    private String categoryName;
    private String description;
    private List<Projecthbm> pList;

    public ViewProjectCategory() {
    }

    public ViewProjectCategory(int id, String name, String desc, List<Projecthbm> l) {
        this.categoryId = id;
        this.categoryName = name;
        this.description = desc;
        this.pList = l;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Projecthbm> getpList() {
        return pList;
    }

    public void setpList(List<Projecthbm> pList) {
        this.pList = pList;
    }

}
