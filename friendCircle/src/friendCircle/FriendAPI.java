package friendCircle;

import java.util.ArrayList;

public class FriendAPI extends SQLmanager {
	public static void addFriend(String[] info) throws Exception {	//添加朋友信息
		startMySQL();
		String sql1 = "INSERT INTO `friendCircle`.`friend` VALUES "
				+ "('"+info[0]+"','"+info[1]+"')";
		stmt.executeQuery(sql1);
		String sql2 = "INSERT INTO `friendCircle`.`friend` VALUES "
				+ "('"+info[1]+"','"+info[0]+"')";
		stmt.executeQuery(sql2);
		close();
	}
	public static ArrayList<String> getFriend(String id) throws Exception {	//返回朋友信息
		startMySQL();
		ArrayList<String> lis = new ArrayList<String>();
		String sql = "SELECT * FROM `friendCircle`.`friend` WHERE userID1='"+id+"'";
		rs = stmt.executeQuery(sql);
		while (rs.next())
			lis.add(rs.getString("userID1"));
		close();
		return lis;
	}
	public static void delFriend(String[] id) throws Exception {	//删除朋友
		startMySQL();
		String sql1 = "DELETE FROM `friendCircle`.`friend` WHERE userID1='"+id[0]+"' AND userID2='"+id[1]+"'";
		stmt.executeQuery(sql1);
		String sql2 = "DELETE FROM `friendCircle`.`friend` WHERE userID2='"+id[0]+"' AND userID1='"+id[1]+"'";
		stmt.executeQuery(sql2);
		close();
	}
}