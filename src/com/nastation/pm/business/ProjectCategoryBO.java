package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Project;
import com.nastation.pm.bean.ProjectCategory;
import com.nastation.pm.bean.Role;
import com.nastation.pm.util.DBConn;

public class ProjectCategoryBO {
	/**
	 * 创建一个项目类型
	 */
	public void addProjectCategory(ProjectCategory category) {
		Connection conn = DBConn.getConnection();
		String sql = "insert into t_project_category(name,description,create_date) value(?,?,?)";
		try {
			System.out.println("========name===" + category.getName());
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, category.getName());
			pst.setString(2, category.getDescription());
			pst.setString(3, category.getCreateDate());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

	/**
	 * 通过一个ID获得对应的项目类型
	 */
	public ProjectCategory getProjectCategory(int id) {
		ProjectCategory category = new ProjectCategory();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_project_category where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				category.setId(id);
				category.setCreateDate(rs.getString("create_date"));
				category.setDescription(rs.getString("description"));
				category.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return category;
	}

	/**
	 * 检查是否创建了同名项目种类
	 */
	public boolean checkProjectCategory(ProjectCategory category) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_project_category where name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category.getName());
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
	 * 获得数据库中所有的项目种类信息
	 */
	public List getCategoryList() {
		List list = new ArrayList();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_project_category";
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ProjectCategory category = new ProjectCategory();
				category.setId(rs.getInt("id"));
				category.setCreateDate(rs.getString("create_date"));
				category.setDescription(rs.getString("description"));
				category.setName(rs.getString("name"));
				list.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return list;
	}

	/**
	 * 删除对应ID的项目种类
	 */
	public void deleteCategory(int id) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "delete from t_project_category where id=?";
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
	 * 更新项目种类
	 */
	public void updateCategory(ProjectCategory category) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "update t_project_category set name=?,description=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, category.getName());
			ps.setString(2, category.getDescription());
			ps.setInt(3, category.getId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

	public ProjectCategory getProjectCategory(String name) {
		ProjectCategory category = new ProjectCategory();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_project_category where name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				category.setName(name);
				category.setCreateDate(rs.getString("create_date"));
				category.setDescription(rs.getString("description"));
				category.setId(rs.getInt("id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return category;
	}

	/**
	 * 查询与此分类有关的所有项目
	 */
	public List getAllProject(int categoryId) {
		Connection conn = DBConn.getConnection();
		List list = new ArrayList();
		try {
			String sql = "select * from t_project where category_id=?";
			System.out.println("=============169sql===========" + sql);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, categoryId);
			ResultSet rs = ps.executeQuery();
			System.out.println("=============180sql===========" + categoryId);
			while (rs.next()) {
				Project project = new Project();
				project.setName(rs.getString("name"));
				project.setProjectId(rs.getInt("id"));
				list.add(project);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return list;
	}

	/**
	 * 删除与项目有关联项目分类
	 */
	public void deleteProjectCategoryForLinkProject(int id) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "update t_project set category_id=? where category_id=?";
			System.out.println("=============sql===========" + sql);
			System.out.println("=============categoryId===========" + id);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setNull(1, Types.NULL);
			ps.setInt(2, id);
            ps.executeUpdate();
            System.out.println("================execute===========");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		this.deleteCategory(id);
	}
	
	/**
	 * 判断此分类是否与其他项目有关联
	 */
	public boolean checkLinkProject(int categoryId) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_project where category_id=?";
			System.out.println("=============169sql===========" + sql);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, categoryId);
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
	
	public boolean exists(String name) {
		Connection conn = DBConn.getConnection();
		System.out.println(name);
		try {
			String sql = "select id from t_project_category where name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
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
