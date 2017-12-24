package com.nastation.pm.bean;

/**
 * icon
 *
 * @author LuckyStar
 *
 */
public class Icon {

    private int id;// 编号
    private String fileName;//图片地址
    private int iconType;//图片类型

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getIconType() {
        return iconType;
    }

    public void setIconType(int iconType) {
        this.iconType = iconType;
    }

}
