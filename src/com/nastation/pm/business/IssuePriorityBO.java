package com.nastation.pm.business;

/**
 * 功能：问题的业务逻辑类
 * @author 许希光
 * 
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.nastation.pm.bean.Icon;
import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.IssuePriority;
import com.nastation.pm.bean.IssueStatus;
import com.nastation.pm.bean.IssueType;
import com.nastation.pm.util.DBConn;

public class IssuePriorityBO {

	/*
	 * 向数据库中添加记录 IssuePriority 对象
	 */
	public void addIssuePriority(IssuePriority issuePriority) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into t_issue_priority(name,description,priority_color,icon_url)values(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, issuePriority.getName());
			pstmt.setString(2, issuePriority.getDescription());
			pstmt.setString(3, issuePriority.getPriorityColor());
			pstmt.setString(4, issuePriority.getIconUrl());

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

	/*
	 * 更新已知的记录
	 */
	public void updateIssuePriority(IssuePriority issuePriority) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		String sql = "update t_issue_priority set name=?,description=?,priority_color=?,icon_url=?where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, issuePriority.getName());
			pstmt.setString(2, issuePriority.getDescription());
			pstmt.setString(3, issuePriority.getPriorityColor());
			pstmt.setString(4, issuePriority.getIconUrl());
			pstmt.setInt(5, issuePriority.getId());

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

	/*
	 * 根据已知的 id ，获得IssuePriority对象
	 */
	public IssuePriority getIssuePriority(int id) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		IssuePriority issuePriority = new IssuePriority();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue_priority where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				issuePriority.setId(rs.getInt(1));
				issuePriority.setName(rs.getString(2));
				issuePriority.setDescription(rs.getString(3));
				issuePriority.setPriorityColor(rs.getString(4));
				issuePriority.setIconUrl(rs.getString(5));
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
		return issuePriority;
	}

	/*
	 * 根据已知的 name ，获得IssuePriority对象
	 */
	public IssuePriority getIssuePriority(String name) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		IssuePriority issuePriority = new IssuePriority();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue_priority where name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				issuePriority.setId(rs.getInt(1));
				issuePriority.setName(rs.getString(2));
				issuePriority.setDescription(rs.getString(3));
				issuePriority.setPriorityColor(rs.getString(4));
				issuePriority.setIconUrl(rs.getString(5));
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
		return issuePriority;
	}

	/*
	 * 删除对应ID的IssuePriority 对象
	 */
	public void deleteIssuePriority(int id) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "delete from t_issue_priority where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

	/*
	 * 获得问题优先级列表 List
	 */
	public List<IssuePriority> getIssuePriorityList() {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		List<IssuePriority> list = new ArrayList<IssuePriority>();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue_priority ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				IssuePriority issuePriority = new IssuePriority();
				issuePriority.setId(rs.getInt(1));
				issuePriority.setName(rs.getString(2));
				issuePriority.setDescription(rs.getString(3));
				issuePriority.setPriorityColor(rs.getString(4));
				issuePriority.setIconUrl(rs.getString(5));
				list.add(issuePriority);
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
	 * 检查是否创建了同名IssuePriority
	 */
	public boolean exist(IssuePriority ip) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select id from t_issue_priority where name=? and id!=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ip.getName());
			ps.setInt(2, ip.getId());
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
	public List<Icon> getIconList() {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		List<Icon> list = new ArrayList<Icon>();
		ResultSet rs = null;
		try {
			String sql = "select * from t_icon where icon_type=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 3);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Icon icon = new Icon();
				icon.setId(rs.getInt(1));
				icon.setFileName(rs.getString(2));
				icon.setIconType(rs.getInt(3));
				list.add(icon);
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
	 * 根据icon 获得问题优先级列表 List
	 */
	public List<IssuePriority> getIssuePriorityListByIcon(Icon icon) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		List<IssuePriority> list = new ArrayList<IssuePriority>();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue_priority where icon_url=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, icon.getFileName());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				IssuePriority priority = new IssuePriority();
                priority.setName(rs.getString(2));
				list.add(priority);

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
}
