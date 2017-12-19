package com.nastation.pm.bean;

import java.util.*;

/**
 * @author 孙重阳 User bean
 */
public class User {
	
	private int id; // User ID;
	private String name; // User name;
	private String password; // Password;  
	private String fullName; // User full name;
	private String email; // email;
	private java.util.Date createDate;
	private boolean admin;
	private HashMap<Integer, List<Permission>> permissions; // key is project id, value is
	
	// List<Permission>
	
	
	
	public java.util.Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(java.util.Date createDate) {
		this.createDate = createDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
		if(id == 1) {
			this.admin = true;
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public HashMap<Integer, List<Permission>> getPermissions() {
		return permissions;
	}

	public void setPermissions(HashMap<Integer, List<Permission>> permissions) {
		this.permissions = permissions;
	}

	/**
	 * 判断用户在某一项目中是否具有某一权限。权限取值可从com.nastation.pm.PermissionConstants.java中得到。
	 * 
	 * @param projectId
	 * @param permission
	 * @return
	 */
	public boolean validate(int projectId, String permission) {
		boolean flag = true;
//		List<String> pList = permissions.get(projectId);
//		if (pList != null) {
//			flag = pList.contains(permission);
//		}
		return flag;
	}

	@Override
	public String toString() {
		return "[User] id=" + id + ", name=" + name + ", fullName="
				+ fullName + ", email=" + email + ", createDate=";
	}

}
