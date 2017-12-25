/**
 * 描述：Project业务逻辑类
 * 作者：张博
 * 日期：2008-12-18
 */
package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.bean.Project;
import com.nastation.pm.beanhbm.Projecthbm;
import com.nastation.pm.beanhbm.Userhbm;
import com.nastation.pm.util.DBConn;
import com.nastation.pm.util.SessionF;

public class ProjectBO {

    /**
     * 添加一个项目
     * 
     * @param project
     *            把项目相关信息存入数据库表中
     */

    public void addProject(Project project) {
        Connection conn = DBConn.getConnection();

        try {

            boolean beforeCommit = conn.getAutoCommit();
            conn.setAutoCommit(false);

            // insert project infomation.
            String sql = "insert into t_project(name,project_key,description,url,leader,category_id,permission_scheme_id) value(?,?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, project.getName());
            pst.setString(2, project.getProjectKey());
            pst.setString(3, project.getDescription());
            pst.setString(4, project.getUrl());
            pst.setString(5, project.getLeader());
            pst.setNull(6, Types.NULL);
            pst.setInt(7, project.getPermissionSchemeId());
            pst.executeUpdate();

            // get new project id
            String sql3 = "select id from t_project where project_key=?";
            PreparedStatement pst3 = conn.prepareStatement(sql3);
            pst3.setString(1, project.getProjectKey());
            ResultSet rs = pst3.executeQuery();
            int projectId = 0;
            if (rs.next()) {
                projectId = rs.getInt("id");
            }

            // 将项目负责人信息插入到t_project_user;
            String sql1 = "insert t_project_user (project_id,user_id,role_id,create_date) values(?,?,?,curdate())";
            PreparedStatement pstmt = conn.prepareStatement(sql1);
            UserBO userBO = new UserBO();
            Userhbm user = userBO.getUser(project.getLeader());
            pstmt.setInt(1, projectId);
            pstmt.setInt(2, user.getId());
            pstmt.setInt(3, 1);// 角色ID中1为管理员。
            pstmt.executeUpdate();

            // insert initial project issue key
            String sql2 = "insert into t_project_issue_sequence(project_id,max_id_value) value(?,?)";
            PreparedStatement pst2 = conn.prepareStatement(sql2);
            pst2.setInt(1, projectId);
            pst2.setInt(2, 1); // 起始值为1
            pst2.executeUpdate();

            conn.commit();
            conn.setAutoCommit(beforeCommit);

        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
    }

    /**
     * 获得一个项目信息
     * 
     * @param id
     * @return 返回数据库中一个项目的详细信息
     */

    public Projecthbm getProject(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        Projecthbm proj = null;
        try {
            tx = session.beginTransaction();
            proj = session.load(Projecthbm.class, id);
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return proj;
    }

    /**
     * 通过项目名获得该项目ID
     * 
     * @param name
     * @return id
     */

    public int getProjectId(String name) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        int id = 0;
        try {
            tx = session.beginTransaction();
            Projecthbm proj = (Projecthbm) session.createQuery("from Projecthbm where name=:name")
                    .setString("name", name).uniqueResult();

            id = proj.getId();
            tx.commit();

        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return id;
    }

    /**
     * 判断项目名是否已经存在
     * 
     * @param projectName
     * @param projectKey
     * @return true if exist, otherwise return false.
     */

    public boolean existName(Projecthbm project) {
        boolean flag = false;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Projecthbm p = (Projecthbm) session.createQuery("from Projecthbm where name=:name")
                    .setString("name", project.getName()).setMaxResults(1).uniqueResult();
            tx.commit();
            if (p != null) {
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
     * 判断key是否已经存在
     * 
     * @param key
     * @return
     */

    public boolean existKey(Projecthbm project) {
        boolean flag = false;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            Projecthbm p = (Projecthbm) session.createQuery("form Projecthbm where projectKey=:key")
                    .setString("key", project.getProjectKey()).setMaxResults(1).uniqueResult();
            tx.commit();
            if (p != null) {
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
     * 修改项目信息
     * 
     * @param project
     */

    public void updateProject(Projecthbm project) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(project);
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
     * 删除一个项目
     * 
     * @param id
     */

    public void deleteProject(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.createQuery("delete from Projecthbm as p where p.id=:id").setInteger("id", id).executeUpdate();
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
     * 获得数据库中t_project表中所有的信息
     * 
     * @return 返回一个保存该项目信息的List
     */

    public List<Projecthbm> getProjectList() {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<Projecthbm> pList = null;
        try {
            tx = session.beginTransaction();
            pList = session.createQuery("from Projecthbm").list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return pList;
    }

    /**
     * 更新项目类型
     */

    public void updateProject1(Projecthbm project) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(project);
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
     * 返回指定ProjectId的问题最大索引值
     * 
     * @param projectId
     * @return
     */
    public int getProjectIssueMaxId(int projectId) {
        Connection conn = DBConn.getConnection();
        int id = 0;
        try {
            boolean beforeCommit = conn.getAutoCommit();
            conn.setAutoCommit(false);

            // get max id value
            String sql = "select max_id_value from t_project_issue_sequence where project_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("max_id_value");
            }

            // increment max_id_value
            String sql2 = "update t_project_issue_sequence set max_id_value=max_id_value+1 where project_id=?";
            PreparedStatement ps2 = conn.prepareStatement(sql2);
            ps2.setInt(1, projectId);
            ps2.executeUpdate();

            conn.commit();
            conn.setAutoCommit(beforeCommit);

        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return id;
    }

    /**
     * 返回一个权限模板下的所有项目信息
     * 
     * @param schemeId
     * @return
     * @author sun
     */
    public List<Project> getProjectListByScheme(int schemeId) {
        List<Project> list = new ArrayList();
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "select id,name from t_project where permission_scheme_id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, schemeId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Project project = new Project();
                project.setProjectId(rs.getInt("id"));
                project.setName(rs.getString("name"));
                list.add(project);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            DBConn.closeConn(conn);
        }
        return list;
    }

    /**
     * 改变一个项目使用的模板
     * 
     * @param projectId,schemeId
     */
    public void changeScheme(int projectId, int schemeId) {
        Connection conn = DBConn.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update t_project set permission_scheme_id=? where id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, schemeId);
            pstmt.setInt(2, projectId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
    }

}
