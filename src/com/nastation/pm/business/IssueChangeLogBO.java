package com.nastation.pm.business;

import java.util.*;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.nastation.pm.beanhbm.IssueChangeLoghbm;
import com.nastation.pm.beanhbm.Issuehbm;
import com.nastation.pm.util.SessionF;
import com.nastation.pm.util.StringUtils;

public class IssueChangeLogBO {

    public static IssueChangeLogBO getIssueChangeLogBO() {
        return new IssueChangeLogBO();
    }

    /**
     * 保存问题改编log
     * 
     */
    public void addIssueChangeLog(IssueChangeLoghbm log) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(log);
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
    }

    /**
     * 
     * 通过id获取对象
     * 
     */
    public IssueChangeLoghbm getIssueChangeLog(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        IssueChangeLoghbm i = null;
        try {
            tx = session.beginTransaction();
            i = session.load(IssueChangeLoghbm.class, id);
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return i;
    }

    public List getIssueChangeLogList(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List l = null;
        try {
            tx = session.beginTransaction();
            l = session.createQuery("from IssueChangeLoghbm as i where i.issueId.id=:id").setInteger("id", id).list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return l;
    }

    public void checkIfAdd(Issuehbm old, Issuehbm new1) {
        if (!(old.getAssignee() == new1.getAssignee())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("AssigneeId");
            String createDate = StringUtils.toString(new java.util.Date());
            log.setIssue(old);
            log.setNewValue("" + new1.getAssignee());
            log.setOldValue("" + old.getAssignee());
            this.addIssueChangeLog(log);
        }
        if (!(old.getComponentId() == new1.getComponentId())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("ComponentId");
            String createDate = StringUtils.toString(new java.util.Date());
            log.setIssue(old);
            log.setNewValue("" + new1.getComponentId());
            log.setOldValue("" + old.getComponentId());
            this.addIssueChangeLog(log);
        }
        if (!old.getDescription().equals(new1.getDescription())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("Description");
            String createDate = StringUtils.toString(new java.util.Date());
            log.setIssue(old);
            log.setNewValue(new1.getDescription());
            log.setOldValue(old.getDescription());
            this.addIssueChangeLog(log);
        }

        if (!old.getEnvironment().equals(new1.getEnvironment())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("Environment");
            String createDate = StringUtils.toString(new java.util.Date());

            log.setIssue(old);
            log.setNewValue(new1.getEnvironment());
            log.setOldValue(old.getEnvironment());
            this.addIssueChangeLog(log);
        }
        if (!(old.getIssueStatus() == new1.getIssueStatus())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("Status");
            String createDate = StringUtils.toString(new java.util.Date());

            log.setIssue(old);
            log.setNewValue("" + new1.getIssueStatus());
            log.setOldValue("" + old.getIssueStatus());
            this.addIssueChangeLog(log);
        }
        if (!(old.getIssueType() == new1.getIssueType())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("IssueTypeId");
            String createDate = StringUtils.toString(new java.util.Date());

            log.setIssue(old);
            log.setNewValue("" + new1.getIssueType());
            log.setOldValue("" + old.getIssueType());
            this.addIssueChangeLog(log);
        }
        if (!old.getName().equals(new1.getName())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("IssueName");
            String createDate = StringUtils.toString(new java.util.Date());
            log.setIssue(old);
            log.setNewValue(new1.getName());
            log.setOldValue(old.getName());
            this.addIssueChangeLog(log);
        }

        if (!old.getPlanEndTime().equals(new1.getPlanEndTime())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("PlanEndTime");
            String createDate = StringUtils.toString(new java.util.Date());
            log.setIssue(old);
            log.setNewValue(StringUtils.toString(new1.getPlanEndTime()));
            log.setOldValue(StringUtils.toString(old.getPlanEndTime()));
            this.addIssueChangeLog(log);
        }
        if (!(old.getPriorityLevel() == new1.getPriorityLevel())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("PriorityLevelId");
            String createDate = StringUtils.toString(new java.util.Date());
            log.setIssue(old);
            log.setNewValue("" + new1.getPriorityLevel());
            log.setOldValue("" + old.getPriorityLevel());
            this.addIssueChangeLog(log);
        }

        if (!(old.getReporter() == new1.getReporter())) {
            IssueChangeLoghbm log = new IssueChangeLoghbm();
            log.setChangeField("ReporterId");
            String createDate = StringUtils.toString(new java.util.Date());
            log.setIssue(old);
            log.setNewValue("" + new1.getReporter());
            log.setOldValue("" + old.getReporter());
            this.addIssueChangeLog(log);
        }
    }
}
