package com.nastation.pm.business;

<<<<<<< HEAD
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.beanhbm.ProjectIssueSequencehbm;
import com.nastation.pm.util.SessionF;
=======
import org.hibernate.*;

import com.nastation.pm.util.*;
import com.nastation.pm.beanhbm.*;
>>>>>>> f483d34e679984b11c23ea8a44763ccc5f32c2a9

public class ProjectIssueSequenceBO {

    public static ProjectIssueSequenceBO getProjectIssueSequenceBO() {
        return new ProjectIssueSequenceBO();
    }

    /**
     * 删除所有项目模块
     */
    public void deleteAllProjectIssueSequence(int projectId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.createQuery("delete from ProjectIssueSequencehbm as p where p.project.id=:id")
                    .setInteger("id", projectId).executeUpdate();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
    }

    /**
     * 判断t_project_user表里是否存在projectId 如果存在就返回true，反之则返回false
     */
    public boolean checkProjectLinkProjectIssueSequence(int projectId) {
        boolean flag = false;
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            ProjectIssueSequencehbm p = (ProjectIssueSequencehbm) session
                    .createQuery("from ProjectIssueSequencehbm as p where p.project.id=:id").setInteger("id", projectId)
                    .setMaxResults(1).uniqueResult();
            if (p != null) {
                flag = true;
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null)
                session.close();
        }
        return flag;
    }

}
