package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.nastation.pm.bean.FilterSummary;
import com.nastation.pm.bean.IssueFilter;
import com.nastation.pm.util.DBConn;
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
	public void addFilter(IssueFilter filter) {
		Connection conn = DBConn.getConnection();
		String sql = "insert into t_search_request(filter_name,author_name,description,project_id,request_content) values(?,?,?,?,?)";
		System.out.println("=21=Sql==" + sql);
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, filter.getFilterName());
			psmt.setString(2, filter.getAuthorName());
			psmt.setString(3, filter.getDescription());
			if (filter.getProjectId() == 0) {
				psmt.setNull(4, Types.NULL);
			} else {
				psmt.setInt(4, filter.getProjectId());
			}
			psmt.setString(5, filter.getRequestContent());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

	/**
	 * 把filter表中sql语句所需参数的值保存到表中
	 * 
	 * @param comment
	 */
	public void addFilterParameterValues(int filterId,
			List<String> filterParamValues) {
		if (filterParamValues == null || filterParamValues.size() == 0) {
			return;
		}
		Connection conn = DBConn.getConnection();
		String sql = "insert into t_filter_parameter_value(param_value,param_order,filter_id) values(?,?,?)";
		System.out.println("=60=Sql==" + sql);
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
		Connection conn = DBConn.getConnection();
		String sql = "delete from t_search_request where id=?";
		System.out.println("=21=Sql==" + sql);
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);
			psmt.executeUpdate();
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
	public void updateFilter(IssueFilter filter) {
		Connection conn = DBConn.getConnection();
		String sql = "update t_search_request set filter_name=?,description=? where id=?";
		System.out.println("==69Sql==" + sql);
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
	public void updateFilterBasicInfo(IssueFilter filter) {
		Connection conn = DBConn.getConnection();
		String sql = "update t_search_request set filter_name=?,description=? where id=?";
		System.out.println("==176====sql==" + sql);
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, filter.getFilterName());
			psmt.setString(2, filter.getDescription());
			psmt.setInt(3, filter.getId());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

	/**
	 * get一个filterList信息
	 * 
	 * @param comment
	 */
	public List getFilterList() {
		Connection conn = DBConn.getConnection();
		List list = new ArrayList();
		String sql = "select * from t_search_request";
		System.out.println("=21=Sql==" + sql);
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				IssueFilter filter = new IssueFilter();
				filter.setId(rs.getInt(1));
				filter.setFilterName(rs.getString(2));
				filter.setAuthorName(rs.getString(3));
				filter.setDescription(rs.getString(4));
				filter.setProjectId(rs.getInt(5));
				filter.setRequestContent(rs.getString(6));
				list.add(filter);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return list;
	}

	public List getFiltersByUser(String username) {
		Connection conn = DBConn.getConnection();
		List list = new ArrayList();
		String sql = "select * from t_search_request where author_name=?";
		System.out.println("=21=Sql==" + sql);
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, username);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				IssueFilter filter = new IssueFilter();
				filter.setId(rs.getInt("id"));
				filter.setFilterName(rs.getString("filter_name"));
				filter.setAuthorName(rs.getString("author_name"));
				filter.setDescription(rs.getString("description"));
				filter.setProjectId(rs.getInt("project_id"));
				filter.setRequestContent(rs.getString("request_content"));
				list.add(filter);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return list;
	}

	public List getFilterByUserAndProject(String username, int projectId) {
		Connection conn = DBConn.getConnection();
		List list = new ArrayList();
		String sql = "select * from t_search_request where author_name=? and project_id=?";
		System.out.println("=21=Sql==" + sql);
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, username);
			psmt.setInt(2, projectId);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				IssueFilter filter = new IssueFilter();
				filter.setId(rs.getInt("id"));
				filter.setFilterName(rs.getString("filter_name"));
				filter.setAuthorName(rs.getString("author_name"));
				filter.setDescription(rs.getString("description"));
				filter.setProjectId(rs.getInt("project_id"));
				filter.setRequestContent(rs.getString("request_content"));
				list.add(filter);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return list;
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
		Connection conn = DBConn.getConnection();
		String sql = "select id from t_search_request where filter_name=?";
		System.out.println("=21=Sql==" + sql + ", filterName=" + filterName);
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, filterName);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
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
		System.out.println("=21=Sql==" + sql);
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
					item.put(summary.getFilterSummaryKey(), summary
							.getFilterSummaryValue());
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
		System.out.println("===253=Sql==" + sql);
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
