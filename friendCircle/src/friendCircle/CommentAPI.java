package friendCircle;

import java.util.ArrayList;
import java.util.HashMap;

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
				+ "('"+id+"','"+info[0]+"','"+info[1]+"','"+info[2]+"','"+info[3]+"','"+info[4]+"','"+info[5]+"')";
		stmt.execute(sql);
		return id;
	}
	public String[] getComment(String id) throws Exception {	//返回评论信息
		startMySQL();
		String[] info = new String[7];
		String sql = "SELECT * FROM `friendCircle`.`comment` WHERE commentID='"+id+"'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			info[0] = rs.getString("commentID");
			info[1] = rs.getString("userID");
			info[2] = rs.getString("targetUserID");
			info[3] = rs.getString("statusID");
			info[4] = rs.getString("date");
			info[5] = rs.getString("time");
			info[6] = rs.getString("content");
		}
		return info;
	}
	public void delComment(String id) throws Exception {	//删除评论
		startMySQL();
		String sql = "DELETE FROM `friendCircle`.`comment` WHERE commentID='"+id+"'";
		stmt.execute(sql);
	}
	public ArrayList<HashMap<String,String>> getCommentsByStatusID(String statusID) throws Exception {	//获得指定状态的所有评论
		startMySQL();
		ArrayList<HashMap<String,String>> result = new ArrayList<HashMap<String,String>>();
		String sql = "SELECT t.commentID, u1.userName AS `fromUserName`, u2.userName AS `toUserName`, t.content, t.date, t.time "+
				"FROM friendCircle.user AS u1, friendCircle.user AS u2, (SELECT commentID,userID,targetUserID,content,date,time "+
						"FROM friendCircle.comment WHERE statusID='"+statusID+"') AS t "+
								"WHERE u1.userID=t.userID AND u2.userID=t.targetUserID "+
										"ORDER BY t.date, t.time LIMIT 100 ";
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			HashMap<String, String> aComment = new HashMap<String, String>();
			aComment.put("commentID", rs.getString("commentID"));
			aComment.put("fromUserName", rs.getString("fromUserName"));
			aComment.put("toUserName", rs.getString("toUserName"));
			aComment.put("date", rs.getString("date"));
			aComment.put("time", rs.getString("time"));
			aComment.put("content", rs.getString("content"));
			result.add(aComment);
		}
		return result;
	}
}