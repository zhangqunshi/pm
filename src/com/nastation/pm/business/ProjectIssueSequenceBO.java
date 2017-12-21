package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.nastation.pm.util.DBConn;
import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.query.*;

import com.nastation.pm.util.*;
import com.nastation.pm.beanhbm.*;

public class ProjectIssueSequenceBO {

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
            if (tx != null)
                tx.rollback();
        } finally {
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
            if (tx != null)
                tx.rollback();
        } finally {
            session.close();
        }
        return flag;
    }

}
