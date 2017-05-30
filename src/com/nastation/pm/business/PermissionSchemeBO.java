package com.nastation.pm.business;

import java.sql.*;
import java.util.*;

import com.nastation.pm.bean.PermissionScheme;
import com.nastation.pm.bean.Project;
import com.nastation.pm.util.*;

/**
 * 权限模板的业务逻辑类
 * 
 * @author sun
 */
public class PermissionSchemeBO {

	/**
	 * 添加一个权限模板
	 * 
	 * @param PermissionScheme
	 * @author sun
	 */
	public void addPermissionScheme(PermissionScheme scheme) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into t_permission_scheme (name,description,create_date) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, scheme.getName());
			pstmt.setString(2, scheme.getDescription());
			pstmt.setString(3, scheme.getCreateDate());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBConn.closeConn(conn);
		}
	}

	/**
	 * 更新一个权限模板
	 * 
	 * @param PermissionScheme
	 * @author sun
	 */
	public void updatePermissionScheme(PermissionScheme scheme) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "update t_permission_scheme set name=?,description=?,create_date=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, scheme.getName());
			pstmt.setString(2, scheme.getDescription());
			pstmt.setString(3, scheme.getCreateDate());
			pstmt.setInt(4, scheme.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBConn.closeConn(conn);
		}
	}

	/**
	 * 删除一个权限模板
	 * 
	 * @param id
	 * @author sun
	 */
	public void deletePermissionScheme(int id) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from t_permission_scheme where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBConn.closeConn(conn);
		}
	}

	/**
	 * 获得一个所有权限模板列表，每个权限模板包括模板信息以及使用这个模板的项目信息。
	 * 
	 * @author sun
	 */
	public List<PermissionScheme> getSchemeList() {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ProjectBO projectBO = new ProjectBO();
		ResultSet rs = null;
		List<PermissionScheme> schemeList = new ArrayList();
		try {
			String sql = "select * from t_permission_scheme";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PermissionScheme scheme = new PermissionScheme();
				scheme.setId(rs.getInt("id"));
				scheme.setName(rs.getString("name"));
				scheme.setDescription(rs.getString("description"));
				scheme.setCreateDate(rs.getString("create_date"));
				List<Project> list = projectBO.getProjectListByScheme(rs
						.getInt("id"));
				scheme.setProjectList(list);
				schemeList.add(scheme);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBConn.closeConn(conn);
		}
		return schemeList;
	}

	/**
	 * 获得一个 Scheme
	 * 
	 * @param id
	 * @author sun
	 */
	public PermissionScheme getScheme(int schemeId) {
		PermissionScheme scheme = new PermissionScheme();
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from t_permission_scheme where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, schemeId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				scheme.setId(schemeId);
				scheme.setName(rs.getString("name"));
				scheme.setDescription(rs.getString("description"));
				scheme.setCreateDate(rs.getString("create_date"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBConn.closeConn(conn);
		}
		return scheme;
	}
	
	/**
	 * 通过名称获得模板id
	 * 
	 * @param name
	 * @author sun
	 */
	public int getId(String name) {
		int id=0;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select id from t_permission_scheme where name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				id=rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return id;
	}
	
	/**
	 * 用于命名copy的新scheme名字。
	 * @param name
	 * @return
	 */
	public String renameScheme(String name) {
        boolean flag=true;
        int count=1;
        String prefix="Copy ";
        String rename="";
        if(count==1){
        	rename=prefix+"of "+name;
        }
        
        if(!exist(rename)){
        	return rename;
        }else{
	        while(flag){
	        	
	        	count++;
	        	rename=prefix+count+" of "+name;
	        	flag = exist(rename);
	        	
	        }
	        return rename;
        }
		
	}
	/**
	 * 判断一个模板名是否已经存在
	 * @author sun
	 */
	public boolean exist(String name){
		boolean flag=false;
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select name from t_permission_scheme where name=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs=pstmt.executeQuery();
			if(rs.next()){
				flag=true;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return flag;
	}
	
	/**
	 * 获得在组为groupName中的所有权限模板列表。
	 * 
	 * @author liuliehui
	 */
	public List<PermissionScheme> getPermissionSchemeList(String assigneeType,String assignee) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ProjectBO projectBO = new ProjectBO();
		ResultSet rs = null;
		List<PermissionScheme> schemeList = new ArrayList();
		try {
			String sql = "select * from t_permission_scheme where id in (select distinct a.scheme_id"
				+" from t_permission_assignee a where a.assignee_type=? and a.assignee=?)";
			System.out.println("=====================sql====="+sql);
			System.out.println("=====================assigneeType====="+assigneeType);
			System.out.println("=====================assignee====="+assignee);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,assigneeType);
			pstmt.setString(2,assignee);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PermissionScheme scheme = new PermissionScheme();
				scheme.setId(rs.getInt("id"));
				scheme.setName(rs.getString("name"));
				scheme.setDescription(rs.getString("description"));
				scheme.setCreateDate(rs.getString("create_date"));
				schemeList.add(scheme);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBConn.closeConn(conn);
		}
		return schemeList;
	}


}
