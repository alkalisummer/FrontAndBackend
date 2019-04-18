import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.or.bit.utils.SingletonHelper;

/*
Statement stmt =conn.createStatement(); // 생성주소값리턴
stmt.excuteQuery("select*from emp where empno = 7788")// 실행

장점:쿼리문을 바꾸어 실행 가능하다( 재사용)
이유: parameter 없는 경우 > 고정된 쿼리문 (컬럼명, 테이블명, 시스템 정보)
 
 PreparedStatement (준비된 Statement )
  (1) 설명 
     미리 SQL문이 셋팅된 Statement 가 DB가 전송되어져서   컴파일되어지고, SQL문의 ?(parameter)만 나중에 추가 셋팅해서 실행 
    이 되어지는 준비된 Statement 
  (2) 장점 
     <1> Statement 에 비해서 반복적인 SQL문을 사용할 경우에  더 빠르다. 
     ( 특히, 검색문 ): query 문장 DB 서버에 보내서 컴파일... 실행할때마다 ?(parameter) 전송 
    
     <2> DB컬럼타입과 상관없이 ?하나로 표시하면 되므로   개발자가 헷깔리지 않고 쉽다. ( 특히, INSERT문 )
       (이유: ?를 제외한 SQL문이 DB에서 미리 컴파일되어져서 대기)
  (3) 단점 
     SQL문마다 PreparedStatement 객체를 각각 생성해야 하므로 재사용불가
     (but, Statement 객체는 SQL문이 달라지더라도 한 개만 생성해서  재사용이 가능하다. )
  (4) 특징 
     <1> Statement stmt = con.createStatement(); //생성       stmt.execute(sql);//실행
     <2> PreparedStatement pstmt = con.prepareStatement(sql); //생성      pstmt.execute(); //실행
  (5) 주의 
     DB 객체들(table, ..)의 뼈대(   테이블명 or 컬럼명 or 시퀀스명 등의 객체나 속성명)은 
      ?로 표시할 수 없다. 
     즉, data 자리에만 ?로 표시할 수 있다.
     cf) 그래서, DDL문에서는 PreparedStatement를 사용하지 않는다.
 
    장점: 보안, 미리 쿼리문을 컴파일 시켜놓음 -> parameter만 정송( 네트워크 트래픽 감소)
    단점: 쿼리문의 재사용 불가 
 
 */
public class Ex06_Oracle_PrepareStatement {

	public static void main(String[] args) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		 
		try {
			conn = SingletonHelper.getConnection("oracle");
			String sql = "select empno, ename from emp where deptno = ?";
			// where id=? and name = ? and job = ?
			// ? 개수만큼의 설정 ... 
			//Statement stmt = con.createStatement()
			pstmt= conn.prepareStatement(sql);// 쿼리문을 oracle 보내서 컴파일 ... 
			// 이후에는 parmeter 정보만 설정해서 실행 
		    pstmt.setInt(1, 30);// deptno=? >> deptno = 30 
		    
		    //stmt.executeQuery(sql);
		    rs = pstmt.executeQuery();
		    if(rs.next()) {
		        do {
		        	System.out.println(rs.getInt("empno")+"/"+rs.getString(2));
		        }while(rs.next());
		    	
		    }else {
		    	System.out.println("조회된 데이터가 없어요.");
		    }

	}catch (Exception e) {
		SingletonHelper.close(rs);
		SingletonHelper.close(pstmt);
	    //SingletonHelper.close(conn); APP 살아있는 한 존재 ... 
	}

}}
