package com.nastation.pm.util;

/**
 * @author 许希光 作用: 数据库连接类
 */
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConn {

    private static String className;
    private static String url;
    private static String user;
    private static String passwd;

    static {
        Properties p = new Properties();
        InputStream in = DBConn.class.getClassLoader().getResourceAsStream("database.properties");
        try {
            p.load(in);
        } catch (IOException ex) {
            Logger.getLogger(DBConn.class.getName()).log(Level.SEVERE, null, ex);
        }
        className = p.getProperty("driver");
        url = p.getProperty("url");
        user = p.getProperty("user");
        passwd = p.getProperty("password");

        System.out.println("DB className: " + className);
        System.out.println("DB url: " + url);
        System.out.println("DB user: " + user);
    }

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
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
