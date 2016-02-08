package com.nastation.pm.bean;

/**
 * 功能：问题类型 bean 类,封装字段
 * @author 许希光
 *
 */
public class IssueType {
	
    private int id;               // 问题类型ID
    private String name;          // 类型名称
    private String description;   // 类型描述 
    private String iconUrl;      // 图标URL
    private String createDate;   // 该类型创建的时间
    
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
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}
