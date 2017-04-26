package com.nastation.pm.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nastation.pm.bean.Comment;
import com.nastation.pm.util.DBConn;
import com.nastation.pm.util.StringUtils;

/**
 * ��ע��ҵ���߼���
 * 
 * @author liuliehui
 */
public class CommentBO {

	/**
	 * ���һ����ע��Ϣ
	 * 
	 * @param comment
	 */
	public void addComment(Comment comment) {
		Connection conn = DBConn.getConnection();
		String sql = "insert into t_comment(comment_content,author,issue_id,create_date) values(?,?,?,?)";
		System.out.println("=33=Sql==" + sql);
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);

			psmt.setString(1, comment.getCommentContent());
			psmt.setString(2, comment.getAuthor());
			psmt.setInt(3, comment.getIssueId());
			psmt.setString(4, StringUtils.getCurrDate());
			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}

	}
	/**
	 * ���һ����ע��Ϣ
	 * 
	 * @param comment
	 */
	public Comment getComment(int commentId) throws SQLException {
		Comment comm = new Comment();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_comment where id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, commentId);
			System.out.println("=51==sql2===" + sql);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				comm.setId(rs.getInt("id"));
				comm.setCommentContent(rs.getString("comment_content"));
				comm.setAuthor(rs.getString("author"));
				comm.setIssueId(rs.getInt("issue_id"));
				comm.setCreateDate(rs.getString("create_date"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return comm;
	}
	/**
	 * ��issue��ID�õ�һ��Comment���󼯺�
	 * 
	 * @param comment
	 */
	public List<Comment> getCommentLists(int issueId) throws SQLException {
		ArrayList<Comment> commlist = new ArrayList<Comment>();
		Connection conn = DBConn.getConnection();
		try {
			String sql = "select * from t_comment where issue_id=? order by id asc";
			System.out.println("=51==sql2===" + sql);

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, issueId);

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Comment comm = new Comment();
				comm.setId(rs.getInt("id"));
				comm.setCommentContent(rs.getString("comment_content"));
				comm.setAuthor(rs.getString("author"));
				comm.setIssueId(rs.getInt("issue_id"));
				comm.setCreateDate(rs.getString("create_date"));
				commlist.add(comm);
			}
			rs.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
		return commlist;
	}
	/**
	 * ����һ����ע��Ϣ
	 * 
	 * @param comment
	 */
	public void updateComment(Comment comment) throws SQLException { 
		Connection conn = DBConn.getConnection();
		try {
			String sql = "update t_comment set comment_content=? where id= ?";
			System.out.println("=========121==sql====" + sql);
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, comment.getCommentContent());
			stmt.setInt(2, comment.getId());
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}
	/**
	 * ɾ��һ����ע
	 * 
	 * @param comment
	 */
	public void deleteComment(int commentId) throws SQLException { 
		Connection conn = DBConn.getConnection();
		try {
			String sql = "delete from t_comment where id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, commentId);
			System.out.println("==========131====sql=" + sql);
			stmt.executeUpdate();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConn.closeConn(conn);
		}
	}

}
