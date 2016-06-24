package friendCircle;

public class ReplyAPI extends SQLmanager {
	public void addReply(String[] info) throws Exception {	//添加回复信息
		startMySQL();
		String sql = "INSERT INTO `friendCircle`.`reply` VALUES "
				+ "('"+info[0]+"','"+info[1]+"')";
		stmt.execute(sql);
	}
	public String[] getReply(String id) throws Exception {	//返回回复信息
		startMySQL();
		String[] info = new String[2];
		String sql = "SELECT * FROM `friendCircle`.`reply` WHERE commentID='"+id+"'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			info[0] = rs.getString("commentID");
			info[1] = rs.getString("targetID");
		}
		return info;
	}
	public void delStatus(String id) throws Exception {	//删除回复
		startMySQL();
		String sql = "DELETE FROM `friendCircle`.`reply` WHERE commentID='"+id+"'";
		stmt.execute(sql);
	}
}