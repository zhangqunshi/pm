package com.nastation.pm.business;

/**
 * 功能：问题的业务逻辑类
 *
 * @author 许希光
 *
 */
import java.util.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.nastation.pm.bean.Icon;
import com.nastation.pm.beanhbm.Iconhbm;
import com.nastation.pm.beanhbm.IssuePriorityhbm;
import com.nastation.pm.util.SessionF;

public class IssuePriorityBO {

    public static IssuePriorityBO getIssuePriorityBO() {
        return new IssuePriorityBO();
    }

    /**
     * 向数据库中添加记录 IssuePriority 对象
     */
    public void addIssuePriority(IssuePriorityhbm issuePriority) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(issuePriority);
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
    public void updateIssuePriority(IssuePriorityhbm issuePriority) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(issuePriority);
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
     * 根据已知的 id ，获得IssuePriority对象
     */
    public IssuePriorityhbm getIssuePriority(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        IssuePriorityhbm ip = null;
        try {
            tx = session.beginTransaction();
            ip = session.load(IssuePriorityhbm.class, id);

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
        return ip;
    }

    /**
     * 根据已知的 name ，获得IssuePriority对象
     */
    public IssuePriorityhbm getIssuePriority(String name) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        IssuePriorityhbm i = null;
        try {
            tx = session.beginTransaction();
            i = (IssuePriorityhbm) session.createQuery("from IssuePriorityhbm as i where i.name=:name")
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
            session.delete(session.load(IssuePriorityhbm.class, id));
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
     * 获得问题优先级列表 List
     */
    public List<IssuePriorityhbm> getIssuePriorityList() {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<IssuePriorityhbm> ipList = null;
        try {
            tx = session.beginTransaction();
            ipList = session.createQuery("from IssuePriorityhbm").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
        return ipList;
    }

    /**
     * 检查是否创建了同名IssuePriority
     */
    public boolean exist(IssuePriorityhbm ip) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        boolean flag = false;
        try {
            tx = session.beginTransaction();
            List<IssuePriorityhbm> list = session.createQuery("from IssuePriorityhbm as i where i.name=:name")
                    .setString("name", ip.getName()).list();
            tx.commit();
            if (list.size() > 1) {
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
            l = session.createQuery("from Iconhbm where iconType=:it").setInteger("it", 3).list();
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
     * 根据icon 获得问题优先级列表 List
     */
    public List<IssuePriorityhbm> getIssuePriorityListByIcon(Icon icon) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<IssuePriorityhbm> l = null;
        try {
            tx = session.beginTransaction();
            l = session.createQuery("from IssuePriorityhbm as i where i.iconUrl=:u").setString("u", icon.getFileName())
                    .list();
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

}
