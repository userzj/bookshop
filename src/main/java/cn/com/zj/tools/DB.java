package cn.com.zj.tools;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
//�����Ż�
public class DB {
	
	private Statement stmt;
	private Connection conn;
	private ResultSet rs;

	private void getConnection(){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshop", "root", "mysql");
			
			stmt = conn.createStatement();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int update(String sql){//���Ի�
		getConnection();
		
		int num = -1;
		
		try {
			num = stmt.executeUpdate(sql);
			
			System.out.println(num);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		
		return num;
		
	}
	
	public  ArrayList<String[]> query(String sql){//��Ҫ��һ�������ظ�ʹ�õļ���
		ArrayList<String[]> arr = new ArrayList<String[]>();//�����洢����ݿ��в�ѯ�Ľ��
		getConnection();
		
		try {
			rs = stmt.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();//��ȡ���ṹ����
			int colNum =rsmd.getColumnCount();//��ȡ�ֶ�����
			
			
			
			while(rs.next()){
				//ѭ��һ�� �ǲ���Ҫ����һ��String[]
				String[] s = new String[colNum];//���鶨����  ��������ͬ������͵�
				
				
				for (int i = 1; i <=colNum; i++) {
					String value = rs.getString(i);
					s[i-1] = value; 
					
				}
				
				
				arr.add(s);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close();
		}
		
		
		return arr;
		
	}
	
	
	private  void close(){
		
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
	}
	//sql Ҫ��ѯ�ı�õ�sql���
	//currentPageNum  ��ǰҳ��
	//pageCount  һ����ʾ����
	public ArrayList<String[]> pageQuery(String sql,int currentPageNum,int pageCount){
		
//		"select * from employeelimit 0,3"
		
		String newSql = sql + " limit "+(currentPageNum-1)*pageCount+","+pageCount;
		
		ArrayList<String[]> arr = query(newSql);
		
		return arr;
		
	}
	
	public static void main(String[] args) {
		
		DB db = new DB();
		ArrayList<String[]> arr = db.pageQuery("select * from employee", 1, 3);
		for(String[] temp:arr){
			for(String v:temp){
				System.out.print(v+"\t");
			}
			System.out.println();
		}
		
		
		
		
		
	}
	
	
	
	
	
	
}
