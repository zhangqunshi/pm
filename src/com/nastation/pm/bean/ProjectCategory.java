package com.nastation.pm.bean;

/*
 * 定义个projectCategory的bean;
 */
public class ProjectCategory {
	private int id;// 项目类型ID
	private String name;// 项目类型名字
	private String description;// 项目类型描述
	private String createDate;// 项目类型创建日期

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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}
