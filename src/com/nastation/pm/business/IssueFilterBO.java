package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.nastation.pm.bean.FilterSummary;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.beanhbm.SearchRequesthbm;
import com.nastation.pm.util.DBConn;
import com.nastation.pm.util.SessionF;
import com.nastation.pm.util.StringUtils;

/**
 * 创建一个过滤器的逻辑业务类
 * 
 * @author LuckyStar
 * 
 */
public class IssueFilterBO {
    /**
     * 添加一个filter信息
     * 
     * @param comment
     */

    public void addFilter(SearchRequesthbm filter) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(filter);
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
     * 把filter表中sql语句所需参数的值保存到表中
     * 
     * @param comment
     */
    public void addFilterParameterValues(int filterId, List<String> filterParamValues) {
        if (filterParamValues == null || filterParamValues.size() == 0) {
            return;
        }
        Connection conn = DBConn.getConnection();
        String sql = "insert into t_filter_parameter_value(param_value,param_order,filter_id) values(?,?,?)";

        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            for (int i = 0; i < filterParamValues.size(); i++) {
                String value = filterParamValues.get(i);
                psmt.setString(1, value);
                psmt.setInt(2, i);
                psmt.setInt(3, filterId);
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
     * delete一个filter信息
     * 
     * @param id
     */

    public void deleteFilter(int id) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(session.load(SearchRequesthbm.class, id));
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
     * update一个filter信息
     * 
     * @param filter
     */
    public void updateFilter(IssueFilter filter) {
        Connection conn = DBConn.getConnection();
        String sql = "update t_search_request set filter_name=?,description=? where id=?";

        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, filter.getFilterName());
            psmt.setString(2, filter.getDescription());
            psmt.setInt(3, filter.getId());
            psmt.executeUpdate();

            // ------------ update items -------------
            HashMap<String, String> items = filter.getItem();
            if (items != null && items.size() > 0) {
                String sql2 = "delete from t_filter_summary where request_id=?";
                psmt = conn.prepareStatement(sql2);
                psmt.setInt(1, filter.getId());
                psmt.executeUpdate();

                String sql3 = "insert into t_filter_summary(request_id, filter_summary_key, filter_summary_value) values(?,?,?)";
                psmt = conn.prepareStatement(sql3);

                Iterator<String> it = items.keySet().iterator();
                while (it.hasNext()) {
                    String key = it.next();
                    psmt.setInt(1, filter.getId());
                    psmt.setString(2, key);
                    psmt.setString(3, items.get(key));
                    psmt.addBatch();
                }
                psmt.executeBatch();
            }

            // ------------ update param values -------
            List<String> paramValues = filter.getParamValues();
            if (paramValues != null && paramValues.size() > 0) {
                String sql4 = "delete from t_filter_parameter_value where filter_id=?";
                psmt = conn.prepareStatement(sql4);
                psmt.setInt(1, filter.getId());
                psmt.executeUpdate();

                String sql5 = "insert into t_filter_parameter_value(param_value,param_order,filter_id) values(?,?,?)";
                psmt = conn.prepareStatement(sql5);
                for (int i = 0; i < paramValues.size(); i++) {
                    String value = paramValues.get(i);
                    psmt.setString(1, value);
                    psmt.setInt(2, i);
                    psmt.setInt(3, filter.getId());
                    psmt.addBatch();
                }
                psmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
    }

    /**
     * update一个filter信息
     * 
     * @param filter
     */

    public void updateFilterBasicInfo(SearchRequesthbm filter) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(filter);
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
     * get一个filterList信息
     * 
     * @param comment
     */

    public List getFilterList() {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List l = null;
        try {
            tx = session.beginTransaction();
            l = session.createQuery("from SearchRequesthbm").list();
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

    /**
     * 
     * 
     * 
     * */

    public List getFiltersByUser(String username) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List l = null;
        try {
            tx = session.beginTransaction();
            l = session.createQuery("from SearchRequesthbm as s where s.authorName=:name").setString("name", username)
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

    /**
     * 名字和项目ID获取搜索请求集合
     * 
     */
    public List<SearchRequesthbm> getFilterByUserAndProject(String username, int projectId) {
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        List<SearchRequesthbm> l = null;
        try {
            tx = session.beginTransaction();
            l = session.createQuery("from SearchRequesthbm as s where s.authorName=:name and s.projectId=:id")
                    .setString("name", username).setInteger("id", projectId).list();
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

    /**
     * 检验是否重名
     * 
     * @param comment
     */

    public boolean checkFilterName(String filterName) {
        if (StringUtils.isBlank(filterName)) {
            return true;
        }
        Session session = SessionF.sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            SearchRequesthbm s = (SearchRequesthbm) session
                    .createQuery("from SearchRequesthbm as s where s.filterName=:name").setString("name", filterName)
                    .setMaxResults(1).uniqueResult();
            if (s != null) {
                return true;
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null)
                tx.rollback();
        } finally {
            if (session != null)
                session.close();
        }
        return false;
    }

    /**
     * get一个filter信息
     * 
     * @param comment
     */
    public IssueFilter getFilter(String filterName) {
        Connection conn = DBConn.getConnection();
        String sql = "select * from t_search_request where filter_name=?";

        IssueFilter filter = new IssueFilter();
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setString(1, filterName);
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                FilterSummaryBO fsb = new FilterSummaryBO();
                List list = fsb.getFilterSummaryList(rs.getInt(1));
                HashMap item = new HashMap();
                for (int i = 0; i < list.size(); i++) {
                    FilterSummary summary = (FilterSummary) list.get(i);
                    item.put(summary.getFilterSummaryKey(), summary.getFilterSummaryValue());
                }
                filter.setItem(item);
                filter.setId(rs.getInt(1));
                filter.setFilterName(rs.getString(2));
                filter.setAuthorName(rs.getString(3));
                filter.setDescription(rs.getString(4));
                filter.setProjectId(rs.getInt(5));
                filter.setRequestContent(rs.getString(6));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return filter;
    }

    /**
     * 
     * @param filterId
     */
    public IssueFilter getFilterById(int filterId) {
        Connection conn = DBConn.getConnection();
        String sql = "select id, filter_name, author_name, description, project_id, request_content from t_search_request where id=?";

        IssueFilter filter = new IssueFilter();
        try {
            PreparedStatement psmt = conn.prepareStatement(sql);
            psmt.setInt(1, filterId);
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {

                filter.setId(filterId);
                filter.setFilterName(rs.getString("filter_name"));
                filter.setAuthorName(rs.getString("author_name"));
                filter.setDescription(rs.getString("description"));
                filter.setProjectId(rs.getInt("project_id"));
                filter.setRequestContent(rs.getString("request_content"));

                // 取得items
                String sql2 = "select filter_summary_key, filter_summary_value  from t_filter_summary where request_id=?";
                psmt = conn.prepareStatement(sql2);
                psmt.setInt(1, filterId);
                rs = psmt.executeQuery();

                HashMap item = new HashMap();
                while (rs.next()) {
                    String key = rs.getString("filter_summary_key");
                    String value = rs.getString("filter_summary_value");
                    item.put(key, value);
                }

                // 取得param value
                String sql3 = "select param_value from t_filter_parameter_value where filter_id=? order by param_order asc";
                psmt = conn.prepareStatement(sql3);
                psmt.setInt(1, filterId);
                List<String> paramValues = new ArrayList<String>();
                rs = psmt.executeQuery();
                while (rs.next()) {
                    paramValues.add(rs.getString("param_value"));
                }

                filter.setParamValues(paramValues);
                filter.setItem(item);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.closeConn(conn);
        }
        return filter;
    }
}
