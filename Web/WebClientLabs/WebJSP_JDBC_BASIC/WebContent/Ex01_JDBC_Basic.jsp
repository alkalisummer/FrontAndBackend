<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        table{border: 1px solid black; border-collapse: collapse;}
        
        tr{border: 1px solid blue; background-color: white; color: black}
        
        td{border: 1px solid red; }
        
    </style>
</head>
<body>
<!-- 
JDBC
1. 드라이버 참조 (WEB > WebContent >> WEB-INF >> lib > ojdbc6.jar 붙여넣기
2. 드라이버 메모리 로딩 : class.forName("드라이버 클래스명");
3. DB연결 (연결문자열 : 서버 IP, PORT, 계정, 비번)
4. JAVA JDBC API (Interface)
Connection
Statement
PrePareStatement
Resultset
 -->
        <table>
                <tr>
                    <th>사번</th>
                    <th>이름</th>
                    <th>급여</th>
                    <th>직종</th>
                </tr>
        
        <%
        //DB연결 -> 명령생성 > 실행 > 처리
            Class.forName("oracle.jdbc.OracleDriver");
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            System.out.println("오라클 드라이버 로딩");
                    
            // getConnection Connection인터페이스를 구현한 객체의 주소값을 리턴
            conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","BITUSER","1004");
            System.out.println(conn.isClosed() + "정상 (False)"); // 너 연결 닫혔니
            
            stmt = conn.createStatement();
            String sql = "select empno, ename, sal, job from emp";
            
            rs = stmt.executeQuery(sql);
            
            
            while(rs.next()) {
                %>   
                <tr>
                    <td><%= rs.getInt(1) %></td>
                    <td><%= rs.getString("ename") %></td>
                    <td><%= rs.getInt(3) %></td>
                    <td><%= rs.getString("job") %></td>
                    </tr>
        
        <%       
            }
            
            if(rs != null) try{rs.close();}catch(Exception e){}
            if(stmt != null) try{stmt.close();}catch(Exception e){}
            if(conn != null) try{conn.close();}catch(Exception e){}
            
            
            
        %>   
        </table>
        
        
        
</body>
</html>
