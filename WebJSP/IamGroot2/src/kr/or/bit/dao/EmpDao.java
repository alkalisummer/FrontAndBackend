package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class EmpDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public EmpDao() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e) {
		      System.out.println(e.getMessage());
		}	
	}
		
		
		public boolean login(String id, String password) {
			boolean login = false;
			String sql = "select * from adminlist where userid = ? and pwd=?";
			
			try {
				conn =ds.getConnection();
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					login = true;
				}
			
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs!=null) {
						rs.close();
					}
					if(pstmt!=null) {
						pstmt.close();
						
					}
					if(conn!=null) {
						conn.close();
					}
	
				}catch(Exception e) {
				  System.out.println(e.getMessage());
				}
	
			}
	
		  return login;
		}
	
	
	


		
		
		
		
}

