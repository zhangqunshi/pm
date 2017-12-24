package com.nastation.pm.beanhbm;

/**
 * 问题Resolution
 *
 * @author Kris
 * @version 2008-12-27
 */
public class Resolutionhbm {

    private int id; // 问题类型ID
    private String name; // 类型名称
    private String description; // 类型描述
    private int isDefault; // 图标URL

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(int isDefault) {
        this.isDefault = isDefault;
    }

}
