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
	/*public void addFriend(String data) throws SQLException {	//添加好友
		String[] info = dataParser(data);
		String sql = "INSERT INTO `friendCircle`.`friend` VALUES "
				+ "('"+info[0]+"','"+info[1]+"')";
		stmt.execute(sql);
	}
	
	public void addComment(String data) throws SQLException {	//添加评论
		String[] info = dataParser(data);
		String sql = "INSERT INTO `friendCircle`.`comment` VALUES "
				+ "('"+info[0]+"','"+info[1]+"','"+info[2]+"','"+info[3]+"','"+info[4]+"','"+info[5]+"')";
		stmt.execute(sql);
	}
	public void addReply(String data) throws SQLException {	//添加回复
		String[] info = dataParser(data);
		String sql = "INSERT INTO `friendCircle`.`reply` VALUES "
				+ "('"+info[0]+"','"+info[1]+"')";
		stmt.execute(sql);
	}
	public void addPicture(String data) throws SQLException {	//添加图片
		String[] info = dataParser(data);
		String sql = "INSERT INTO `friendCircle`.`picture` VALUES "
				+ "('"+info[0]+"','"+info[1]+"','"+info[2]+"')";
		stmt.execute(sql);
	}*/
}