package friendCircle;

import java.util.ArrayList;

public class UserAPI extends SQLmanager {
	private static String produceID() throws Exception {	//自动生成用户ID
		startMySQL();
		String temp = null;
		ArrayList<String> lis = new ArrayList<String>();
		String sql = "SELECT userID FROM `friendCircle`.`user`";
		rs = stmt.executeQuery(sql);
		while (rs.next())
			lis.add(rs.getString("userID"));
		while (true) {
			temp = String.valueOf((int)(Math.random() * 1000000));
			if (!lis.contains(temp))
				break;
		}
		close();
		return temp;
	}
	public static boolean judgeName(String name) throws Exception {
		startMySQL();
		boolean result = true;
		String sql = "SELECT userName FROM `friendCircle`.`user`";
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			if (rs.getString("userName").equals(name))
				result = false;
		}
		close();
		return result;
	}
	public static boolean judgeLegal(String name, String password) throws Exception {
		startMySQL();
		boolean result = false;
		String sql = "SELECT * FROM `friendCircle`.`user` WHERE userName='"+name+"'";
		rs = stmt.executeQuery(sql);
		if (rs.next())
			if (rs.getString("password").equals(password))
				result = true;
		close();
		return result;
	}
	public static String addUser(String[] info) throws Exception {	//添加用户信息，返回自动生成的用户ID
		startMySQL();
		if (info.length == 9) {
			String sql1 = "DELETE FROM `friendCircle`.`user` WHERE userID='"+info[0]+"'";
			stmt.executeQuery(sql1);
			String sql2 = "INSERT INTO `friendCircle`.`user` VALUES "
					+ "('"+info[0]+"','"+info[1]+"','"+info[2]+"','"+info[3]+"','"+info[4]+"',"
							+ "'"+info[5]+"','"+info[6]+"','"+info[7]+"','"+info[8]+"')";
			stmt.executeQuery(sql2);
			close();
			return info[0];
		}
		else {
			String id = produceID();
			String sql = "INSERT INTO `friendCircle`.`user` VALUES "
					+ "('"+id+"','"+info[0]+"','"+info[1]+"','"+info[2]+"','"+info[3]+"',"
							+ "'"+info[4]+"','"+info[5]+"','"+info[6]+"','"+info[7]+"')";
			stmt.executeQuery(sql);
			close();
			return id;
		}			
	}
	public static String[] getUser(String name) throws Exception {	//返回用户信息
		startMySQL();
		String[] info = new String[9];
		String sql = "SELECT * FROM `friendCircle`.`user` WHERE userName='"+name+"'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			info[0] = rs.getString("userID");
			info[1] = rs.getString("userName");
			info[2] = rs.getString("password");
			info[3] = rs.getString("email");
			info[4] = rs.getString("signature");
			info[5] = rs.getString("displayPhoto");
			info[6] = rs.getString("sex");
			info[7] = rs.getString("birthday");
			info[8] = rs.getString("city");
		}
		close();
		return info;
	}
}