package com.nastation.pm.business;

/**
 * 功能：问题状态的业务逻辑类
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

public class IssueStatusBO {

	/*
	 * 向数据库中添加记录 IssueStatus 对象
	 */
	public void addIssueStatus(IssueStatus issueStatus) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into t_issue_status(name,description,icon_url)values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, issueStatus.getName());
			pstmt.setString(2, issueStatus.getDescription());
			pstmt.setString(3, issueStatus.getIconUrl());

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
	public void updateIssueStatus(IssueStatus issueStatus) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update t_issue_status set name=?,description=?,icon_url=?where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, issueStatus.getName());
			pstmt.setString(2, issueStatus.getDescription());
			pstmt.setString(3, issueStatus.getIconUrl());
			pstmt.setInt(4, issueStatus.getId());

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
	 * 根据已知的 id ，获得IssueStatus对象
	 */
	public IssueStatus getIssueStatus(int id) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		IssueStatus issueStatus = new IssueStatus();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue_status where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				issueStatus.setId(rs.getInt(1));
				issueStatus.setName(rs.getString(2));
				issueStatus.setDescription(rs.getString(3));
				issueStatus.setIconUrl(rs.getString(4));
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
		return issueStatus;
	}

	/*
	 * 根据已知的 name ，获得IssueStatus对象
	 */
	public IssueStatus getIssueStatus(String name) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		IssueStatus issueStatus = new IssueStatus();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue_status where name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				issueStatus.setId(rs.getInt(1));
				issueStatus.setName(rs.getString(2));
				issueStatus.setDescription(rs.getString(3));
				issueStatus.setIconUrl(rs.getString(4));
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
		return issueStatus;
	}

	/*
	 * 删除对应ID的IssueStatus 对象
	 */
	public void deleteIssueStatus(int id) {

		Connection conn = DBConn.getConnection();
		try {
			String sql = "delete from t_issue_status where id=?";
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
	 * 获得问题状态列表 List
	 */
	public List<IssueStatus> getIssueStatusList() {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		List<IssueStatus> list = new ArrayList<IssueStatus>();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue_status ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				IssueStatus issueStatus = new IssueStatus();
				issueStatus.setId(rs.getInt(1));
				issueStatus.setName(rs.getString(2));
				issueStatus.setDescription(rs.getString(3));
				issueStatus.setIconUrl(rs.getString(4));
				list.add(issueStatus);
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
	 * 检查是否创建了同名IssueStatus
	 */
	public boolean exist(IssueStatus is) {
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
	public List<Icon> getIconList() {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		List<Icon> list = new ArrayList<Icon>();
		ResultSet rs = null;
		try {
			String sql = "select * from t_icon where icon_type=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 1);
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
	 * 根据icon 获得问题类型列表 List
	 */
	public List<IssueStatus> getIssueStatusListByIcon(Icon icon) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		List<IssueStatus> list = new ArrayList<IssueStatus>();
		ResultSet rs = null;
		try {
			String sql = "select * from t_issue_status where icon_url=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, icon.getFileName());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				IssueStatus status = new IssueStatus();
				status.setIconUrl(rs.getString(4));
				status.setName(rs.getString(2));
				list.add(status);

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
