package com.nastation.pm.business;
import java.util.*;
import java.sql.*;
import com.nastation.pm.bean.*;
import com.nastation.pm.util.*;
/**
 * Permission business object.
 * @author sun
 *
 */
		
public class PermissionBO {
    
	/**
	 * get all permission 
	 * @return list
	 */
	public List<Permission> getAllPermission(){
		List<Permission> list = new ArrayList();
		Connection conn=DBConn.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		String sql="select * from t_permission";
		try{
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()){
				Permission permission = new Permission();
				permission.setId(rs.getInt("id"));
				permission.setName(rs.getString("name"));
				permission.setDescription(rs.getString("description"));
				permission.setTypeName(rs.getString("type_name"));
				list.add(permission);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return list;
	}
	/**
	 * 获得所有权限，按权限类型分类。以类型名为Key，该类型下的所有权限列表为Value.
	 * @author sun
	 * @return 
	 */
	public HashMap<String,List> getAllTypeList(int schemeId){
		HashMap hashMap=new HashMap();
		Connection conn=DBConn.getConnection();
		Statement stmt=null;
		PreparedStatement pstmt=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		String sql="select distinct type_name from t_permission";
		String sql2="select * from t_permission where type_name=?";
		try{
			stmt=conn.createStatement();
			rs1=stmt.executeQuery(sql);
			while(rs1.next()){
				String type=rs1.getString("type_name");
				List list=new ArrayList();
				pstmt=conn.prepareStatement(sql2);
				pstmt.setString(1, type);
				rs2=pstmt.executeQuery();
				while(rs2.next()){
					Permission permission=new Permission();
					permission.setId(rs2.getInt("id"));
					permission.setName(rs2.getString("name"));
					permission.setDescription(rs2.getString("description"));
					permission.setTypeName(rs2.getString("type_name"));
					list.add(permission);
				}
				hashMap.put(type, list);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBConn.closeConn(conn);
		}
		return hashMap;
	}
	
	
}
