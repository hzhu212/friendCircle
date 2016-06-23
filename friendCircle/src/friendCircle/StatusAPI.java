package friendCircle;

import java.util.ArrayList;

public class StatusAPI extends SQLmanager {
	private static String produceID() throws Exception {	//自动生成状态ID
		startMySQL();
		String temp = null;
		ArrayList<String> lis = new ArrayList<String>();
		String sql = "SELECT statusID FROM `friendCircle`.`status`";
		rs = stmt.executeQuery(sql);
		while (rs.next())
			lis.add(rs.getString("statusID"));
		while (true) {
			temp = String.valueOf((int)(Math.random() * 1000000));
			if (!lis.contains(temp))
				break;
		}
		close();
		return temp;
	}
	public static String addStatus(String[] info) throws Exception {	//添加状态信息，返回自动生成的状态ID
		startMySQL();
		String id = produceID();
		String sql = "INSERT INTO `friendCircle`.`status` VALUES "
				+ "('"+id+"','"+info[0]+"','"+info[1]+"','"+info[2]+"','"+info[3]+"')";
		stmt.execute(sql);
		close();
		return id;
	}
	public static String[] getStatus(String id) throws Exception {	//返回状态信息
		startMySQL();
		String[] info = new String[5];
		String sql = "SELECT * FROM `friendCircle`.`status` WHERE statusID='"+id+"'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			info[0] = rs.getString("statusID");
			info[1] = rs.getString("userID");
			info[2] = rs.getString("date");
			info[3] = rs.getString("time");
			info[4] = rs.getString("content");
		}
		close();
		return info;
	}
	public static void delStatus(String id) throws Exception {	//删除状态
		startMySQL();
		String sql = "DELETE FROM `friendCircle`.`status` WHERE statusID='"+id+"'";
		stmt.executeQuery(sql);
		close();
	}
}