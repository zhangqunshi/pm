package com.nastation.pm.bean;

/**
 * 功能：问题优先级 bean 类,封装字段
 * @author 许希光
 *
 */
public class IssuePriority {
	
    private int id;                // 问题优先级ID
    private String name;           // 优先级名称
    private String description;    // 优先级描述
    private String priorityColor; // 优先级颜色
    private String iconUrl;       // 优先级图标URL
    
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
	public String getPriorityColor() {
		return priorityColor;
	}
	public void setPriorityColor(String priorityColor) {
		this.priorityColor = priorityColor;
	}
	public String getIconUrl() {
		return iconUrl;
	}
	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}
    
	
}
