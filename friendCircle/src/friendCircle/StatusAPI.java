package friendCircle;

import java.util.ArrayList;

public class StatusAPI extends SQLmanager {
	private String produceID() throws Exception {	//自动生成状态ID
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
		return temp;
	}
	public String addStatus(String[] info) throws Exception {	//添加状态信息，返回自动生成的状态ID
		startMySQL();
		String id = produceID();
		String sql = "INSERT INTO `friendCircle`.`status` VALUES "
				+ "('"+id+"','"+info[0]+"','"+info[1]+"','"+info[2]+"','"+info[3]+"')";
		stmt.execute(sql);
		return id;
	}
	public String[] getStatus(String id) throws Exception {	//返回状态信息
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
		return info;
	}
	public void delStatus(String id) throws Exception {	//删除状态
		startMySQL();
		String sql = "DELETE FROM `friendCircle`.`status` WHERE statusID='"+id+"'";
		stmt.executeQuery(sql);
	}
	public String[][] getStatusByUserID(String userID) throws Exception {	//返回某个用户最近的所有状态
		startMySQL();
		String[][] result = new String[20][2];
		String sql = "SELECT content,date,time FROM `friendCircle`.`status` WHERE `userID`='"+userID+"' ORDER BY date DESC, time DESC LIMIT 20";
		rs = stmt.executeQuery(sql);
		int count = 0;
		while (rs.next()) {
			result[count][0] = rs.getString("content");
			result[count][1] = rs.getString("date") + " " + rs.getString("time");
			count++;
		}
		return result;
	}
}