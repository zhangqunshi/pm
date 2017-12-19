package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Resolution;
import com.nastation.pm.util.DBConn;

import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;
import com.nastation.pm.util.*;


/**
 * 问题Resolution的业务逻辑类
 * 
 * @author Kris
 * @version 2008-12-27
 * @see Resolution
 */
public class ResolutionBO {

	/**
	 * 向数据库中添加Resolution 对象
	 */

	
	
	public void addResolution(Resolution resolution) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(resolution);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}

	/**
	 * Get all resolution
	 * 
	 * @return
	 */

	
	public List<Resolution> getAllResolutions() {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<Resolution> r2List = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			r2List = session.createQuery("from Resolution").list();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return r2List;
	}

	/**
	 * 更改resolution的一条记录为默认
	 * 
	 * @return
	 */
	public void updateResolutionDefault(int isDefault) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		int count = 0;
		ResultSet rs = null;
		try {
			String sql = "update t_resolution set is_default=?";
			System.out.println("========102====sql=======" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			count = pstmt.executeUpdate();
			if (count > 0) {
				String sql2 = "update t_resolution set is_default=? where id=?";
				System.out.println("========108====sql2=======" + sql2);
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, 1);
				pstmt2.setInt(2, isDefault);
				pstmt2.executeUpdate();
				pstmt2.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.closeConn(conn);
		}
	}

	/**
	 * get resolution by id
	 * 
	 * @param id
	 */

	
	public Resolution getResolution(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		Resolution r2 = new Resolution();
		try {
			tx = session.beginTransaction();
			r2 = session.load(Resolution.class, id);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return r2;
	}
	
	

	/**
	 * update resolution
	 * 
	 * @param resolution
	 */

	
	public Resolution updateResolution(Resolution resolution) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(resolution);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return resolution;
	}

	/**
	 * check resolution
	 * 
	 * @return
	 */

	
	public boolean checkExistResolution(Resolution resolution) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		boolean flag =false;
		try {
			tx = session.beginTransaction();
			List<Resolution> rList = session.createQuery("from Resolution as r where r.name=:name and r.id<>:id")
					.setString("name", resolution.getName()).setInteger("id", resolution.getId()).list();
			tx.commit();
			if(rList.get(0) != null) {
				flag = true;
			}
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return flag;
	}

	/**
	 * check all resolution
	 * 
	 * @return
	 */
	public List getIssueByLinkIssue(int id) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		List list = new ArrayList();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue where resolution_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Resolution r = new Resolution();
				r.setId(rs.getInt("id"));
				r.setName(rs.getString("name"));
				r.setDescription(rs.getString("description"));
				r.setIsDefault(rs.getInt("is_default"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.closeConn(conn);
		}
		return list;
	}

	/**
	 * 向数据库中删除Resolution 对象
	 */

	public void deleteResolution(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(session.load(Resolution.class, id));
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}
	
	
	
	
	public static void main(String[] args) {
		
		ResolutionBO rBO = new ResolutionBO();
		Resolution r2 = rBO.getResolution(7);
		
		boolean bb = rBO.checkExistResolution(r2);
		System.out.println(bb);
		
//		Resolution r22 = new Resolution();
//		r22.setName("uu");
//		rBO.addResolution(r22);
		
		
	}
	
	
	
	
	
	
}