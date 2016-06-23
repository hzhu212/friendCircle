package friendCircle;

import java.sql.*;

public class SQLmanager {
	private final static String driverName = "com.mysql.jdbc.Driver";	//驱动名称
	private final static String DBUser = "fCircle1";	//MySQL用户名
	private final static String DBPasswd = "fCircle1";	//MySQL密码
	private final static String DBName = "friendCircle";	//数据库名
	private final static String MySQLServer = "119.29.155.72";	//MySQL地址
	private final static String MySQLServerPort = "3306";	//MySQL端口号
	private final static String connUrl = "jdbc:mysql://" + MySQLServer + ":" + MySQLServerPort + 
				"/" + DBName + "?user=" + DBUser + "&password=" + DBPasswd;	//数据库完整链接地址
	static Statement stmt;
	static Connection conn;
	static ResultSet rs;
	static void startMySQL() throws Exception {	//开启MySQL
		Class.forName(driverName).newInstance();	//加载数据库驱动
		conn = DriverManager.getConnection(connUrl);	//链接数据库并保存到conn变量中
		stmt = conn.createStatement();	//实例化Statement对象
		stmt.executeQuery("SET NAMES UTF8");	//设置字符集
	}
	static void close() throws SQLException {
		conn.close();
		stmt.close();
		rs.close();
	}
}