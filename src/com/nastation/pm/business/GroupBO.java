/**
 * 功能:用户组的业务逻辑类
 * @author liuliehui
 */
package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Group;
import com.nastation.pm.util.*;

public class GroupBO {
	
	/**
	 * 添加组
	 */
	public void addGroup(String groupName){
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into t_group(name,permission_scheme_id,create_date) values(?,?,?)";
		System.out.println("=============34=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, groupName);
			pstmt.setNull(2,Types.NULL);
			pstmt.setString(3,StringUtils.getCurrDate());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		
	}


	/**
	 * 得到所有用户组
	 * 得到group对象集合groupList
	 */
	
	public List<Group> getViewGroups(){
		List<Group> groupList = new ArrayList<Group>();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select a.id,a.name,a.permission_scheme_id,a.create_date,b.name,COUNT(c.user_id)"
			+" from t_group a left join t_permission_scheme b on (a.permission_scheme_id=b.id)"
			+" left join t_group_user c on (a.id=c.group_id) group by a.id";
		System.out.println("=============34=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Group group = new Group();
				group.setId(rs.getInt("a.id"));
				group.setName(rs.getString("a.name"));
				group.setPermissionSchemeId(rs.getInt("a.permission_scheme_id"));
				group.setCreateDate(rs.getString("a.create_date"));
				group.setPermissionSchemeName(rs.getString("b.name"));
				group.setUserCount(rs.getInt("count(c.user_id)"));
				groupList.add(group);
				System.out.println("=============69====groupList=====" + groupList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return groupList;
	}

	/**
	 * 浏览所有用户组
	 * 查询组中用户ID为userId的group对象集合groupList
	 */
	
	public List<Group> getUserGroupName(int userId){
		List<Group> userGroupList = new ArrayList<Group>();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select a.id,a.name,a.permission_scheme_id,a.create_date,b.name"
			+" from t_group a left join t_permission_scheme b on (a.permission_scheme_id=b.id)"
			+" left join t_group_user c on (a.id=c.group_id) where c.user_id=?";
		System.out.println("=============93=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Group group = new Group();
				group.setId(rs.getInt("a.id"));
				group.setName(rs.getString("a.name"));
				group.setPermissionSchemeId(rs.getInt("a.permission_scheme_id"));
				group.setCreateDate(rs.getString("a.create_date"));
				group.setPermissionSchemeName(rs.getString("b.name"));
				userGroupList.add(group);
				System.out.println("=============107====groupList=====" + userGroupList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return userGroupList;
	}

	/**
	 * 得到所有组名为groupName用户组
	 * 查询组中组名为groupName的group对象集合groupList
	 */
	
	public List<Group> getUserGroup(String groupName){
		List<Group> userGroupList = new ArrayList<Group>();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select a.id,a.name,a.permission_scheme_id,a.create_date,b.name,c.user_id,c.id,"
			+ "d.username,d.fullname,d.email"
			+" from t_group a left join t_permission_scheme b on (a.permission_scheme_id=b.id)"
			+" left join t_group_user c on (a.id=c.group_id) left join t_user d on(c.user_id=d.id)"
			+" where a.name=?";
		System.out.println("=============130=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,groupName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Group group = new Group();
				group.setId(rs.getInt("a.id"));
				group.setName(rs.getString("a.name"));
				group.setPermissionSchemeId(rs.getInt("a.permission_scheme_id"));
				group.setCreateDate(rs.getString("a.create_date"));
				group.setPermissionSchemeName(rs.getString("b.name"));
				group.setUserId(rs.getInt("c.user_id"));
				group.setGroupUserId(rs.getInt("c.id"));
				group.setUserName(rs.getString("d.username"));
				group.setUserFullName(rs.getString("d.username"));
				group.setUserEmail(rs.getString("d.email"));
				userGroupList.add(group);
				System.out.println("=============145====groupList=====" + userGroupList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return userGroupList;
	}
	
	/**
	 * 判断用户组是否存在;如果存在返回true;否则返回false;
	 * 
	 */
	
	public boolean groupNameExit(String groupName){
		Connection conn = DBConn.getConnection();
		boolean flag = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_group where name=?";
		System.out.println("=============130=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,groupName);
			rs = pstmt.executeQuery();
			if(rs.next()){
                 flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return flag;
	}

	/**
	 * 得到组名为groupName的Group对象
	 *
	 */
	
	public Group getGroup(String groupName){
		Group group = new Group();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from t_group where name=?";
		System.out.println("=============130=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,groupName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				group.setId(rs.getInt("id"));
				group.setName(rs.getString("name"));
				group.setPermissionSchemeId(rs.getInt("permission_scheme_id"));
				group.setCreateDate(rs.getString("create_date"));
				System.out.println("=============145====groupList=====" + group);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return group;
	}
	
	/**
	 * 得到组名为groupName的Group对象
	 * 这个信息比较全
	 *
	 */
	
	public Group getGroupInformation(String groupName){
		Group group = new Group();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select a.id,a.name,a.permission_scheme_id,a.create_date,b.name,COUNT(c.user_id) as 'countUserId',"
			+"c.user_id,d.username,d.fullname,d.email"
			+" from t_group a left join t_permission_scheme b on (a.permission_scheme_id=b.id)"
			+" left join t_group_user c on (a.id=c.group_id) left join t_user d on(c.user_id=d.id)"
			+" group by a.id HAVING a.name=?";
		System.out.println("=============130=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,groupName);
			rs = pstmt.executeQuery();
			while(rs.next()){
				group.setId(rs.getInt("id"));
				group.setName(rs.getString("name"));
				group.setPermissionSchemeId(rs.getInt("permission_scheme_id"));
				group.setCreateDate(rs.getString("create_date"));
				group.setPermissionSchemeName(rs.getString("b.name"));
				group.setUserCount(rs.getInt("countUserId"));
				group.setUserId(rs.getInt("c.user_id"));
				group.setUserName(rs.getString("d.username"));
				group.setUserFullName("d.fullname");
				group.setUserEmail(rs.getString("d.email"));
				System.out.println("=============248====group=====" + group);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return group;
	}
	/**
	 * 删除组ID为的GroupID组
	 *
	 */
	
	public void deleteGroup(int groupId){
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from t_group where id=?";
		System.out.println("============delete group=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,groupId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
	}
	/**
	 * 浏览所有用户组
	 * 查询组中用户ID为不为userId的group对象集合groupList
	 */
	
	public List<Group> getUserGroupList(int userId){
		List<Group> userGroupList = new ArrayList<Group>();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select t_group.id,t_group.name from t_group where t_group.id not in(select a.id"
			+" from t_group a left join t_permission_scheme b on (a.permission_scheme_id=b.id)"
			+" left join t_group_user c on (a.id=c.group_id) where c.user_id=?)";
		System.out.println("=============93=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Group group = new Group();
				group.setId(rs.getInt("t_group.id"));
				group.setName(rs.getString("t_group.name"));
				userGroupList.add(group);
				System.out.println("=============107====groupList=====" + userGroupList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return userGroupList;
	}

}
