package friendCircle;

import java.util.ArrayList;

public class CommentAPI extends SQLmanager {
	private String produceID() throws Exception {	//自动生成评论ID
		startMySQL();
		String temp = null;
		ArrayList<String> lis = new ArrayList<String>();
		String sql = "SELECT commentID FROM `friendCircle`.`comment`";
		rs = stmt.executeQuery(sql);
		while (rs.next())
			lis.add(rs.getString("commentID"));
		while (true) {
			temp = String.valueOf((int)(Math.random()*1000000));
			if (!lis.contains(temp))
				break;
		}
		return temp;
	}
	public String addComment(String[] info) throws Exception {	//添加评论信息，返回自动生成的评论ID
		startMySQL();
		String id = produceID();
		String sql = "INSERT INTO `friendCircle`.`comment` VALUES "
				+ "('"+id+"','"+info[0]+"','"+info[1]+"','"+info[2]+"','"+info[3]+"','"+info[4]+"')";
		stmt.execute(sql);
		return id;
	}
	public String[] getComment(String id) throws Exception {	//返回评论信息
		startMySQL();
		String[] info = new String[6];
		String sql = "SELECT * FROM `friendCircle`.`comment` WHERE commentID='"+id+"'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			info[0] = rs.getString("commentID");
			info[1] = rs.getString("userID");
			info[2] = rs.getString("statusID");
			info[3] = rs.getString("date");
			info[4] = rs.getString("time");
			info[5] = rs.getString("content");
		}
		return info;
	}
	public void delComment(String id) throws Exception {	//删除评论
		startMySQL();
		String sql = "DELETE FROM `friendCircle`.`comment` WHERE commentID='"+id+"'";
		stmt.execute(sql);
	}
	public String[][] getCommentsByStatusID(String statusID) throws Exception {	//获取指定状态的所有评论
		startMySQL();
		String[][] result = new String[100][3];
		String sql = "SELECT c.userID,r.targetID,c.content FROM `friendCircle`.`comment` AS c, `friendCircle`.`reply` AS r WHERE c.`statusID`='"+statusID+"' AND c.commentID=r.commentID ORDER BY c.date,c.time LIMIT 100";
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