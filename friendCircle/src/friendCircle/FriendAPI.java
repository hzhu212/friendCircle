package friendCircle;

import java.util.ArrayList;

public class FriendAPI extends SQLmanager {
	public void addFriend(String[] info) throws Exception {	//添加朋友信息
		startMySQL();
		String sql1 = "INSERT INTO `friendCircle`.`friend` VALUES "
				+ "('"+info[0]+"','"+info[1]+"')";
		stmt.execute(sql1);
		String sql2 = "INSERT INTO `friendCircle`.`friend` VALUES "
				+ "('"+info[1]+"','"+info[0]+"')";
		stmt.execute(sql2);
	}
	public ArrayList<String> getFriend(String id) throws Exception {	//返回朋友信息
		startMySQL();
		ArrayList<String> lis = new ArrayList<String>();
		String sql = "SELECT * FROM `friendCircle`.`friend` WHERE userID1='"+id+"'";
		rs = stmt.executeQuery(sql);
		while (rs.next())
			lis.add(rs.getString("userID1"));
		return lis;
	}
	public void delFriend(String[] id) throws Exception {	//删除朋友
		startMySQL();
		String sql1 = "DELETE FROM `friendCircle`.`friend` WHERE userID1='"+id[0]+"' AND userID2='"+id[1]+"'";
		stmt.execute(sql1);
		String sql2 = "DELETE FROM `friendCircle`.`friend` WHERE userID2='"+id[0]+"' AND userID1='"+id[1]+"'";
		stmt.execute(sql2);
	}
	public ArrayList<String> ifFriend(String myID, String ID) throws Exception {	//查询是否为朋友，若不是，再查询是否为朋友的朋友
		ArrayList<String> friends = getFriend(myID);
		ArrayList<String> result = new ArrayList<String>();
		if (friends.contains(ID))
			result.add("Friend");
		else {
			boolean flag = true;	//flag为真表示为陌生人
			for (String i : friends) {
				if (getFriend(i).contains(ID)) {
					if (flag) {
						result.add("AlmostFriend");
						flag = false;
					}
					result.add(i);
				}
			}
			if (flag)
				result.add("Stranger");
		}
		return result;
	}
	public ArrayList<String> friendPath(String myID, String ID) throws Exception {	//得到与朋友的朋友之间的路径：我-朋友-朋友的朋友
		ArrayList<String> friends = getFriend(myID);
		ArrayList<String> result = new ArrayList<String>();
		if (!friends.contains(ID)) {
			for (String i : friends) {
				if (getFriend(i).contains(ID)) {
					UserAPI tempUser = new UserAPI(); 
					result.add(tempUser.getUser(tempUser.getUserNameByID(myID))[1]);
					result.add(tempUser.getUser(tempUser.getUserNameByID(i))[1]);
					result.add(tempUser.getUser(tempUser.getUserNameByID(ID))[1]);
					return result;
				}
			}
		}
		return null;
	}
	public ArrayList<ArrayList<String>> getSuggestion(String myID) throws Exception {	//得到所有朋友的朋友（好友推荐）
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		ArrayList<String> friends = getFriend(myID);
		ArrayList<String> hasChecked = new ArrayList<String>();
		for (String fri : friends) {
			ArrayList<String> tempFriends = getFriend(fri);
			for(String tmp : tempFriends) {
				if (hasChecked.contains(tmp))
					continue;
				else {
					result.add(this.friendPath(myID,tmp));
					hasChecked.add(tmp);
				}
			}
		}
		return result;
	}
}