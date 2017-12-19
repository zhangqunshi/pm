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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.nastation.pm.bean.Icon;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.IssuePriority;
import com.nastation.pm.bean.IssueStatus;
import com.nastation.pm.bean.IssueType;

import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;
import com.nastation.pm.util.*;


public class IssuePriorityBO {

	/**
	 * 向数据库中添加记录 IssuePriority 对象
	 */

	
	public void addIssuePriority(IssuePriority issuePriority) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(issuePriority);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}
	

	/**
	 * 更新已知的记录
	 */

	public void updateIssuePriority(IssuePriority issuePriority) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(issuePriority);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}
	

	/**
	 * 根据已知的 id ，获得IssuePriority对象
	 */

	
	public IssuePriority getIssuePriority(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		IssuePriority ip = new IssuePriority();
		try {
			tx = session.beginTransaction();
			ip = session.load(IssuePriority.class, id);
			
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return ip;
	}
	
	
	/**
	 * 根据已知的 name ，获得IssuePriority对象
	 */
	
	
	public IssuePriority getIssuePriority(String name) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		IssuePriority i= null;
		try {
			tx = session.beginTransaction();
			i = (IssuePriority)session.createQuery("from IssuePriority as i where i.name=:name").setString("name", name).uniqueResult();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return i;
	}
	

	/**
	 * 删除对应ID的IssuePriority 对象
	 */

	
	public void deleteIssuePriority(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(session.load(IssuePriority.class, id));
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}

	/**
	 * 获得问题优先级列表 List
	 */

	
	public List<IssuePriority> getIssuePriorityList() {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<IssuePriority> ipList = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			ipList = session.createQuery("from IssuePriority").list();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return ipList;
	}

	/**
	 * 检查是否创建了同名IssuePriority
	 */

	public boolean exist(IssuePriority ip) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		boolean flag =false;
		try {
			tx = session.beginTransaction();
			List<IssuePriority> list = session.createQuery("from IssuePriority as i where i.name=:name")
					.setString("name", ip.getName()).list();
			tx.commit();
			if(list.size() > 1) {
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
			l = session.createQuery("from Icon where iconType=:it").setInteger("it", 3).list();
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
	 * 根据icon 获得问题优先级列表 List
	 */
	
	
	public List<IssuePriority> getIssuePriorityListByIcon(Icon icon) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<IssuePriority> l = null;
		try {
			tx = session.beginTransaction();
			l = session.createQuery("from IssuePriority as i where i.iconUrl=:u").setString("u", icon.getFileName()).list();
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
		
		IssuePriorityBO ipBO = new IssuePriorityBO();
//		IssuePriority_2 pp = new IssuePriority_2();
//		pp.setName("qq");
//		ipBO.addIssuePriority(pp);
//		IssuePriority ip = ipBO.getIssuePriority(6);
//		boolean bb = ipBO.exist(ip);
//		System.out.println(bb);
	}
	
	
}
