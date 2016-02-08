package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Resolution;
import com.nastation.pm.util.DBConn;

/**
 * 问题Resolution的业务逻辑类
 * 
 * @author Kris
 * @version 2008-12-27
 * @see Resolution
 */
public class ResolutionBO {

	/**
	 * 向数据库中添加Resolution 对象
	 */
	public void addResolution(Resolution resolution) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into t_resolution(name,description,is_default) values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resolution.getName());
			pstmt.setString(2, resolution.getDescription());
			pstmt.setInt(3, resolution.getIsDefault());

			pstmt.executeUpdate();
		} catch (Exception e) {
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
	 * Get all resolution
	 * 
	 * @return
	 */
	public List getAllResolutions() {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		List list = new ArrayList();
		ResultSet rs = null;
		try {
			String sql = "select * from t_resolution ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Resolution r = new Resolution();
				r.setId(rs.getInt("id"));
				r.setName(rs.getString("name"));
				r.setDescription(rs.getString("description"));
				r.setIsDefault(rs.getInt("is_default"));

				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.closeConn(conn);
		}
		return list;
	}

	/**
	 * 更改resolution的一条记录为默认
	 * 
	 * @return
	 */
	public void updateResolutionDefault(int isDefault) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		int count = 0;
		ResultSet rs = null;
		try {
			String sql = "update t_resolution set is_default=?";
			System.out.println("========102====sql=======" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 0);
			count = pstmt.executeUpdate();
			if (count > 0) {
				String sql2 = "update t_resolution set is_default=? where id=?";
				System.out.println("========108====sql2=======" + sql2);
				PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, 1);
				pstmt2.setInt(2, isDefault);
				pstmt2.executeUpdate();
				pstmt2.close();
			}
		} catch (Exception e) {
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
	 * get resolution by id
	 * 
	 * @param id
	 */
	public Resolution getResolution(int id) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from  t_resolution where id=?";
		Resolution resolution = new Resolution();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				resolution.setId(rs.getInt("id"));
				resolution.setDescription(rs.getString("description"));
				resolution.setName(rs.getString("name"));
				resolution.setIsDefault(rs.getInt("is_default"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
					rs = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();

			}
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();

			}
			DBConn.closeConn(conn);
		}
		return resolution;
	}

	/**
	 * update resolution
	 * 
	 * @param resolution
	 */
	public Resolution updateResolution(Resolution resolution) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "update t_resolution set name=?,description=?,is_default=? where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resolution.getName());
			pstmt.setString(2, resolution.getDescription());
			pstmt.setInt(3, resolution.getIsDefault());
			pstmt.setInt(4, resolution.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
			} catch (SQLException e) {
				e.printStackTrace();

			}
			DBConn.closeConn(conn);
		}
		return resolution;
	}

	/**
	 * check resolution
	 * 
	 * @return
	 */
	public boolean checkExistResolution(Resolution resolution) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from t_resolution where name=? and id!=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, resolution.getName());
			pstmt.setInt(2, resolution.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.closeConn(conn);
		}
		return false;
	}

	/**
	 * check all resolution
	 * 
	 * @return
	 */
	public List getIssueByLinkIssue(int id) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		List list = new ArrayList();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue where resolution_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Resolution r = new Resolution();
				r.setId(rs.getInt("id"));
				r.setName(rs.getString("name"));
				r.setDescription(rs.getString("description"));
				r.setIsDefault(rs.getInt("is_default"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.closeConn(conn);
		}
		return list;
	}

	/**
	 * 向数据库中删除Resolution 对象
	 */
	public void deleteResolution(int id) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		String sql = "delete from t_resolution where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);

			pstmt.executeUpdate();
		} catch (Exception e) {
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
}