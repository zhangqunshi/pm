package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.util.DBConn;
import com.nastation.pm.util.SessionF;

/**
 * 写一个过滤器概要的逻辑类
 * 
 * @author LuckyStar
 * 
 */
public class FilterSummaryBO {
    /**
     * 添加一个概要信息
     * 
     * @param comment
     */
    public void addFilterSummary(HashMap<String, String> summarys, int filterId) {
        if (summarys == null || summarys.isEmpty() || filterId == 0) {
            return;
        }
        Connection conn = DBConn.getConnection();
        String sql = "insert into t_filter_summary(request_id, filter_summary_key, filter_summary_value) values(?,?,?)";

        try {
            PreparedStatement psmt = conn.prepareStatement(sql);

            Iterator<String> it = summarys.keySet().iterator();
            while (it.hasNext()) {
                String key = it.next();
                psmt.setInt(1, filterId);
                psmt.setString(2, key);
                psmt.setString(3, summarys.get(key));
                psmt.addBatch();
            }
            psmt.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }

    }

    /**
     * 添加一个概要信息
     * 
     * @param comment
     */

    public List getFilterSummaryList(int requestId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List l = null;
        try {
            tx = session.beginTransaction();
            l = session.createQuery("from FilterSummaryhbm as f where f.requestId.id=:id").setInteger("id", requestId)
                    .list();
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
}
