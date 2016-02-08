package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Role;
import com.nastation.pm.util.DBConn;

/**
 * 
 * @author zhanglei
 * 
 */
public class RoleBO {
	/**
	 * 创建一个角色
	 */
	public void addRole(Role role) {
		Connection conn = DBConn.getConnection();
		String sql = "insert into t_role(role_name,role_desc,create_date) value(?,?,?)";
		try {
			System.out.println("========name===" + role.getRoleName());
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, role.getRoleName());
			pst.setString(2, role.getRoleDesc());
			pst.setString(3, role.getCreateDate());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

	/**
	 * 通过一个ID获得对应的角色
	 */
	public Role getRole(int id) {
		Role role = new Role();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_role where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				role.setRoleId(id);
				role.setCreateDate(rs.getString("create_date"));
				role.setRoleDesc(rs.getString("role_desc"));
				role.setRoleName(rs.getString("role_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return role;
	}

	/**
	 * 检查是否创建了同名角色
	 */
	public boolean checkRole(Role role) {
		boolean flag = false;
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_role where role_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, role.getRoleName());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return flag;
	}

	/**
	 * 获得数据库中所有的角色信息
	 */
	public List<Role> getRoleList() {
		List<Role> list = new ArrayList<Role>();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_role";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Role role = new Role();
				role.setRoleId(rs.getInt("id"));
				role.setCreateDate(rs.getString("create_date"));
				role.setRoleDesc(rs.getString("role_desc"));
				role.setRoleName(rs.getString("role_name"));
				list.add(role);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return list;
	}

	/**
	 * 删除对应ID的角色
	 */
	public void deleteRole(int id) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "delete from t_role where id=?";
			System.out.println("==sql==" + sql);
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
	 * 更新角色
	 */
	public void updateRole(Role role) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "update t_role set role_name=?,role_desc=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, role.getRoleName());
			ps.setString(2, role.getRoleDesc());
			ps.setInt(3, role.getRoleId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}
	/**
	 * 检查是否此角色有关联的对象
	 */
	public boolean checkRoleByLink(int roleId) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_project_user where role_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, roleId);
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
}
