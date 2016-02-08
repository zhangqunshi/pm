package com.nastation.pm.business;

import java.util.*;
import java.sql.*;

import com.nastation.pm.bean.*;
import com.nastation.pm.util.*;
/**
 * 权限分配业务逻辑类。
 * @author sun
 *
 */
public class PermissionAssigneeBO {
	
	/**
	 * 获得指定权限模板中指定权限的分配列表。
	 * @author sun
	 * @param permissionId,schemeId
	 */
	public List<PermissionAssignee> getAssigneeTypeList(int permissionId,int schemeId){
		List<PermissionAssignee> list=new ArrayList();
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql="select * from t_permission_assignee where permission_id=? and scheme_id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,permissionId);
			pstmt.setInt(2, schemeId);
			rs=pstmt.executeQuery();
			while(rs.next()){
				PermissionAssignee assignee= new PermissionAssignee();
				assignee.setId(rs.getInt("id"));
				assignee.setPermissionId(rs.getInt("permission_id"));
				assignee.setSchemeId(rs.getInt("scheme_id"));
				assignee.setAssignee(rs.getString("assignee"));
				assignee.setAssigneeType(rs.getString("assignee_type"));
				assignee.setCreateTime(rs.getString("create_time"));
				list.add(assignee);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return list;
	}
	
	
	/**
	 * 添加一个权限分配
	 * @author sun
	 * @param assignee
	 */
	public void addPermissionAssignee(PermissionAssignee assignee){
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert t_permission_assignee(permission_id,assignee_type,assignee,scheme_id,create_time) values(?,?,?,?,?)";
	    try{
	    	pstmt=conn.prepareStatement(sql);
	    	pstmt.setInt(1, assignee.getPermissionId());
	    	pstmt.setString(2, assignee.getAssigneeType());
	    	pstmt.setString(3, assignee.getAssignee());
	    	pstmt.setInt(4, assignee.getSchemeId());
	    	pstmt.setString(5, assignee.getCreateTime());
	    	pstmt.executeUpdate();
	    }catch(SQLException e){
	    	e.printStackTrace();
	    }finally{
	    	DBConn.closeConn(conn);
	    }
	}
	
	/**
	 * 删除一个权限分配
	 * @author sun
	 * @param id
	 */
	public void deletePermission(int id){
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from t_permission_assignee where id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
	}
	/**
	 * 获得一个权限分配的详细信息
	 * @author sun
	 * @param id
	 */
	public PermissionAssignee getPermissionAssignee(int id){
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select a.id,a.permission_id,a.assignee_type,a.assignee,a.scheme_id,a.create_time,b.name"
			+" from t_permission_assignee a,t_permission b where a.permission_id=b.id and a.id=?";
		PermissionAssignee assignee = new PermissionAssignee();
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				assignee.setId(rs.getInt("id"));
				assignee.setAssignee(rs.getString("assignee"));
				assignee.setAssigneeType(rs.getString("assignee_type"));
				assignee.setCreateTime(rs.getString("create_time"));
				assignee.setPermission(rs.getString("name"));
				assignee.setPermissionId(rs.getInt("permission_id"));
				assignee.setSchemeId(rs.getInt("scheme_id"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return assignee;
	}
	/**
	 * 删除一个模板下的所有权限分配。
	 * @author sun
	 * @param schemeId
	 */
	public void deleteSchemePermission(int schemeId){
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from t_permission_assignee where scheme_id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, schemeId);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
	}
	
	/**
	 * 获得指定权限模板下的所有权限分配列表
	 * @param schemeId
	 * @author sun
	 */
	public List<PermissionAssignee> getAllPermissionAssignee(int schemeId){
		List<PermissionAssignee> list = new ArrayList();
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from t_permission_assignee where scheme_id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, schemeId);
			rs=pstmt.executeQuery();
			while(rs.next()){
				PermissionAssignee pa=new PermissionAssignee();
				pa.setId(rs.getInt("id"));
				pa.setPermissionId(rs.getInt("permission_id"));
				pa.setAssigneeType(rs.getString("assignee_type"));
				pa.setAssignee(rs.getString("assignee"));
				pa.setSchemeId(rs.getInt("scheme_id"));
				pa.setCreateTime(rs.getString("create_time"));
				list.add(pa);
			
			}
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally{
			DBConn.closeConn(conn);
		}
		return list;
	}
	/**
	 * 用于复制模板，将被复制模板的所有权限分配记录插入到数据库中。
	 * @author sun
	 * @param list
	 */
	public void addAllPermissionAssignee(List<PermissionAssignee> list,int schemeId){
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		String sql="insert t_permission_assignee(permission_id,assignee_type,assignee,scheme_id,create_time)"
			       +"values(?,?,?,"+schemeId+",curdate())";
		try{
			pstmt=conn.prepareStatement(sql);
			for(PermissionAssignee pa:list){
				pstmt.setInt(1, pa.getPermissionId());
				pstmt.setString(2, pa.getAssigneeType());
				pstmt.setString(3, pa.getAssignee());
				pstmt.executeUpdate();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
	}
	/**
	 * 判断一个权限分配是否已经存在
	 * @author sun
	 * @param permissionAssignee
	 */
	public boolean exist(PermissionAssignee pa){
		boolean flag=false;
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from t_permission_assignee where permission_id=? and assignee_type=? and assignee=? and scheme_id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pa.getPermissionId());
			pstmt.setString(2, pa.getAssigneeType());
			pstmt.setString(3, pa.getAssignee());
			pstmt.setInt(4, pa.getSchemeId());
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
	 * 获得指定权限模板中指定权限的分配列表。
	 * @author liuliehui
	 * @param schemeId
	 */
	public List<PermissionAssignee> getPermissionAssigneeList(int schemeId){
		List<PermissionAssignee> permissionAssigneeList = new ArrayList();
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql="select a.id,a.permission_id,a.assignee_type,a.assignee,a.scheme_id,a.create_time,"
			+" b.name,b.description,b.type_name,c.name,c.description,c.create_date"
			+" from t_permission_assignee a left join t_permission b on (a.permission_id=b.id)"
			+" left join t_permission_scheme c on(a.scheme_id=c.id) where a.scheme_id=?";
		System.out.println("=================sql=="+sql);
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,schemeId);
			rs=pstmt.executeQuery();
			while(rs.next()){
				PermissionAssignee assignee= new PermissionAssignee();
				assignee.setId(rs.getInt("a.id"));
				assignee.setPermissionId(rs.getInt("a.permission_id"));
				assignee.setAssigneeType(rs.getString("a.assignee_type"));
				assignee.setAssignee(rs.getString("a.assignee"));
				assignee.setSchemeId(rs.getInt("a.scheme_id"));
				assignee.setCreateTime(rs.getString("a.create_time"));
				assignee.setPermission(rs.getString("b.name"));
				assignee.setPermissionDescription(rs.getString("b.description"));
				assignee.setPermissionTypeName(rs.getString("b.type_name"));
				assignee.setSchemeName(rs.getString("c.name"));
				assignee.setSchemeDescription("c.description");
				assignee.setSchemeDateTime(rs.getString("c.create_date"));
				permissionAssigneeList.add(assignee);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return permissionAssigneeList;
	}
	/**
	 * 获得指定组中指定权限的分配列表信息。
	 * @author liuliehui
	 * @param assigneeType ,assignee
	 */
	public List<PermissionAssignee> getGroupInPermissionAssigneeList(String assigneeType,String assignee){
		List<PermissionAssignee> permissionAssigneeList = new ArrayList<PermissionAssignee>();
		Connection conn=DBConn.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql="select a.id,a.permission_id,a.assignee_type,a.assignee,a.scheme_id,a.create_time,"
			+" b.name,b.description,b.type_name,c.name,c.description,c.create_date"
			+" from t_permission_assignee a left join t_permission b on (a.permission_id=b.id)"
			+" left join t_permission_scheme c on(a.scheme_id=c.id) where a.assignee_type=? and a.assignee=?";
		System.out.println("=================sql=="+sql);
		System.out.println("=================assigneeType=="+assigneeType);
		System.out.println("=================assignee=="+assignee);
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,assigneeType);
			pstmt.setString(2,assignee);
			rs=pstmt.executeQuery();
			while(rs.next()){
				PermissionAssignee permissionAssignee= new PermissionAssignee();
				permissionAssignee.setId(rs.getInt("a.id"));
				permissionAssignee.setPermissionId(rs.getInt("a.permission_id"));
				permissionAssignee.setAssigneeType(rs.getString("a.assignee_type"));
				permissionAssignee.setAssignee(rs.getString("a.assignee"));
				permissionAssignee.setSchemeId(rs.getInt("a.scheme_id"));
				permissionAssignee.setCreateTime(rs.getString("a.create_time"));
				permissionAssignee.setPermission(rs.getString("b.name"));
				permissionAssignee.setPermissionDescription(rs.getString("b.description"));
				permissionAssignee.setPermissionTypeName(rs.getString("b.type_name"));
				permissionAssignee.setSchemeName(rs.getString("c.name"));
				permissionAssignee.setSchemeDescription("c.description");
				permissionAssignee.setSchemeDateTime(rs.getString("c.create_date"));
				permissionAssigneeList.add(permissionAssignee);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return permissionAssigneeList;
	}
	
}
