/**
 * 描述:用户组javaBean
 * @author liuliehui
 */
package com.nastation.pm.bean;

import java.util.*;

public class Group {
	private int id; // 组ID
	private String name; // 组名
	private int userCount; // 一个组对应的用户数
	private Set<User> users = new HashSet<>();
	private PermissionScheme permissionSchemeId; // 权限模板ID
	private java.util.Date createDate; // 创建日期
	//private String permissionSchemeName; // 权限模板名
	//private int schemeId;

	public Group() {

	}

//	public int getSchemeId() {
//		return schemeId;
//	}
//
//	public void setSchemeId(int schemeId) {
//		this.schemeId = schemeId;
//	}

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

	public int getUserCount() {
		return userCount;
	}

	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
		this.userCount = users.size();

	}

	public PermissionScheme getPermissionSchemeId() {
		return permissionSchemeId;
	}

	public void setPermissionSchemeId(PermissionScheme permissionSchemeId) {
		this.permissionSchemeId = permissionSchemeId;
		//this.permissionSchemeName = permissionSchemeId.getName();
		//this.schemeId = permissionSchemeId.getId();
	}

	public java.util.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}

//	public String getPermissionSchemeName() {
//		return permissionSchemeName;
//	}
//
//	public void setPermissionSchemeName(String permissionSchemeName) {
//		this.permissionSchemeName = permissionSchemeName;
//	}

}
