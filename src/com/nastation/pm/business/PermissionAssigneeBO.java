package com.nastation.pm.business;

import java.util.*;
import java.sql.*;

import com.nastation.pm.bean.*;
import com.nastation.pm.util.*;

import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;
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

	
	public List<PermissionAssignee> getAssigneeTypeList(int permissionId,int schemeId) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<PermissionAssignee> l = null;
		try {
			tx = session.beginTransaction();
			l = session.createQuery("from PermissionAssignee as p where p.permissionId.id=:pid and p.schemeId.id=:sid")
					.setInteger("pid", permissionId).setInteger("sid",schemeId).list();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return l;
	}
	
	
	/**
	 * 添加一个权限分配
	 * @author sun
	 * @param assignee
	 */

	
	public void addPermissionAssignee(PermissionAssignee assignee) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(assignee);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}
	
	/**
	 * 删除一个权限分配
	 * @author sun
	 * @param id
	 */

	
	public void deletePermission(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(session.load(PermissionAssignee.class, id));
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}
	/**
	 * 获得一个权限分配的详细信息
	 * @author sun
	 * @param id
	 */

	public PermissionAssignee getPermissionAssignee(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		PermissionAssignee p = null;
		try {
			tx = session.beginTransaction();
			p = session.load(PermissionAssignee.class, id);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return p;
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
//	public List<PermissionAssignee> getAllPermissionAssignee(int schemeId){
//		List<PermissionAssignee> list = new ArrayList();
//		Connection conn=DBConn.getConnection();
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		String sql="select * from t_permission_assignee where scheme_id=?";
//		try{
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setInt(1, schemeId);
//			rs=pstmt.executeQuery();
//			while(rs.next()){
//				PermissionAssignee pa=new PermissionAssignee();
//				pa.setId(rs.getInt("id"));
//				pa.setPermissionId(rs.getInt("permission_id"));
//				pa.setAssigneeType(rs.getString("assignee_type"));
//				pa.setAssignee(rs.getString("assignee"));
//				pa.setSchemeId(rs.getInt("scheme_id"));
//				pa.setCreateTime(rs.getString("create_time"));
//				list.add(pa);
//			
//			}
//		}catch(SQLException e){
//			e.printStackTrace();
//			
//		}finally{
//			DBConn.closeConn(conn);
//		}
//		return list;
//	}
	public List<PermissionAssignee> getAllPermissionAssignee(int schemeId) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<PermissionAssignee> l = null;
		try {
			tx = session.beginTransaction();
			l = session.createQuery("from PermissionAssignee as p where p.schemeId.id=:id").setInteger("id", schemeId).list();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return l;
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
				pstmt.setInt(1, pa.getPermissionId().getId());
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

	
	public boolean exist(PermissionAssignee pa) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			PermissionAssignee p = (PermissionAssignee)session.createQuery("from PermissionAssignee as p where p.permissionId.id=:pid and p.assigneeType=:at and p.assignee=:a and p.schemeId.id=:sid")
					.setInteger("pid", pa.getPermissionId().getId()).setString("at",pa.getAssigneeType()).setString("a", pa.getAssignee()).setInteger("sid",pa.getSchemeId().getId()).uniqueResult();
			
			if(p != null) {
				return true;
			}
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return false;
	}
	/**
	 * 获得指定权限模板中指定权限的分配列表。
	 * @author liuliehui
	 * @param schemeId
	 */

	
	public List<PermissionAssignee> getPermissionAssigneeList(int schemeId) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<PermissionAssignee> l = null;
		try {
			tx = session.beginTransaction();
			l = session.createQuery("from PermissionAssignee as p where p.schemeId.id=:id").setInteger("id", schemeId).list();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return l;
	}
	
	/**
	 * 获得指定组中指定权限的分配列表信息。
	 * @author liuliehui
	 * @param assigneeType ,assignee
	 */
	
	
	public List<PermissionAssignee> getGroupInPermissionAssigneeList(String assigneeType,String assignee) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<PermissionAssignee> l = null;
		try {
			tx = session.beginTransaction();
			l = session.createQuery("from PermissionAssignee as p where p.assigneeType=:at and p.assignee=:a").setString("at", assigneeType).setString("a", assignee).list();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return l;
	}
	
	
}
