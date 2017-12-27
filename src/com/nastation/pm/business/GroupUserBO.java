/**
 * 描述:组和用户关联的javaBean
 * @author liuliehui
 */
package com.nastation.pm.business;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.beanhbm.GroupUserhbm;
import com.nastation.pm.util.SessionF;

public class GroupUserBO {

    /**
     * 添加用户组
     */

    public void addGroupUser(GroupUserhbm groupUser) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(groupUser);
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
     * 判断用户组是否存在
     */

    public boolean groupUserExit(GroupUserhbm groupUser) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            GroupUserhbm g = (GroupUserhbm) session
                    .createQuery("from GroupUserhbm as g where g.userId=:uid and g.groupId=:gid")
                    .setInteger("uid", groupUser.getUserId()).setInteger("gid", groupUser.getGroupId()).uniqueResult();
            if (g != null) {
                return true;
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return false;
    }

    /**
     * 判断组ID为groupId的用户组是否存在
     */

    public boolean groupUserExit(int groupId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            GroupUserhbm g = (GroupUserhbm) session.createQuery("from GroupUserhbm as g where g.groupId=:gid")
                    .setInteger("gid", groupId).setMaxResults(1).uniqueResult();
            if (g != null) {
                return true;
            }

            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return false;
    }

    /**
     * 删除组ID为groupId的用户组
     */

    public void deleteGroupUser(int groupId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.createQuery("delete from GroupUserhbm as g where g.groupId=:gid").setInteger("gid", groupId)
                    .executeUpdate();
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
     * 删除用户组用户
     */

    public void deleteUserGroup(GroupUserhbm userGroup) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.createQuery("delete from GroupUserhbm as g where g.userId=:uid and g.groupId=:gid")
                    .setInteger("uid", userGroup.getUserId()).setInteger("gid", userGroup.getGroupId()).executeUpdate();
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
     * 获得用户组ID
     * 
     */
    public int userGroupId(int groupId, int userId) {
        int ugId = 0;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            GroupUserhbm g = (GroupUserhbm) session
                    .createQuery("from GroupUserhbm as g where g.userId=:uid and g.groupId=:gid")
                    .setInteger("uid", userId).setInteger("gid", groupId).uniqueResult();

            ugId = g.getId();
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return ugId;
    }

}
