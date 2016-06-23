package friendCircle;

import java.util.ArrayList;

public class PictureAPI extends SQLmanager {
	public static void addPicture(String id, String[] info) throws Exception {	//添加图片信息
		startMySQL();
		for (String i : info) {
			String sql = "INSERT INTO `friendCircle`.`picture` VALUES "
					+ "('"+id+"','"+i+"')";
			stmt.executeQuery(sql);
		}
		close();
	}
	public static ArrayList<String> getPicture(String id) throws Exception {	//返回一条状态所有图片信息
		startMySQL();
		ArrayList<String> lis = new ArrayList<String>();
		String sql = "SELECT * FROM `friendCircle`.`picture` WHERE statusID='"+id+"'";
		rs = stmt.executeQuery(sql);
		while (rs.next())
			lis.add(rs.getString("path"));
		close();
		return lis;
	}
	public static void delPicture(String id) throws Exception {	//删除一条状态对应所有图片
		startMySQL();
		String sql = "DELETE FROM `friendCircle`.`picture` WHERE statusID='"+id+"'";
		stmt.executeQuery(sql);
		close();
	}
}