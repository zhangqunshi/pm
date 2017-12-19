package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Project;
import com.nastation.pm.bean.ProjectCategory;
import com.nastation.pm.bean.Role;
import com.nastation.pm.util.DBConn;
import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;
import com.nastation.pm.util.*;

public class ProjectCategoryBO {
	/**
	 * 创建一个项目类型
	 */

	public void addProjectCategory(ProjectCategory category) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(category);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
	}

	/**
	 * 通过一个ID获得对应的项目类型
	 */

	public ProjectCategory getProjectCategory(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		ProjectCategory pc2 = new ProjectCategory();
		try {
			tx = session.beginTransaction();
			pc2 = session.load(ProjectCategory.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return pc2;
	}

	/**
	 * 检查是否创建了同名项目种类
	 */

	public boolean checkProjectCategory(ProjectCategory category) {
		boolean flag = true;
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<ProjectCategory> pcList = new ArrayList<>();
		String name = category.getName();
		System.out.println(name + "---------分类名字");
		try {
			tx = session.beginTransaction();
			ProjectCategory pc = (ProjectCategory) session.createQuery("from ProjectCategory as p where p.name=:name")
					.setString("name", name).setMaxResults(1).uniqueResult();
			tx.commit();
			if (pc != null) {
				flag = false;
			}
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return flag;
	}

	/**
	 * 获得数据库中所有的项目种类信息
	 */

	public List<ProjectCategory> getCategoryList() {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<ProjectCategory> pcList = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			pcList = session.createQuery("from ProjectCategory").list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return pcList;
	}

	/**
	 * 删除对应ID的项目种类
	 */

	public void deleteCategory(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(session.load(ProjectCategory.class, id));
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
	}

	/**
	 * 更新项目种类
	 */

	public void updateCategory(ProjectCategory category) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.update(category);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
	}

	/**
	 * 通过名字获得一个项目分类
	 * 
	 */

	public ProjectCategory getProjectCategory(String name) {
		ProjectCategory category = new ProjectCategory();
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			category = (ProjectCategory) session.createQuery("from ProjectCategory as p where p.name=:name")
					.setString("name", name).uniqueResult();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return category;
	}

	/**
	 * 查询与此分类有关的所有项目
	 */

	public List<Project> getAllProject(int categoryId) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List<Project> pList = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			pList = session.createQuery("from Project as p where p.categoryId.id=:id").setInteger("id", categoryId)
					.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return pList;
	}

	/**
	 * 删除与项目有关联的项目分类
	 */

	public void deleteProjectCategoryForLinkProject(int id) {
		this.deleteCategory(id);
	}

	/**
	 * 判断此分类是否与其他项目有关联
	 */

	public boolean checkLinkProject(int categoryId) {
		boolean flag = false;
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		Project proj = new Project();
		try {
			tx = session.beginTransaction();
			proj = (Project) session.createQuery("from Project as p where p.categoryId.id=:id")
					.setInteger("id", categoryId).setMaxResults(1).uniqueResult();
			tx.commit();
			System.out.println(proj + "-----------checkLinkProject");
			if (proj != null) {
				flag = true;
			}
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return flag;
	}

	/**
	 * 判断名字是否已经存在
	 * 
	 */

	public boolean exists(String name) {
		boolean flag = false;
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			ProjectCategory pc = (ProjectCategory) session.createQuery("from ProjectCategory as p where p.name=:name")
					.setString("name", name).setMaxResults(1).uniqueResult();
			tx.commit();
			if (pc != null) {
				flag = true;
			}
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
		}
		return flag;
	}

}
