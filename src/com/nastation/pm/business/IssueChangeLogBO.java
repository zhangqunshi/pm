package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.IssueChangeLog;
import com.nastation.pm.bean.Role;
import com.nastation.pm.util.DBConn;
import com.nastation.pm.util.StringUtils;

public class IssueChangeLogBO {
	public void addIssueChangeLog(IssueChangeLog issueChangeLog) {
		Connection conn = DBConn.getConnection();
		String sql = "insert into t_issue_change_log(issue_id,change_field,old_value,new_value,create_date) value(?,?,?,?,?)";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			System.out.println("=========sql========" + sql);
			pst.setInt(1, issueChangeLog.getIssueId());
			pst.setString(2, issueChangeLog.getChangeField());
			pst.setString(3, issueChangeLog.getOldValue());
			pst.setString(4, issueChangeLog.getNewValue());
			pst.setString(5, issueChangeLog.getCreateDate());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

	public IssueChangeLog getIssueChangeLog(int id) {
		IssueChangeLog issueChangeLog = new IssueChangeLog();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_issue_change_log where id=?";
			System.out.println("=========sql========" + sql);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				issueChangeLog.setId(id);
				issueChangeLog.setIssueId(rs.getInt("issue_id"));
				issueChangeLog.setChangeField(rs.getString("change_field"));
				issueChangeLog.setOldValue(rs.getString("ole_value"));
				issueChangeLog.setNewValue(rs.getString("new_valeu"));
				issueChangeLog.setCreateDate(rs.getString("create_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return issueChangeLog;
	}

	public List getIssueChangeLogList(int id) {
		List list = new ArrayList();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_issue_change_log where issue_id="
					+ id;
			System.out.println("=========sql========" + sql);
			Statement ps = conn.createStatement();
			ResultSet rs = ps.executeQuery(sql);
			while (rs.next()) {
				IssueChangeLog issueChangeLog = new IssueChangeLog();
				issueChangeLog.setId(rs.getInt("id"));
				issueChangeLog.setIssueId(rs.getInt("issue_id"));
				issueChangeLog.setChangeField(rs.getString("change_field"));
				issueChangeLog.setOldValue(rs.getString("ole_value"));
				issueChangeLog.setNewValue(rs.getString("new_valeu"));
				issueChangeLog.setCreateDate(rs.getString("create_date"));
				list.add(issueChangeLog);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return list;
	}

	public void checkIfAdd(Issue old, Issue new1) {
		if (!(old.getAssigneeId() == new1.getAssigneeId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("AssigneeId");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue("" + new1.getAssigneeId());
			log.setOldValue("" + old.getAssigneeId());
			this.addIssueChangeLog(log);
		}
		if (!(old.getComponentId() == new1.getComponentId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("ComponentId");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue("" + new1.getComponentId());
			log.setOldValue("" + old.getComponentId());
			this.addIssueChangeLog(log);
		}
		if (!old.getDescription().equals(new1.getDescription())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("Description");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue(new1.getDescription());
			log.setOldValue(old.getDescription());
			this.addIssueChangeLog(log);
		}

		if (!old.getEnvironment().equals(new1.getEnvironment())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("Environment");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue(new1.getEnvironment());
			log.setOldValue(old.getEnvironment());
			this.addIssueChangeLog(log);
		}
		if (!(old.getIssueStatus() == new1.getIssueStatus())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("Status");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue("" + new1.getIssueStatus());
			log.setOldValue("" + old.getIssueStatus());
			this.addIssueChangeLog(log);
		}

		if (!(old.getIssueTypeId() == new1.getIssueTypeId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("IssueTypeId");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue("" + new1.getIssueTypeId());
			log.setOldValue("" + old.getIssueTypeId());
			this.addIssueChangeLog(log);
		}
		if (!old.getName().equals(new1.getName())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("IssueName");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue(new1.getName());
			log.setOldValue(old.getName());
			this.addIssueChangeLog(log);
		}

		if (!old.getPlanEndTime().equals(new1.getPlanEndTime())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("PlanEndTime");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue(new1.getPlanEndTime());
			log.setOldValue(old.getPlanEndTime());
			this.addIssueChangeLog(log);
		}
		if (!(old.getPriorityLevelId() == new1.getPriorityLevelId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("PriorityLevelId");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue("" + new1.getPriorityLevelId());
			log.setOldValue("" + old.getPriorityLevelId());
			this.addIssueChangeLog(log);
		}

		if (!(old.getReporterId() == new1.getReporterId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("ReporterId");
			String createDate = StringUtils.toString(new java.util.Date());
			log.setCreateDate(createDate);
			log.setIssueId(old.getId());
			log.setNewValue("" + new1.getReporterId());
			log.setOldValue("" + old.getReporterId());
			this.addIssueChangeLog(log);
		}
	}
}
