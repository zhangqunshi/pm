package com.nastation.pm.bean;

/**
 * 功能：Issue 状态的封装类
 * @author 许希光
 *
 */
public class IssueStatus {
	private int id;              // 状态id
    private String name;         // 状态名称
    private String description;  //  状态的描述
    private String iconUrl;      // 状态的图标
    
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
	public String getIconUrl() {
		return iconUrl;
	}
	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}
    
    
}
