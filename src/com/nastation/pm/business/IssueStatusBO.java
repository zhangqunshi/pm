package com.nastation.pm.business;

/**
 * 功能：问题状态的业务逻辑类
 *
 * @author 许希光
 *
 */
import java.sql.*;
import java.util.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.nastation.pm.beanhbm.Iconhbm;
import com.nastation.pm.beanhbm.IssueStatushbm;
import com.nastation.pm.util.DBConn;
import com.nastation.pm.util.SessionF;

public class IssueStatusBO {

    public static IssueStatusBO getIssueStatusBO() {
        return new IssueStatusBO();
    }

    /**
     * 向数据库中添加记录 IssueStatus 对象
     */
    public void addIssueStatus(IssueStatushbm issueStatus) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(issueStatus);
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
     * 更新已知的记录
     */
    public void updateIssueStatus(IssueStatushbm issueStatus) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(issueStatus);
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
     * 根据已知的 id ，获得IssueStatus对象
     */
    public IssueStatushbm getIssueStatus(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        IssueStatushbm issue2 = null;
        try {
            tx = session.beginTransaction();
            issue2 = session.load(IssueStatushbm.class, id);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
        return issue2;
    }

    /**
     * 根据已知的 name ，获得IssueStatus对象
     */
    public IssueStatushbm getIssueStatus(String name) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        IssueStatushbm is = null;
        try {
            tx = session.beginTransaction();
            is = (IssueStatushbm) session.createQuery("from IssueStatushbm as i where i.name=:name")
                    .setString("name", name).uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
        return is;
    }

    /**
     * 删除对应ID的IssueStatus 对象
     */
    public void deleteIssueStatus(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(session.load(IssueStatushbm.class, id));
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
     * 获得问题状态列表 List
     */
    public List<IssueStatushbm> getIssueStatusList() {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<IssueStatushbm> is = null;
        try {
            tx = session.beginTransaction();
            is = session.createQuery("from IssueStatushbm").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
        return is;
    }

    /**
     * 检查是否创建了同名IssueStatus
     */
    public boolean exist(IssueStatushbm is) {
        Connection conn = DBConn.getConnection();
        try {
            String sql = "select id from t_issue_status where name=? and id!=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, is.getName());
            ps.setInt(2, is.getId());
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
    public List<Iconhbm> getIconList() {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<Iconhbm> l = null;
        try {
            tx = session.beginTransaction();
            l = session.createQuery("from Iconhbhm where iconType=:it").setInteger("it", 1).list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
        return l;
    }

    /**
     * 根据icon 获得问题类型列表 List
     */

    public List<IssueStatushbm> getIssueStatusListByIcon(Iconhbm icon) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<IssueStatushbm> l = null;
        try {
            tx = session.beginTransaction();
            l = session.createQuery("from IssueStatushbm as i where i.iconUrl=:name")
                    .setString("name", icon.getFileName()).list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return l;
    }

}
