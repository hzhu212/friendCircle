package friendCircle;

import java.util.ArrayList;

public class CommentAPI extends SQLmanager {
	private static String produceID() throws Exception {	//自动生成评论ID
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
		close();
		return temp;
	}
	public static String addComment(String[] info) throws Exception {	//添加评论信息，返回自动生成的评论ID
		startMySQL();
		String id = produceID();
		String sql = "INSERT INTO `friendCircle`.`comment` VALUES "
				+ "('"+id+"','"+info[0]+"','"+info[1]+"','"+info[2]+"','"+info[3]+"','"+info[4]+"')";
		stmt.executeQuery(sql);
		close();
		return id;
	}
	public static String[] getComment(String id) throws Exception {	//返回评论信息
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
		close();
		return info;
	}
	public static void delComment(String id) throws Exception {	//删除评论
		startMySQL();
		String sql = "DELETE FROM `friendCircle`.`comment` WHERE commentID='"+id+"'";
		stmt.executeQuery(sql);
		close();
	}
	public static String[][] getCommentsByStatusID(String statusID) throws Exception{
		startMySQL();
		String[][] result = new String[100][4];
		
		String sql = 
		"SELECT t.commentID, u1.userName as `from`, u2.userName as `to`, t.content "+
		"FROM friendCircle.user as u1, friendCircle.user as u2, (SELECT commentID,userID,targetUserID,content,date,time "+
		"	FROM friendCircle.comment WHERE statusID='"+statusID+"') as t "+
		"WHERE u1.userID=t.userID AND u2.userID=t.targetUserID "+
		"order by t.date, t.time limit 100 ";

		rs = stmt.executeQuery(sql);
		int count = 0;
		while(rs.next()){
			String commentID = rs.getString("commentID");
			String fromUser = rs.getString("from");
			String toUser = rs.getString("to");
			String content = rs.getString("content");
			result[count][0] = commentID;
			result[count][1] = fromUser;
			result[count][2] = toUser;
			result[count][3] = content;
			count ++;
		}
		close();
		return result;
	}
}