package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.ProjectUser;
import com.nastation.pm.util.DBConn;

public class ProjectUserBO {

    public static ProjectUserBO getProjectUserBO() {
        return new ProjectUserBO();
    }

    // add new project user
    public void addProjectUser(ProjectUser projectUser) throws SQLException {
        Connection conn = DBConn.getConnection();
        String sql = "select * from t_project_user where project_id=? and user_id=? and role_id=?";

        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, projectUser.getProjectId());
        pst.setInt(2, projectUser.getUserId());
        pst.setInt(3, projectUser.getRoleId());
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            return;
        } else {

            String sql2 = "insert into t_project_user(project_id,user_id,role_id,create_date) values(?,?,?,?)";
            try {

                PreparedStatement ps = conn.prepareStatement(sql2);
                ps.setInt(1, projectUser.getProjectId());
                ps.setInt(2, projectUser.getUserId());
                ps.setInt(3, projectUser.getRoleId());
                ps.setString(4, projectUser.getCreateDate());
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                DBConn.closeConn(conn);
            }
        }
    }

    // get a projectUser
    public ProjectUser getProjectUser(int id) {
        ProjectUser projectUser = new ProjectUser();
        Connection conn = DBConn.getConnection();
        try {
            String sql = "select * from t_project_user where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                projectUser.setProjectUserId(rs.getInt("id"));
                projectUser.setCreateDate(rs.getString("create_date"));
                projectUser.setUserId(rs.getInt("user_id"));
                projectUser.setRoleId(rs.getInt("role_id"));
                projectUser.setProjectId(rs.getInt("project_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return projectUser;

    }

    /**
     * 根据projectId获得projectUser类集合list
     *
     * @param projectId
     * @return
     */
    public List<ProjectUser> getProjectUserByProjectId(int projectId) {
        List<ProjectUser> projectList = new ArrayList<ProjectUser>();
        ProjectUser projectUser = null;
        Connection conn = DBConn.getConnection();
        try {
            String sql = "select a.id, a.create_date, a.user_id, b.username, a.role_id, a.project_id "
                    + " from t_project_user a, t_user b " + " where a.project_id=? and a.user_id=b.id";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                projectUser = new ProjectUser();
                projectUser.setProjectUserId(rs.getInt("id"));
                projectUser.setCreateDate(rs.getString("create_date"));
                projectUser.setUserId(rs.getInt("user_id"));
                projectUser.setUsername(rs.getString("username"));
                projectUser.setRoleId(rs.getInt("role_id"));
                projectUser.setProjectId(rs.getInt("project_id"));
                projectList.add(projectUser);
            }
<<<<<<< HEAD

=======
            for (ProjectUser pUser : projectList) {

            }
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return projectList;

    }

    //
    // 根据项目ID获得projectUser类集合list
    public List<ProjectUser> getProjectUser3(int projectId) {
        List<ProjectUser> projectList = new ArrayList<ProjectUser>();

        Connection conn = DBConn.getConnection();
        try {
            String sql = "select * from t_project_user where project_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, projectId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProjectUser projectUser = new ProjectUser();
                projectUser.setProjectUserId(rs.getInt("id"));
                projectUser.setCreateDate(rs.getString("create_date"));
                projectUser.setUserId(rs.getInt("user_id"));
                projectUser.setRoleId(rs.getInt("role_id"));
                projectUser.setProjectId(rs.getInt("project_id"));
                projectList.add(projectUser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return projectList;

    }

    // 根据项目和角色ID和用户id获得projectUser类
    public ProjectUser getProjectUser5(int projectId, int roleId, int userId) {
        Connection conn = DBConn.getConnection();
        ProjectUser projectUser = new ProjectUser();
        try {
            String sql = "select * from t_project_user where project_id=" + projectId + " and role_id=" + roleId
                    + " and user_id=" + userId;

            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                projectUser.setProjectUserId(rs.getInt("id"));
                projectUser.setCreateDate(rs.getString("create_date"));
                projectUser.setUserId(rs.getInt("user_id"));
                projectUser.setRoleId(rs.getInt("role_id"));
                projectUser.setProjectId(rs.getInt("project_id"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return projectUser;

    }

    /**
     * 根据项目ID和角色ID和获得projectUser类list集合
     */
    public List<ProjectUser> getProjectUserByProjectIdRoleId(int projectId, int roleId) {

        List<ProjectUser> projectList = new ArrayList<ProjectUser>();
        Connection conn = DBConn.getConnection();
        try {
            String sql = "select a.user_id, b.username from t_project_user a, t_user b where a.project_id=? and a.role_id=? and a.user_id=b.id";

            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, projectId);
            psmt.setInt(2, roleId);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                ProjectUser projectUser = new ProjectUser();
                projectUser.setUserId(rs.getInt("user_id"));
                projectUser.setUsername(rs.getString("username"));

                projectList.add(projectUser);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return projectList;

    }

    // 根据项目和角色ID和获得number数
    public int getProjectUser6(int projectId, int roleId) {
        Connection conn = DBConn.getConnection();
        int number = 0;
        try {
            String sql = "select * from t_project_user where project_id=" + projectId + " and role_id=" + roleId;

            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);
            while (rs.next()) {
                number += 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return number;

    }

    //
    public List<ProjectUser> getProjectUser() {
        List<ProjectUser> list = new ArrayList<ProjectUser>();
        Connection conn = DBConn.getConnection();
        try {
            String sql = "select * from t_project_user";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                ProjectUser projectUser = new ProjectUser();
                projectUser.setProjectUserId(rs.getInt("id"));
                projectUser.setProjectId(rs.getInt("project_id"));
                projectUser.setCreateDate(rs.getString("create_date"));
                projectUser.setUserId(rs.getInt("user_id"));
                projectUser.setRoleId(rs.getInt("role_id"));
                list.add(projectUser);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return list;
    }

    // delete a project user
    public void deleteProjectUser(int id) {
        Connection conn = DBConn.getConnection();
        try {
            String sql = "delete from t_project_user where id=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
    }

    // update a projectUser
    public void updateProjectUser(ProjectUser projectUser) {
        Connection conn = DBConn.getConnection();
        try {
            String sql = "update t_project_user set project_id=?,user_id=?,role_id=?,create_date=? where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, projectUser.getProjectId());
            ps.setInt(2, projectUser.getUserId());
            ps.setInt(3, projectUser.getRoleId());
            ps.setString(4, projectUser.getCreateDate());
            ps.setInt(5, projectUser.getProjectUserId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
    }

    /**
     * 删除所有与此角色有关的projectUser
     *
     * @param roleId
     */
    public void deleteAllProjectUser(int roleId) {
        Connection conn = DBConn.getConnection();
        try {
            String sql = "delete from t_project_user where role_id=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, roleId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
    }

}
