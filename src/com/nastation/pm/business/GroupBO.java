/**
 * 功能:用户组的业务逻辑类
 * @author liuliehui
 */
package com.nastation.pm.business;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.beanhbm.Grouphbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.util.SessionF;

public class GroupBO {

    /**
     * 添加组
     */

    public void addGroup(String groupName) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        Grouphbm g2 = new Grouphbm();
        g2.setName(groupName);
        try {
            tx = session.beginTransaction();
            session.save(g2);
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
    }

    /**
     * 得到所有用户组 得到group对象集合groupList
     */

    public List<Grouphbm> getViewGroups() {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<Grouphbm> gList = new ArrayList<>();
        try {
            tx = session.beginTransaction();
            gList = session.createQuery("from Grouphbm").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return gList;
    }

    /**
     * 浏览所有用户组 查询组中用户ID为userId的group对象集合groupList
     */

    public List<Grouphbm> getUserGroupName(int userId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<Grouphbm> gList = new ArrayList<>();
        try {
            tx = session.beginTransaction();
            List<Grouphbm> gl = session.createQuery("from Grouphbm").list();
            for (Grouphbm g2 : gl) {
                Set<Userhbm> ul = g2.getUsers();
                for (Userhbm u2 : ul) {
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
            if (session != null)
                session.close();
        }
        return gList;
    }

    /**
     * 得到所有组名为groupName用户组 查询组中组名为groupName的group对象集合groupList
     */

    public Grouphbm getUserGroup(String groupName) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        Grouphbm g = null;
        try {
            tx = session.beginTransaction();
            g = (Grouphbm) session.createQuery("from Grouphbm where name=:name").setString("name", groupName)
                    .uniqueResult();

            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
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
            Grouphbm g = (Grouphbm) session.createQuery("from Grouphbm where name=:name").setString("name", groupName)
                    .setMaxResults(1).uniqueResult();
            tx.commit();
            if (g != null) {
                flag = true;
            }
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return flag;
    }

    /**
     * 得到组名为groupName的Group对象
     *
     */

    public Grouphbm getGroup(String groupName) {

        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        Grouphbm g = null;
        try {
            tx = session.beginTransaction();
            g = (Grouphbm) session.createQuery("from Grouphbm where name=:name").setString("name", groupName)
                    .setMaxResults(1).uniqueResult();
            tx.commit();

        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return g;
    }

    /**
     * 得到组名为groupName的Group对象 这个信息比较全
     *
     */

    public Grouphbm getGroupInformation(String groupName) {

        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        Grouphbm g = null;
        try {
            tx = session.beginTransaction();
            g = (Grouphbm) session.createQuery("from Grouphbm where name=:name").setString("name", groupName)
                    .setMaxResults(1).uniqueResult();
            tx.commit();

        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
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
            session.delete(session.load(Grouphbm.class, groupId));
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
    }

    /**
     * 浏览所有用户组 查询组中用户ID不为userId的group对象集合groupList
     */

    public List<Grouphbm> getUserGroupList(int userId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<Grouphbm> gList = null;
        try {
            tx = session.beginTransaction();
            List<Grouphbm> gl = session.createQuery("from Grouphbm").list();
            for (Grouphbm g2 : gl) {
                Set<Userhbm> ul = g2.getUsers();
                for (Userhbm u2 : ul) {
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
            if (session != null)
                session.close();
        }
        return gList;
    }

    public Grouphbm idGetGroup(int id) {

        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        Grouphbm g = null;
        try {
            tx = session.beginTransaction();
            g = session.load(Grouphbm.class, id);
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return g;
    }

}
