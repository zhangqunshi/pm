package com.nastation.pm.business;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.beanhbm.Commenthbm;
import com.nastation.pm.util.SessionF;
=======
import com.nastation.pm.beanhbm.*;
import com.nastation.pm.util.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.*;
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9

/**
 * 备注的业务逻辑类
 *
 * @author liuliehui
 */
public class CommentBO {

    public static CommentBO getCommentBO() {
        return new CommentBO();
    }

    /**
     * 添加一个备注信息
     *
     * @param comment
     */
    public void addComment(Commenthbm comment) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(comment);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
    }

    /**
     * 获得一个备注信息
     *
     * @param comment
     */
    public Commenthbm getComment(int commentId) throws Exception {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        Commenthbm c = new Commenthbm();
        try {
            tx = session.beginTransaction();
            c = session.load(Commenthbm.class, commentId);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            if (session != null)
                session.close();
        }
        return c;
    }

    /**
     * 用issue的ID得到一个Comment对象集合
     *
     * @param comment
     */
    public List<Commenthbm> getCommentLists(int issueId) throws Exception {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<Commenthbm> cs = new ArrayList<>();

        try {
            tx = session.beginTransaction();
            cs = session.createQuery("from Commenthbm as c where c.issueId.id=:id").setInteger("id", issueId).list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            if (session != null)
                session.close();
        }
        return cs;
    }

    /**
     * 更新一条备注信息
     *
     * @param comment
     */
    public void updateComment(Commenthbm comment) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(comment);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
    }

    /**
     * 删除一条备注
     *
     * @param comment
     */
    public void deleteComment(int commentId) throws Exception {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(session.load(Commenthbm.class, commentId));
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            if (session != null)
                session.close();
        }
    }

}
