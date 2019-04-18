import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.or.bit.utils.SingletonHelper;

public class Ex07_Oracle_Prepare_DML {

	public static void main(String[] args) {
	     //INSERT
		// insert into dmlemp(empno,ename, deptno) values(?,?,?)
		// UPDATE
		// update dmlemp set ename =? , sal = ? , job =?, deptno =? 
		// where empno = ? 
		
		Connection conn = null;
		PreparedStatement pstmt = null;
//		/*
//		  try {
//			 conn = SingletonHelper.getConnection("oracle");
//			 String sql ="insert into dmlemp(empno,ename, deptno) values(?,?,?)";
//			 pstmt = conn.prepareStatement(sql); // 쿼리문 전송 
//			 
//			 //parameter 
//			 pstmt.setInt(1, 5555);
//			 pstmt.setString(2, "김유신");
//			 pstmt.setInt(3, 10);
//			 */
		 try {
		 conn = SingletonHelper.getConnection("oracle");
		 String sql ="update dmlemp set ename =? , sal = ? , job =?, deptno =?  where empno = ? ";
		 pstmt = conn.prepareStatement(sql); // 쿼리문 전송 
		 
		 //parameter 
		 pstmt.setString(1, "강태공");
		 pstmt.setInt(2, 5000);
		 pstmt.setString(3, "낚시꾼");
		 pstmt.setInt(4, 10);
		 pstmt.setInt(5, 7788);
		 
		
			 //실행 
			int row = pstmt.executeUpdate();
			if(row >0) {
				System.out.println("insert row count: "+ row);
				
			}else {
				System.out.println("row count : "+ row);
			}
		}catch (Exception e) {
			  System.out.println(e.getMessage());
			
		}finally {
			 SingletonHelper.close(pstmt);
		}

	}

}
