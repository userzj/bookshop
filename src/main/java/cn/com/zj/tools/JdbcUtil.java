package cn.com.zj.tools;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.Map;
import java.util.TreeMap;

public class JdbcUtil {

	String url = "jdbc:mysql://localhost:3308/bookshop";
	String user = "root";
	String password = "mysql";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	//加载驱动
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	
	// 获取连接对象
	public Connection getConn(){
		try {

			conn = DriverManager.getConnection(url, user, password);
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		
	}

	// 获取语句对象
	public Statement getStmt() {
		try {

			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			return stmt;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			//release();
		}
	}


	// 更新并返回被影响行数
	public int update(String sql) {
		int num;
		try {
			num = getStmt().executeUpdate(sql);
			return num;
		} catch (SQLException e) {

			e.printStackTrace();
			return -1;
		} finally {
			release();
		}

	}
	

	// 查询返回ResultSet
	public ResultSet query(String sql) {
		try {
			rs = getStmt().executeQuery(sql);
			return rs;
		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		}

	}
	//通过RSMD将结果集保存在list中，最终释放资源
	public LinkedList<Map<String, Object>> queryByList(String sql) {
		LinkedList<Map<String, Object>> list = new LinkedList<Map<String, Object>>();
		try {
			rs = getStmt().executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			//获取列数
			int columnCount = rsmd.getColumnCount();
			while (rs.next()) {
				Map<String, Object> map = new TreeMap<String, Object>();
				for (int i = 0; i < columnCount; i++) {
					String key = rsmd.getColumnName(i+1);
					String value = rs.getString(key);
					map.put(key, value);
				}
				list.add(map);

			}
			return list;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} finally {
			//释放资源
			release();
		}
	}
	
	/**批量更新*/
	public void  updateBatch(String[] sqls){
		stmt = getStmt();
		
		/**设置不自动提交*/
		try {
			conn.setAutoCommit(false);
			for(String sql : sqls){
				stmt.addBatch(sql);
			}
			stmt.executeBatch();
			
			/**事务提交*/
			conn.commit(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void release() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
