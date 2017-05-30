package com.nastation.pm.util;

/**
 * @author 许希光
 * 作用: 数据库连接类
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	private static String className = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/projectmanagement?useUnicode=true&characterEncoding=UTF-8";
	private static String user = "root";
	private static String passwd = "123456";

	public static Connection getConnection() { // 获得数据库连接对象
		Connection conn = null;
		try {
			Class.forName(className);
			conn = DriverManager.getConnection(url, user, passwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeConn(Connection conn) { // 关闭数据库对象
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
