package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.ProjectComponent;
import com.nastation.pm.util.DBConn;

import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;
import com.nastation.pm.util.*;
import com.nastation.pm.beanhbm.*;

/**
 * 新建项目模块
 *
 * @author weiboyuan
 *
 */
public class ProjectComponentBO {

    Connection conn = DBConn.getConnection();
    PreparedStatement pstmt = null;

    /**
     * 添加项目模块
     */
    public void addProjectComponent(ProjectComponenthbm pc) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(pc);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }

    /**
     * 检查项目模块名称是否相等
     */
    public boolean checkProjectComponent(ProjectComponenthbm pc) {
        boolean flag = true;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            List<ProjectComponent> pList = session.createQuery("from ProjectComponenthbm where name=:name")
                    .setString("name", pc.getName()).list();
            tx.commit();
            if (pList.size() > 1) {
                flag = false;
            }
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return flag;
    }

    /**
     * 获取模块表中数据
     */
    public List<ProjectComponenthbm> getProjectComponentList(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<ProjectComponenthbm> pList = null;

        try {
            tx = session.beginTransaction();
            pList = session.createQuery("from ProjectComponenthbm as p where p.projectId.projectId=:id")
                    .setInteger("id", id).list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return pList;
    }

    /**
     * 删除项目模块
     */
    public void deleteProjectComponent(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(session.load(ProjectComponenthbm.class, id));
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }

    /**
     * 删除所有项目模块
     */
    public void deleteAllProjectComponents(int projectId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.createQuery("delete from ProjectComponenthbm where project.id=:id")
                    .setInteger("id", projectId).executeUpdate();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }

    /**
     * 判断t_component表里是否存在projectId 如果存在就返回true，反之则返回false
     */
    public boolean checkProjectComponent2(int projectId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            ProjectComponent c = (ProjectComponent) session
                    .createQuery("from ProjectComponenthbm where project.id=:id").setInteger("id", projectId)
                    .setMaxResults(1).uniqueResult();
            if (c != null) {
                return true;
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return false;
    }

    /**
     * 更新项目模块
     */
    public void updateProjectComponent(ProjectComponenthbm pc) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(pc);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
    }

    /**
     * Id查找数据
     */
    public ProjectComponenthbm getProjectComponent(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        ProjectComponenthbm p2 = null;
        try {
            tx = session.beginTransaction();
            p2 = session.load(ProjectComponenthbm.class, id);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            session.close();
        }
        return p2;
    }

}
