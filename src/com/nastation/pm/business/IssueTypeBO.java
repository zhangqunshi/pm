package com.nastation.pm.business;

/**
 * 功能：问题的业务逻辑类
 * @author 许希光
 * 
 */
import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Icon;
import com.nastation.pm.bean.IssueType;
import com.nastation.pm.util.DBConn;


import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;
import com.nastation.pm.util.*;


public class IssueTypeBO {

	/**
	 * 向数据库中添加记录 IssueType 对象
	 */

	
	public void addIssueType(IssueType issueType) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(issueType);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}
	

	/**
	 * 根据 Id ，更新已知的记录IssueType 对象
	 */

	
	public void updateIssueType(IssueType issueType) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(issueType);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}

	/**
	 * 删除对应ID的IssueType 对象
	 */

	
	public void deleteIssueType(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(session.load(IssueType.class, id));
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}

	/**
	 * 根据已知的 name ，获得IssueType对象
	 */

	
	public IssueType getIssueType(String name) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		IssueType it = null;
		try {
			tx = session.beginTransaction();
			it = (IssueType)session.createQuery("from IssueType where name=:name").setString("name", name).uniqueResult();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return it;
	}
	
	

	/**
	 * 根据已知的 id ，获得 IssueType 对象
	 */

	
	public IssueType getIssueType(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		IssueType it2 = new IssueType();
		
		try {
			tx = session.beginTransaction();
			it2 = session.load(IssueType.class, id);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return it2;
	}

	/**
	 * 获得问题类型列表 List
	 */

	
	public List<IssueType> getIssueTypeList() {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<IssueType> it2List = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			it2List = session.createQuery("from IssueType").list();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return it2List;
	}

	/**
	 * 检查是否创建了同名IssueType
	 */

	
	public boolean checkIssueType(IssueType issueType) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			IssueType it = (IssueType)session.createQuery("from IssueType where name=:name").setString("name", issueType.getName()).uniqueResult();
			if(it != null) {
				return false;
			}
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return true;
	}

	/**
	 * 检查是否创建了同名IssueType
	 */
	public boolean exist(IssueType issueType) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select id from t_issue_type where name=? and id!=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, issueType.getName());
			ps.setInt(2, issueType.getId());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return false;
	}

	/**
	 * 获得此图片类型的list
	 * 
	 * @return
	 */

	
	public List<Icon> getIconList() {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<Icon> l = null;
		try {
			tx = session.beginTransaction();
			l = session.createQuery("from Icon where iconType=:i").setInteger("i", 2).list();
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
	 * 根据icon
	 * 获得问题类型列表 List
	 */

	
	public List<IssueType> getIssueTypeListByIcon(Icon icon) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<IssueType> l = null;
		try {
			tx = session.beginTransaction();
			l = session.createQuery("from IssueType as i where i.iconUrl:i").setString("i", icon.getFileName()).list();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return l;
	}
	
	
	
	
	
	public static void main(String[] args) {
		
	}
	
	
	
	
	
	

}
