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


import com.nastation.pm.bean.Group;
import com.nastation.pm.bean.User;
import com.nastation.pm.util.*;



import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;
import com.nastation.pm.util.*;
import java.util.*;

public class GroupBO {
  
	/**
	 * 添加组
	 */
	
	public void addGroup(String groupName) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		Group g2 = new Group();
		g2.setName(groupName);
		try {
			tx = session.beginTransaction();
			session.save(g2);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
	}

	/**
	 * 得到所有用户组 得到group对象集合groupList
	 */

	

	public List<Group> getViewGroups() {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<Group> gList = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			gList = session.createQuery("from Group").list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return gList;
	}

	/**
	 * 浏览所有用户组 查询组中用户ID为userId的group对象集合groupList
	 */

	

	public List<Group> getUserGroupName(int userId) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<Group> gList = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			List<Group> gl = session.createQuery("from Group").list();
			for (Group g2 : gl) {
				Set<User> ul = g2.getUsers();
				for (User u2 : ul) {
					if (u2.getId() == userId) {
						gList.add(g2);
					}
				}
			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return gList;
	}

	/**
	 * 得到所有组名为groupName用户组 查询组中组名为groupName的group对象集合groupList
	 */


	//public List<GroupHB> getUserGroup(String groupName)  之前的样子  
	public Group getUserGroup(String groupName) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		Group g = null;
		try {
			tx = session.beginTransaction();
			g = (Group)session.createQuery("from Group where name=:name").setString("name", groupName).uniqueResult();
					
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return g;
	}

	/**
	 * 判断用户组是否存在;如果存在返回true;否则返回false;
	 * 
	 */


	
	public boolean groupNameExit(String groupName) {
		boolean flag = false;
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			Group g = (Group)session.createQuery("from Group where name=:name").setString("name", groupName).setMaxResults(1).uniqueResult();
			tx.commit();
			if(g != null) {
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
	 * 得到组名为groupName的Group对象
	 *
	 */


	
	public Group getGroup(String groupName) {
		
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		Group g = new Group();
		try {
			tx = session.beginTransaction();
			g = (Group)session.createQuery("from Group where name=:name").setString("name", groupName).setMaxResults(1).uniqueResult();
			tx.commit();
			
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return g;
	}

	/**
	 * 得到组名为groupName的Group对象 这个信息比较全
	 *
	 */


	
	public Group getGroupInformation(String groupName) {
		
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		Group g = new Group();
		try {
			tx = session.beginTransaction();
			g = (Group)session.createQuery("from Group where name=:name").setString("name", groupName).setMaxResults(1).uniqueResult();
			tx.commit();
			
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return g;
	}

	/**
	 * 删除组ID为的GroupID组
	 *
	 */


	
	public void deleteGroup(int groupId) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(session.load(Group.class, groupId));
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}

	/**
	 * 浏览所有用户组 查询组中用户ID不为userId的group对象集合groupList
	 */


	
	public List<Group> getUserGroupList(int userId) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<Group> gList = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			List<Group> gl = session.createQuery("from Group").list();
			for (Group g2 : gl) {
				Set<User> ul = g2.getUsers();
				for (User u2 : ul) {
					if (u2.getId() != userId) {
						gList.add(g2);
					}
				}
			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return gList;
	}
	


	
	
	public Group idGetGroup(int id) {
		
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		Group g = new Group();
		try {
			tx = session.beginTransaction();
			g = session.load(Group.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return g;
	}
	
	
	
	public static void main(String[] args) {
		GroupBO gBO = new GroupBO();
		UserBO uBO = new UserBO();
		
		List<Group> gs = gBO.getViewGroups();
		System.out.println(gs.get(0).getName()+"--------------------------1111");
		
		
//		System.out.println("++++++++++++++++++");
//		List<Group> gs = gBO.getViewGroups();
//		System.out.println("==================");
//		for(Group group : gs) {
//			
//			System.out.println(group.getName()+"-----------------");
//		}
		
//		Group g = gBO.testGet(1);
//		for(User u : g.getUsers()) {
//			System.out.println(u.getName()+"----------用户名");
//		}
		
		
//		Group g = new Group();
//		g.setName("xiaodingdang");
//		gBO.addGroup("xiaodingdang");
		

		// User u2 = uBO.getUser(1);
		// Group g2 = new Group();
		// g2.setName("kills");
		// List<User> uSet = new ArrayList<>();
		// uSet.add(u2);
		// g2.setUsers(uSet);
		// gBO.testAdd(g2);

		// gBO.addGroup("good");

		
//		List<GroupHB> gList = gBO.getUserGroupName(1);
//		for (GroupHB g2 : gList) {
//			System.out.println(g2.getName() + " = 组名");
//			for (User u2 : g2.getUsers()) {
//				System.out.println(u2.getId() + " = 用户ID");
//			}
//		}
  
	}

}
