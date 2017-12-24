package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Comment;
import com.nastation.pm.util.DBConn;
import com.nastation.pm.util.StringUtils;

import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;
import com.nastation.pm.util.*;

import com.nastation.pm.beanhbm.*;

/**
 * 备注的业务逻辑类
 *
 * @author liuliehui
 */
public class CommentBO {

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
            session.close();
        }
    }

    /**
     * 获得一个备注信息
     *
     * @param comment
     */
    public Commenthbm getComment(int commentId) {
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
        } finally {
            session.close();
        }
        return c;
    }

    /**
     * 用issue的ID得到一个Comment对象集合
     *
     * @param comment
     */
    public List<Commenthbm> getCommentLists(int issueId) {
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
        } finally {
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
            session.close();
        }
    }

    /**
     * 删除一条备注
     *
     * @param comment
     */
    public void deleteComment(int commentId) {
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
        } finally {
            session.close();
        }
    }

}
