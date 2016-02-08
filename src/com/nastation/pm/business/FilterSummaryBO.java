package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.nastation.pm.bean.FilterSummary;
import com.nastation.pm.util.DBConn;

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
		System.out.println("=33=Sql==" + sql);
		System.out.println("=33=Sql==" + summarys);
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
		Connection conn = DBConn.getConnection();
		String sql = "select * from t_filter_summary where request_id=?";
		System.out.println("=33=Sql==" + sql);
		List list = new ArrayList();
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, requestId);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				FilterSummary summary = new FilterSummary();
				summary.setId(rs.getInt(1));
				summary.setRequestId(rs.getInt(2));
				summary.setFilterSummaryKey(rs.getString(3));
				summary.setFilterSummaryValue(rs.getString(4));
				list.add(summary);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return list;
	}
}
