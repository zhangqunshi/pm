package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.bean.PermissionScheme;
import com.nastation.pm.beanhbm.PermissionSchemehbm;
import com.nastation.pm.util.DBConn;
import com.nastation.pm.util.SessionF;
import com.nastation.pm.util.StringUtils;

/**
 * 权限模板的业务逻辑类
 * 
 * @author sun
 */
public class PermissionSchemeBO {

    public static PermissionSchemeBO getPermissionSchemeBO() {
        return new PermissionSchemeBO();
    }

    /**
     * 添加一个权限模板
     * 
     * @param PermissionSchemehbm
     * @author sun
     */

    public void addPermissionScheme(PermissionSchemehbm scheme) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(scheme);
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
     * 更新一个权限模板
     * 
     * @param PermissionSchemehbm
     * @author sun
     */

    public void updatePermissionScheme(PermissionSchemehbm scheme) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(scheme);
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
     * 删除一个权限模板
     * 
     * @param id
     * @author sun
     */

    public void deletePermissionScheme(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(session.load(PermissionSchemehbm.class, id));
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
     * 获得一个所有权限模板列表，每个权限模板包括模板信息以及使用这个模板的项目信息。
     * 
     * @author sun
     */

    public List<PermissionSchemehbm> getSchemeList() {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<PermissionSchemehbm> psList = null;
        try {
            tx = session.beginTransaction();
            psList = session.createQuery("from PermissionSchemehbm").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return psList;
    }

    /**
     * 获得一个 Scheme
     * 
     * @param id
     * @author sun
     */

    public PermissionSchemehbm getScheme(int schemeId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        PermissionSchemehbm ps = null;
        try {
            tx = session.beginTransaction();
            ps = session.load(PermissionSchemehbm.class, schemeId);
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return ps;
    }

    /**
     * 通过名称获得模板id
     * 
     * @param name
     * @author sun
     */

    public int getId(String name) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        PermissionSchemehbm ps = null;
        try {
            tx = session.beginTransaction();
            ps = (PermissionSchemehbm) session.createQuery("from PermissionSchemehbm as p where p.name=:name")
                    .setString("name", name).uniqueResult();
            tx.commit();

        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return ps.getId();
    }

    /**
     * 用于命名copy的新scheme名字。
     * 
     * @param name
     * @return
     */
    public String renameScheme(String name) {
        boolean flag = true;
        int count = 1;
        String prefix = "Copy ";
        String rename = "";
        if (count == 1) {
            rename = prefix + "of " + name;
        }

        if (!exist(rename)) {
            return rename;
        } else {
            while (flag) {

                count++;
                rename = prefix + count + " of " + name;
                flag = exist(rename);

            }
            return rename;
        }

    }

    /**
     * 判断一个模板名是否已经存在
     * 
     * @author sun
     */

    public boolean exist(String name) {
        boolean flag = false;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        PermissionSchemehbm ps = null;
        try {
            tx = session.beginTransaction();
            ps = (PermissionSchemehbm) session.createQuery("from PermissionSchemehbm as p where p.name=:name")
                    .setString("name", name).uniqueResult();
            tx.commit();
            if (ps != null) {
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
     * 获得在组为groupName中的所有权限模板列表。
     * 
     * @author liuliehui
     * @throws ParseException
     */
    public List<PermissionScheme> getPermissionSchemeList(String assigneeType, String assignee) throws ParseException {
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        ProjectBO projectBO = new ProjectBO();
        ResultSet rs = null;
        List<PermissionScheme> schemeList = new ArrayList();
        try {
            String sql = "select * from t_permission_scheme where id in (select distinct a.scheme_id"
                    + " from t_permission_assignee a where a.assignee_type=? and a.assignee=?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, assigneeType);
            pstmt.setString(2, assignee);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PermissionScheme scheme = new PermissionScheme();
                scheme.setId(rs.getInt("id"));
                scheme.setName(rs.getString("name"));
                scheme.setDescription(rs.getString("description"));
                scheme.setCreateDate(StringUtils.toDate(rs.getString("create_date")));
                schemeList.add(scheme);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            DBConn.closeConn(conn);
        }
        return schemeList;
    }

}
