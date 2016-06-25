package friendCircle;

import java.util.ArrayList;

public class GroupAPI extends SQLmanager {
	private String recordGroup(String owner, String name) throws Exception {	//分配群ID，添加群记录
		startMySQL();
		String temp = null;
		ArrayList<String> lis = new ArrayList<String>();
		String sql1 = "SELECT groupID FROM `friendCircle`.`group`";
		rs = stmt.executeQuery(sql1);
		while (rs.next())
			lis.add(rs.getString("groupID"));
		while (true) {
			temp = String.valueOf((int)(Math.random() * 1000000));
			if (!lis.contains(temp))
				break;
		}
		String sql2 = "INSERT INTO `friendCircle`.`group` VALUES "
				+ "('"+temp+"','"+owner+"','"+name+"')";
		stmt.execute(sql2);
		return temp;
	}
	public String startGroup(String owner, String name) throws Exception {	//创建群，返回群ID
		startMySQL();
		String id = recordGroup(owner, name);
		String sql1 = "CREATE TABLE '"+id+"' (groupID VARCHAR(50), groupOwner VARCHAR(50), groupMember VARCHAR(50))";
		stmt.execute(sql1);
		String sql2 = "INSERT INTO `friendCircle`.`'"+id+"'` VALUES "
				+ "('"+id+"','"+owner+"','"+owner+"')";
		stmt.execute(sql2);
		return id;
	}
	public void enterGroup(String person, String groupID) throws Exception {	//加入群组
		startMySQL();
		String sql = "INSERT INTO `friendCircle`.`'"+groupID+"'` VALUES "
				+ "('"+groupID+"','"+getGroupOwner(groupID)+"','"+person+"')";
		stmt.execute(sql);
	}
	public String getGroupOwner(String id) throws Exception {	//由群ID返回群主名
		startMySQL();
		String name = null;
		String sql = "SELECT groupID FROM `friendCircle`.`group`";
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			if (rs.getString("groupID").equals(id)) {
				name = rs.getString("groupOwner");
				break;
			}
		}
		return name;
	}
	public String getGroupName(String id) throws Exception {	//由群ID返回群名称
		startMySQL();
		String name = null;
		String sql = "SELECT groupID FROM `friendCircle`.`group`";
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			if (rs.getString("groupID").equals(id)) {
				name = rs.getString("groupName");
				break;
			}
		}
		return name;
	}
	public boolean inGroup(String person, String groupID) throws Exception {	//返回一个人是否在一个群里
		startMySQL();
		boolean result = false;
		String sql = "SELECT groupMember FROM `friendCircle`.`'"+groupID+"'`";
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			if (rs.getString("groupMember").equals("person")) {
				result = true;
				break;
			}
		}
		return result;
	}
	public ArrayList<String> getGroup(String name) throws Exception {	//返回一个人加入的所有群
		startMySQL();
		ArrayList<String> result = new ArrayList<String>();
		String sql = "SELECT groupID FROM `friendCircle`.`group`";
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			String temp = rs.getString("groupID");
			if (inGroup(name, temp))
				result.add(temp);
		}
		return result;
	}
	public void delGroup(String id) throws Exception {	//删除某个群组
		startMySQL();
		String sql1 = "DROP TABLE `friendCircle`.`'"+id+"'`";
		stmt.execute(sql1);
		String sql2 = "DELETE FROM `friendCircle`.`group` WHERE groupID='"+id+"'";
		stmt.execute(sql2);
	}
	public boolean existGroup(String id) throws Exception {	//判断群是否存在
		startMySQL();
		String sql = "SELECT * FROM `friendCircle`.`group` WHERE groupID='"+id+"'";
		rs = stmt.executeQuery(sql);
		if (rs.next())
			return true;
		else
			return false;
	}
}
