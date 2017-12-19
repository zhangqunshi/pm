package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Issue;
import com.nastation.pm.bean.IssueChangeLog;
import com.nastation.pm.bean.Issuehb;
import com.nastation.pm.bean.Role;
import com.nastation.pm.util.DBConn;
import com.nastation.pm.util.StringUtils;

import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;
import com.nastation.pm.util.*;


public class IssueChangeLogBO {

	/**
	 * 保存问题改编log
	 * 
	 * */
	public void addIssueChangeLog(IssueChangeLog issueChangeLog) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(issueChangeLog);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
	}
	
	/**
	 * 
	 * 通过id获取对象
	 * 
	 * */
	public IssueChangeLog getIssueChangeLog(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		IssueChangeLog i = new IssueChangeLog();
		try {
			tx = session.beginTransaction();
			i = session.load(IssueChangeLog.class, id);
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return i;
	}
	


	public List getIssueChangeLogList(int id) {
		Session session = SessionF.sessionFactory.openSession();
		Transaction tx = null;
		List l = new ArrayList();
		try {
			tx = session.beginTransaction();
			l = session.createQuery("from IssueChangeLog as i where i.issueId.id=:id")
					.setInteger("id", id).list();
			tx.commit();
		}catch(Exception e) {
			if(tx != null)
				tx.rollback();
		}finally {
			session.close();
		}
		return l;
	}
	

	public void checkIfAdd(Issuehb old, Issuehb new1) {
		if (!(old.getAssigneeId() == new1.getAssigneeId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("AssigneeId");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue("" + new1.getAssigneeId());
			log.setOldValue("" + old.getAssigneeId());
			this.addIssueChangeLog(log);
		}
		if (!(old.getComponentId() == new1.getComponentId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("ComponentId");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue("" + new1.getComponentId());
			log.setOldValue("" + old.getComponentId());
			this.addIssueChangeLog(log);
		}
		if (!old.getDescription().equals(new1.getDescription())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("Description");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue(new1.getDescription());
			log.setOldValue(old.getDescription());
			this.addIssueChangeLog(log);
		}

		if (!old.getEnvironment().equals(new1.getEnvironment())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("Environment");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue(new1.getEnvironment());
			log.setOldValue(old.getEnvironment());
			this.addIssueChangeLog(log);
		}
		if (!(old.getIssueStatus() == new1.getIssueStatus())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("Status");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue("" + new1.getIssueStatus());
			log.setOldValue("" + old.getIssueStatus());
			this.addIssueChangeLog(log);
		}

		if (!(old.getIssueTypeId() == new1.getIssueTypeId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("IssueTypeId");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue("" + new1.getIssueTypeId());
			log.setOldValue("" + old.getIssueTypeId());
			this.addIssueChangeLog(log);
		}
		if (!old.getName().equals(new1.getName())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("IssueName");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue(new1.getName());
			log.setOldValue(old.getName());
			this.addIssueChangeLog(log);
		}

		if (!old.getPlanEndTime().equals(new1.getPlanEndTime())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("PlanEndTime");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue(StringUtils.toString(new1.getPlanEndTime()));
			log.setOldValue(StringUtils.toString(old.getPlanEndTime()));
			this.addIssueChangeLog(log);
		}
		if (!(old.getPriorityLevelId() == new1.getPriorityLevelId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("PriorityLevelId");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue("" + new1.getPriorityLevelId());
			log.setOldValue("" + old.getPriorityLevelId());
			this.addIssueChangeLog(log);
		}

		if (!(old.getReporterId() == new1.getReporterId())) {
			IssueChangeLog log = new IssueChangeLog();
			log.setChangeField("ReporterId");
			String createDate = StringUtils.toString(new java.util.Date());
			//log.setCreateDate(createDate);
			log.setIssueId(old);
			log.setNewValue("" + new1.getReporterId());
			log.setOldValue("" + old.getReporterId());
			this.addIssueChangeLog(log);
		}
	}
}
