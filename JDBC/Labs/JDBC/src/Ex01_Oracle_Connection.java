import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 JDBC
 1.Java 언어(APP) 를 통해서 oracle(소프트웨어) 연결하고 crud 작업
 2.Java App 의사결정 (어떤  RDBMS 사용) : oracle, mu-sql, ms-sql 
 2.프린터기 구매 : 컴퓨터 - 프린터기 연결 
 Case 1: 정상동작(컴퓨터 프린터 드라이버 내장 )
 Case 2: 프린터 회사 사이트 >> 드라이버 다운로드 >> 통합( 제품)
 2.2 my-sql(https://dev.mysql.com/downloads/file/?id=484818)
 2.3 ojdbc6.jar
 3. 드라이버 참 방법 ( 작업하는 프로젝트에서...)( Java project
 3.1 java >> 속성 >> build path >> jar(추가)
 3.2 드라이버 사용준비 완료 >> 메모리에 Load 해서 사용가능하도록(new ....)
 3.3 class.forName("클래스 이름")>> new 동일한 효과 
 4.Java Code( JDBC API)
 4.1 import java.sql.* >> 아래에 interface, class 제공 
 4.2 개발자는 interface 해석을 통해서 작업 
Point(why : interface 형태로 제공 >>JDBC API: oracel, mysql... >>표준화   )
 oracle 사도 jdbc api 구현 ... (드라이버)
 mysql jdbc api구현 .... (드라이버)
 >> 다형성 사용 .... 
 import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

5.작업순서
5.1 DB 연결 -> 명령 -> 실행 -> 처리 -> 자원해제 
5.1 명령 : DDL(create, drop, alter)
          CRUD(insert, select, update, delete)
5.2 실행:DB 서버에게 전달(구문)
5.3 처리: 화면 출력, 다른곳에 전달 개발자가 ... 
5.4 자원해제(성능)

Tip)
연결 문자열(connectionString) 설정
네트워크 통해서 DB 접근 
(DB 서버ip, PORT (1521, 3306), SID(전역 DB: xe, orcl), 접속계정, 접속비
 
 
  */




public class Ex01_Oracle_Connection {

	public static void main(String[] args) throws Exception {
		 //DB 연결 -> 명령생성 -> 실행 
	    
			Class.forName("oracle.jdbc.OracleDriver"); //- > 생략가능 
			System.out.println("오라클 드라이버 로딩");
			
			//getConnection Connection 구현한 객체의 주소값을 
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "bituser", "1004");
		  System.out.println(conn.isClosed() + "정상(False)");
	
		   
		   System.out.println("DB연결: "+ conn.isClosed());
		 Statement stmt =  conn.createStatement(); // 명령 객체 얻어오기 
		 //CRUD
		 
		String sql = " select empno, ename, sal from emp";
		//stmt.executeQuery(sql);
		
	    ResultSet rs = stmt.executeQuery(sql); // 실행결과를 반환받기 
	    while(rs.next()) {
	        System.out.println(rs.getInt("empno")+"/"+
	                          rs.getString("ename")+"/"+
	        		          rs.getInt("sal"));
	        		

	    }
	    stmt.close();
	    rs.close();
	    conn.close();
		   

	}

}
