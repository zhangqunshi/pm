package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.ProjectComponent;
import com.nastation.pm.util.DBConn;

/**
 * 新建项目模块
 * 
 * @author weiboyuan
 * 
 */
public class ProjectComponentBO {

	Connection conn = DBConn.getConnection();
	PreparedStatement pstmt = null;

	/**
	 * 添加项目模块
	 */
	public void addProjectComponent(ProjectComponent pc) {
		String sql = "insert into t_component(project_id,name,description,leader,create_time) value(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pc.getProjectId());
			pstmt.setString(2, pc.getName());
			pstmt.setString(3, pc.getDescription());
			pstmt.setString(4, pc.getLeaderId());
			pstmt.setString(5, pc.getCreateDate());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.closeConn(conn);
		}

	}

	/**
	 * 检查项目模块名称是否相等
	 */
	public boolean checkProjectComponent(ProjectComponent pc) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_component where name=? and id!=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pc.getName());
			ps.setInt(2, pc.getId());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return true;
	}

	/**
	 * 获取模块表中数据
	 */
	public List<ProjectComponent> getProjectComponentList(int id) {
		List<ProjectComponent> list = new ArrayList<ProjectComponent>();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_component where project_id=" + id;
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ProjectComponent pc = new ProjectComponent();
				pc.setId(rs.getInt("id"));
				pc.setLeaderId(rs.getString("leader"));
				pc.setCreateDate(rs.getString("create_time"));
				pc.setDescription(rs.getString("description"));
				pc.setName(rs.getString("name"));
				list.add(pc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return list;
	}

	/**
	 * 删除项目模块
	 */
	public void deleteProjectComponent(int id) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "delete from t_component where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}
	
	/**
	 * 删除所有项目模块
	 */
	
	public void deleteAllProjectComponents(int projectId) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "delete from t_component where project_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, projectId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}
	
	/**
	 * 判断t_component表里是否存在projectId
	 * 如果存在就返回true，反之则返回false
	 */
	
	public boolean checkProjectComponent2(int projectId) {
		Connection conn = DBConn.getConnection();
		boolean b = false;
		try {
			String sql = "select * from t_component where project_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, projectId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				b = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return b;
	}

	/**
	 * 更新项目模块
	 */
	public void updateProjectComponent(ProjectComponent pc) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "update t_component set name=?,description=?,leader=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pc.getName());
			ps.setString(2, pc.getDescription());
			ps.setString(3, pc.getLeaderId());
			ps.setInt(4, pc.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

	/**
	 * Id查找数据
	 */
	public ProjectComponent getProjectComponent(int id) {
		ProjectComponent pc = new ProjectComponent();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_component where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				pc.setId(id);
				pc.setLeaderId(rs.getString("leader"));
				pc.setCreateDate(rs.getString("create_time"));
				pc.setDescription(rs.getString("description"));
				pc.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return pc;
	}

}
