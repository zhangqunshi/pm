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
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.util.DBConn;

public class IssueBO {

	/** 字段列表 */
	public static final String columnNames = "issue_key, issue_type_id, name, priority_level_id, start_time,"
			+ " end_time, plan_end_time, component_id, assignee_id, reporter_id, "
			+ " environment, description, project_id, last_update_date, create_date, "
			+ " issue_status";

	/**
	 * 向数据库中添加记录 Issue对象
	 */
	public void addIssue(Issue issue) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into t_issue(" + columnNames
				+ ") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		System.out.println("=============34=========" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, issue.getIssueKey());
			pstmt.setInt(2, issue.getIssueTypeId());
			pstmt.setString(3, issue.getName());
			pstmt.setInt(4, issue.getPriorityLevelId());
			pstmt.setNull(5, Types.NULL);
			pstmt.setNull(6, Types.NULL);
			pstmt.setString(7, issue.getPlanEndTime());
			if (issue.getComponentId() == 0) {
				pstmt.setNull(8, Types.NULL);
			} else {
				pstmt.setInt(8, issue.getComponentId());
			}
			pstmt.setInt(9, issue.getAssigneeId());
			pstmt.setInt(10, issue.getReporterId());
			pstmt.setString(11, issue.getEnvironment());
			pstmt.setString(12, issue.getDescription());
			pstmt.setInt(13, issue.getProjectId());
			pstmt.setString(14, issue.getLastUpdateDate());
			pstmt.setString(15, issue.getCreateDate());
			pstmt.setInt(16, issue.getIssueStatus());

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
	 * 根据 Id ，更新已知的记录
	 */
	public void updateIssue(Issue issue) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update t_issue set issue_type_id=?,name=?,priority_level_id=?,start_time=?,"
				+ "end_time=?,plan_end_time=?,component_id=?,assignee_id=?,reporter_id=?,"
				+ "environment=?,description=?,last_update_date=?,issue_status=? where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, issue.getIssueTypeId());
			pstmt.setString(2, issue.getName());
			pstmt.setInt(3, issue.getPriorityLevelId());
			pstmt.setString(4, issue.getStartTime());
			pstmt.setString(5, issue.getEndTime());
			pstmt.setString(6, issue.getPlanEndTime());
			if (issue.getComponentId() == 0) {
				pstmt.setNull(7, Types.NULL);
			} else {
				pstmt.setInt(7, issue.getComponentId());
			}
			pstmt.setInt(8, issue.getAssigneeId());
			pstmt.setInt(9, issue.getReporterId());
			pstmt.setString(10, issue.getEnvironment());
			pstmt.setString(11, issue.getDescription());
			pstmt.setString(12, issue.getLastUpdateDate());
			pstmt.setInt(13, issue.getIssueStatus());
			pstmt.setInt(14, issue.getId());

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
	 * 根据issue id ，获得Issue对象
	 */
	public Issue getIssue(int id) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		Issue issue = new Issue();
		ResultSet rs = null;
		try {
			String sql = "select id, " + columnNames
					+ " from t_issue where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setName(rs.getString("name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));
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
		return issue;
	}

	/**
	 * 删除对应ID的Issue 对象
	 */
	public void deleteIssue(int id) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "delete from t_issue where id=?";
			String sql2 = "delete from t_comment where issue_id=?";
			PreparedStatement ps = conn.prepareStatement(sql2);
			ps.setInt(1, id);
			ps.executeUpdate();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

	/**
	 * 根据IssueKey ，获得Issue对象
	 */
	public Issue getIssueByKey(String name) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		Issue issue = new Issue();
		ResultSet rs = null;
		try {
			String sql = "select id, " + columnNames
					+ " from t_issue where issue_key=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setName(rs.getString("name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));
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
		return issue;
	}

	/**
	 * 从数据库中返回所有的任务问题列表
	 */
	public List<Issue> getIssueList() {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		List<Issue> list = new ArrayList<Issue>();
		ResultSet rs = null;
		try {
			String sql = "select id," + columnNames + " from t_issue";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Issue issue = new Issue();
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setName(rs.getString("name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));

				list.add(issue);
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
	 * 根据项目id, 获得同一项目中相关的任务列表
	 * 
	 * @param projectId
	 */
	public List<Issue> getIssueList(int projectId) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		List<Issue> list = new ArrayList<Issue>();
		ResultSet rs = null;
		try {
			String sql = "select id," + columnNames
					+ " from t_issue where project_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, projectId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Issue issue = new Issue();
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setName(rs.getString("name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));

				list.add(issue);
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
	 * 根据开发者Id, 获得其名下的任务列表
	 * 
	 * @param assigneeId
	 */
	public List<Issue> getIssueListByAssigneeId(int assigneeId) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		List<Issue> list = new ArrayList();
		ResultSet rs = null;
		try {

			String sql = "select * from v_issue_detail where assignee_id=? order by id desc";
			System.out.println("=getIssueDetail==sql==" + sql);

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, assigneeId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Issue issue = new Issue();
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setIssueTypeName(rs.getString("issue_type_name"));
				issue.setIssueTypeIcon(rs.getString("type_icon"));
				issue.setName(rs.getString("issue_name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setPriorityLevel(rs.getString("priority_level_name"));
				issue.setPriorityLevelIcon(rs.getString("priority_icon"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setComponentName(rs.getString("component_name"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setAssignee(rs.getString("assignee"));
				issue.setAssigneeFullname(rs.getString("assignee_fullname"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setReporter(rs.getString("reporter"));
				issue.setReporterFullname(rs.getString("reporter_fullname"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setProjectName(rs.getString("project_name"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));
				issue.setIssueStatusName(rs.getString("status_name"));
				issue.setIssueStatusIcon(rs.getString("status_icon"));
				issue.setResolutionId(rs.getInt("resolution_id"));
				issue.setResolution(rs.getString("resolution_name"));
				list.add(issue);
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
	 * 返回一个项目的所有问题列表。
	 * 
	 * @param project_id
	 * @return
	 */

	public List<Issue> getIssueDetailList(int project_id) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		List<Issue> list = new ArrayList();
		ResultSet rs = null;
		try {

			String sql = "select * from v_issue_detail where project_id=? order by issue_key desc";

			System.out.println("=getIssueDetail==sql==" + sql);

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, project_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Issue issue = new Issue();
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setIssueTypeName(rs.getString("issue_type_name"));
				issue.setIssueTypeIcon(rs.getString("type_icon"));
				issue.setName(rs.getString("issue_name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setPriorityLevel(rs.getString("priority_level_name"));
				issue.setPriorityLevelIcon(rs.getString("priority_icon"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setComponentName(rs.getString("component_name"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setAssignee(rs.getString("assignee"));
				issue.setAssigneeFullname(rs.getString("assignee_fullname"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setReporter(rs.getString("reporter"));
				issue.setReporterFullname(rs.getString("reporter_fullname"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setProjectName(rs.getString("project_name"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));
				issue.setIssueStatusName(rs.getString("status_name"));
				issue.setIssueStatusIcon(rs.getString("status_icon"));
				issue.setResolutionId(rs.getInt("resolution_id"));
				issue.setResolution(rs.getString("resolution_name"));
				list.add(issue);
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
	 * 检查是否创建了同名Issue
	 */
	public boolean checkIssue(Issue issue) {
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_issue where name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, issue.getName());
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
	 * 根据issue id ，获得Issue所有的信息，这个方法要比getIssue得到更多的信息. 包括图片的url
	 * 
	 * @see IssueBO#getIssue(int)
	 */
	public Issue getIssueDetail(int id) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		Issue issue = new Issue();
		ResultSet rs = null;
		try {

			// StringBuffer sql = new StringBuffer("select");
			// sql.append(" a.id, a.issue_key, a.issue_type_id, b.name as
			// issue_type_name, b.icon_url as type_icon, a.name as issue_name,
			// ");
			// sql.append(" a.priority_level_id, c.name as priority_level_name,
			// c.icon_url as priority_icon, a.start_time, a.end_time,
			// a.plan_end_time, ");
			// sql.append(" a.component_id, d.name as component_name,
			// a.assignee_id, e.username as assignee, a.reporter_id, ");
			// sql.append(" f.username as reporter, a.environment,
			// a.description, a.project_id, g.name as project_name,");
			// sql.append(" a.last_update_date, a.create_date, a.issue_status,
			// h.name as status_name, h.icon_url as status_icon ");
			// sql.append(" from t_issue a ");
			// sql.append(" left join t_issue_type b on (b.id=a.issue_type_id)
			// ");
			// sql.append(" left join t_issue_priority c on
			// (c.id=a.priority_level_id) ");
			// sql.append(" left join t_component d on (d.id=a.component_id) ");
			// sql.append(" left join t_user e on (e.id=a.assignee_id) ");
			// sql.append(" left join t_user f on (f.id=a.reporter_id) ");
			// sql.append(" left join t_project g on (g.id=a.project_id) ");
			// sql.append(" left join t_issue_status h on (h.id=a.issue_status)
			// ");
			// sql.append(" where a.id=?");

			String sql = "select * from v_issue_detail where id=?";

			System.out.println("=getIssueDetail==sql==" + sql);

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setIssueTypeName(rs.getString("issue_type_name"));
				issue.setIssueTypeIcon(rs.getString("type_icon"));
				issue.setName(rs.getString("issue_name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setPriorityLevel(rs.getString("priority_level_name"));
				issue.setPriorityLevelIcon(rs.getString("priority_icon"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setComponentName(rs.getString("component_name"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setAssignee(rs.getString("assignee"));
				issue.setAssigneeFullname(rs.getString("assignee_fullname"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setReporter(rs.getString("reporter"));
				issue.setReporterFullname(rs.getString("reporter_fullname"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setProjectName(rs.getString("project_name"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));
				issue.setIssueStatusName(rs.getString("status_name"));
				issue.setIssueStatusIcon(rs.getString("status_icon"));
				issue.setResolutionId(rs.getInt("resolution_id"));
				issue.setResolution(rs.getString("resolution_name"));
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
		return issue;
	}

	/**
	 * 根据issue key ，获得Issue所有的信息，这个方法要比getIssue得到更多的信息. 包括图片的url
	 * 
	 * @see IssueBO#getIssue(int)
	 */
	public Issue getIssueDetailByKey(String issueKey) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		Issue issue = new Issue();
		ResultSet rs = null;
		try {

			String sql = "select * from v_issue_detail where issue_key=?";

			System.out.println("=getIssueDetail==sql==" + sql);

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, issueKey);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setIssueTypeName(rs.getString("issue_type_name"));
				issue.setIssueTypeIcon(rs.getString("type_icon"));
				issue.setName(rs.getString("issue_name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setPriorityLevel(rs.getString("priority_level_name"));
				issue.setPriorityLevelIcon(rs.getString("priority_icon"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setComponentName(rs.getString("component_name"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setAssignee(rs.getString("assignee"));
				issue.setAssigneeFullname(rs.getString("assignee_fullname"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setReporter(rs.getString("reporter"));
				issue.setReporterFullname(rs.getString("reporter_fullname"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setProjectName(rs.getString("project_name"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));
				issue.setIssueStatusName(rs.getString("status_name"));
				issue.setIssueStatusIcon(rs.getString("status_icon"));
				issue.setResolutionId(rs.getInt("resolution_id"));
				issue.setResolution(rs.getString("resolution_name"));
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
		return issue;
	}

	/**
	 * 获得当前用户所有进行中的问题列表
	 * 
	 * @param assignee_id
	 */
	public List<Issue> getIssueInProgressList(int assigneeId) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		List<Issue> list = new ArrayList();
		ResultSet rs = null;
		try {
			String sql = "select * from v_issue_detail where issue_status=2 and assignee_id=? order by id desc";

			System.out.println("=getIssueDetail==sql==" + sql);

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, assigneeId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Issue issue = new Issue();
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setIssueTypeName(rs.getString("issue_type_name"));
				issue.setIssueTypeIcon(rs.getString("type_icon"));
				issue.setName(rs.getString("issue_name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setPriorityLevel(rs.getString("priority_level_name"));
				issue.setPriorityLevelIcon(rs.getString("priority_icon"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setComponentName(rs.getString("component_name"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setAssignee(rs.getString("assignee"));
				issue.setAssigneeFullname(rs.getString("assignee_fullname"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setReporter(rs.getString("reporter"));
				issue.setReporterFullname(rs.getString("reporter_fullname"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setProjectName(rs.getString("project_name"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));
				issue.setIssueStatusName(rs.getString("status_name"));
				issue.setIssueStatusIcon(rs.getString("status_icon"));
				issue.setResolutionId(rs.getInt("resolution_id"));
				issue.setResolution(rs.getString("resolution_name"));

				list.add(issue);
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
	 * 获得某用户所分配问题的数量
	 * 
	 * @param user_id
	 * @return
	 */
	public int assigneeCount(int user_id) {
		int assigneeCount = 0;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		try {
			String sql = "select count(*) from t_issue where assignee_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				assigneeCount = rs.getInt(1);
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
		return assigneeCount;
	}

	/**
	 * 获得某用户报告问题的数量
	 * 
	 * @param user_id
	 * @return
	 */
	public int reporterCount(int reporter_id) {
		int reporterCount = 0;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		try {
			String sql = "select count(*) from t_issue where reporter_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reporter_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				reporterCount = rs.getInt(1);
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
		return reporterCount;
	}

	/**
	 * 重新设置开发者，用于分配任务。
	 * 
	 * @param assigne_id,issue_id
	 */
	public void setAssignee(int issueId, int assigneeId) {
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update t_issue set assignee_id=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, assigneeId);
			pstmt.setInt(2, issueId);
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
	}

	/**
	 * 通过项目ID获得一个新的问题Key。
	 * 
	 * @param project_id
	 * @return
	 */

	public String getMoveIssueDetail(int project_id) {
		String issueKey = null;
		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select a.project_key,b.max_id_value+1 as 'maxint' from t_project a"
					+ " left join t_project_issue_sequence b on(a.id=b.project_id)"
					+ "where a.id=?";
			System.out.println("============828=====move sql========" + sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, project_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				issueKey = rs.getString("a.project_key") + "-"
						+ rs.getInt("maxint");
				System.out.println("============828=====issueKey========"
						+ issueKey);
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
		return issueKey;
	}

	/**
	 * 在移动问题中 根据issue更新已知的记录
	 */
	public void updateMoveIssue(Issue issue) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update t_issue set issue_key=?,project_id=?,issue_type_id=? where id=?";
		System.out.println("==========857==========sql===" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, issue.getIssueKey());
			pstmt.setInt(2, issue.getProjectId());
			pstmt.setInt(3, issue.getIssueTypeId());
			pstmt.setInt(4, issue.getId());
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
	 * 根据 Id ，更新已知的记录
	 */
	public void updateIssueByResolution(int resolutionId, int resolutionNewId) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update t_issue set resolution_id=? where resolution_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resolutionNewId);
			pstmt.setInt(2, resolutionId);
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
	 * 根据 Id 删除记录
	 */
	public void deleteAllIssueByLinkProject(int projectId) {
		List list = this.getAllIssue(projectId);
		for (int i = 0; i < list.size(); i++) {
			Issue issue = (Issue) list.get(i);
			this.deleteIssue(issue.getId());
		}

	}

	public List<Issue> getAllIssue(int projectId) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		List<Issue> list = new ArrayList();
		ResultSet rs = null;
		try {
			String sql = "select id from t_issue where project_id=?";

			System.out.println("=getIssueDetail==sql==" + sql);

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, projectId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Issue issue = new Issue();
				issue.setId(rs.getInt("id"));
				list.add(issue);
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
	 * check 日期格式
	 */
	public boolean checkDate(String time) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-d");
		try {
			Date dt = format.parse(time);
			String str = format.format(dt);
			return time.equals(str);
		} catch (Exception e) {

		}
		return false;
	}

	/*
	 * 根据 Id ，更新已知的记录
	 */
	public void updateIssueByLinkResolution(Issue issue) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update t_issue set resolution_id=?,assignee_id=? where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, issue.getResolutionId());
			pstmt.setInt(2, issue.getAssigneeId());
			pstmt.setInt(3, issue.getId());
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
	 * 根据 Id ，更新已知的记录
	 */
	public void updateIssueByLinkStatus(Issue issue) {

		Connection conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update t_issue set issue_status=?,last_update_date=?,end_time=? where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, issue.getIssueStatus());
			pstmt.setString(2, issue.getLastUpdateDate());
			if (issue.getEndTime() == null) {
				pstmt.setNull(3, Types.NULL);
			} else {
				pstmt.setString(3, issue.getEndTime());
			}
			pstmt.setInt(4, issue.getId());
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
	 * 获得当前用户所有进行中的问题列表
	 * 
	 * @param assignee_id
	 */
	public List<Issue> getIssueSearchList(String searchsql,
			List<String> paramValues) {

		Connection conn = DBConn.getConnection();
		List<Issue> list = new ArrayList<Issue>();
		ResultSet rs = null;
		PreparedStatement st = null;
		try {
			System.out.println("=getIssueDetail==sql==104==" + searchsql);
			System.out.println("=getIssueDetail==sql==104==" + paramValues);
			st = conn.prepareStatement(searchsql);
			if (paramValues != null) {
				int index = 1;
				for (int i = 0; i < paramValues.size(); i++) {
					st.setString(index, paramValues.get(i));
					index++;
				}
			}
			rs = st.executeQuery();
			while (rs.next()) {
				Issue issue = new Issue();
				issue.setId(rs.getInt("id"));
				issue.setIssueKey(rs.getString("issue_key"));
				issue.setIssueTypeId(rs.getInt("issue_type_id"));
				issue.setIssueTypeName(rs.getString("issue_type_name"));
				issue.setIssueTypeIcon(rs.getString("type_icon"));
				issue.setName(rs.getString("issue_name"));
				issue.setPriorityLevelId(rs.getInt("priority_level_id"));
				issue.setPriorityLevel(rs.getString("priority_level_name"));
				issue.setPriorityLevelIcon(rs.getString("priority_icon"));
				issue.setStartTime(rs.getString("start_time"));
				issue.setEndTime(rs.getString("end_time"));
				issue.setPlanEndTime(rs.getString("plan_end_time"));
				issue.setComponentId(rs.getInt("component_id"));
				issue.setComponentName(rs.getString("component_name"));
				issue.setAssigneeId(rs.getInt("assignee_id"));
				issue.setAssignee(rs.getString("assignee"));
				issue.setAssigneeFullname(rs.getString("assignee_fullname"));
				issue.setReporterId(rs.getInt("reporter_id"));
				issue.setReporter(rs.getString("reporter"));
				issue.setReporterFullname(rs.getString("reporter_fullname"));
				issue.setEnvironment(rs.getString("environment"));
				issue.setDescription(rs.getString("description"));
				issue.setProjectId(rs.getInt("project_id"));
				issue.setProjectName(rs.getString("project_name"));
				issue.setLastUpdateDate(rs.getString("last_update_date"));
				issue.setCreateDate(rs.getString("create_date"));
				issue.setIssueStatus(rs.getInt("issue_status"));
				issue.setIssueStatusName(rs.getString("status_name"));
				issue.setIssueStatusIcon(rs.getString("status_icon"));
				issue.setResolutionId(rs.getInt("resolution_id"));
				issue.setResolution(rs.getString("resolution_name"));

				list.add(issue);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.closeConn(conn);
		}
		return list;
	}

	/**
	 * 根据filterId获得任务列表
	 * 
	 * @param filterId
	 */
	public List<Issue> getIssueByFilterId(int filterId) {

		Connection conn = DBConn.getConnection();
		List<Issue> list = new ArrayList<Issue>();
		ResultSet rs = null;
		PreparedStatement st = null;
		try {
			// 首先根据filterId获得sql语句
			String sql = "select request_content from t_search_request where id=?";
			st = conn.prepareStatement(sql);
			st.setInt(1, filterId);
			rs = st.executeQuery();
			if (rs.next()) {
				String searchsql = rs.getString("request_content");

				// 获得sql语句中的参数值
				String sql2 = "select param_value from t_filter_parameter_value where filter_id=? order by param_order asc";
				st = conn.prepareStatement(sql2);
				st.setInt(1, filterId);
				rs = st.executeQuery();

				List<String> paramValues = new ArrayList<String>();
				while (rs.next()) {
					paramValues.add(rs.getString("param_value"));
				}

				//开始查询
				st = conn.prepareStatement(searchsql);
				if (paramValues != null) {
					int k = 1;
					int paramSize = paramValues.size();
					for (int i = 0; i < paramSize; i++, k++) {
						st.setString(k, paramValues.get(i));
					}
				}
				rs = st.executeQuery();
				
				while (rs.next()) {
					Issue issue = new Issue();
					issue.setId(rs.getInt("id"));
					issue.setIssueKey(rs.getString("issue_key"));
					issue.setIssueTypeId(rs.getInt("issue_type_id"));
					issue.setIssueTypeName(rs.getString("issue_type_name"));
					issue.setIssueTypeIcon(rs.getString("type_icon"));
					issue.setName(rs.getString("issue_name"));
					issue.setPriorityLevelId(rs.getInt("priority_level_id"));
					issue.setPriorityLevel(rs.getString("priority_level_name"));
					issue.setPriorityLevelIcon(rs.getString("priority_icon"));
					issue.setStartTime(rs.getString("start_time"));
					issue.setEndTime(rs.getString("end_time"));
					issue.setPlanEndTime(rs.getString("plan_end_time"));
					issue.setComponentId(rs.getInt("component_id"));
					issue.setComponentName(rs.getString("component_name"));
					issue.setAssigneeId(rs.getInt("assignee_id"));
					issue.setAssignee(rs.getString("assignee"));
					issue
							.setAssigneeFullname(rs
									.getString("assignee_fullname"));
					issue.setReporterId(rs.getInt("reporter_id"));
					issue.setReporter(rs.getString("reporter"));
					issue
							.setReporterFullname(rs
									.getString("reporter_fullname"));
					issue.setEnvironment(rs.getString("environment"));
					issue.setDescription(rs.getString("description"));
					issue.setProjectId(rs.getInt("project_id"));
					issue.setProjectName(rs.getString("project_name"));
					issue.setLastUpdateDate(rs.getString("last_update_date"));
					issue.setCreateDate(rs.getString("create_date"));
					issue.setIssueStatus(rs.getInt("issue_status"));
					issue.setIssueStatusName(rs.getString("status_name"));
					issue.setIssueStatusIcon(rs.getString("status_icon"));
					issue.setResolutionId(rs.getInt("resolution_id"));
					issue.setResolution(rs.getString("resolution_name"));

					list.add(issue);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConn.closeConn(conn);
		}
		return list;
	}
}
