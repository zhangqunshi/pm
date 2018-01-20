/**
 * 描述:组和用户关联的javaBean
 *
 * @author liuliehui
 */
package com.nastation.pm.business;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.beanhbm.GroupUserhbm;
import com.nastation.pm.util.SessionF;

public class GroupUserBO {

    public static GroupUserBO getGroupUserBO() {
        return new GroupUserBO();
    }

    /**
     * 添加用户组
     */
<<<<<<< HEAD

    public void addGroupUser(GroupUserhbm groupUser) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
=======
    public void addGroupUser(GroupUser groupUser) throws SQLException {
        Connection conn = DBConn.getConnection();
        String sql = "insert into t_group_user(user_id,group_id) values(?,?)";

>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
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
<<<<<<< HEAD

    public boolean groupUserExit(GroupUserhbm groupUser) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
=======
    public boolean groupUserExit(GroupUser groupUser) {
        boolean flag = false;
        Connection conn = DBConn.getConnection();
        String sql = "select * from t_group_user where user_id=? and group_id=?";

        PreparedStatement pst;
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
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
<<<<<<< HEAD
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
=======
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from t_group_user where id=?";

>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
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
<<<<<<< HEAD

    public void deleteUserGroup(GroupUserhbm userGroup) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
=======
    public void deleteUserGroup(GroupUser userGroup) {
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from t_group_user where user_id=? and group_id=?";

>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
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
<<<<<<< HEAD
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
=======
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = "select id from t_group_user where group_id=? and user_id=?";

>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
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
