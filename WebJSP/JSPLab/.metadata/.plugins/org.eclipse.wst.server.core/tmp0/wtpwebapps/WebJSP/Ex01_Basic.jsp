<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //스크립트릿 (java code 작성)
    Date day = new Date();
    /*
     JSP 페이지 (UI > html, css, script, + code(server)>java)
     JSP 페이지 (tomcat(WAS)+ => jsp(java) => compile(class))
       => 결과(java코드 해서(동적) + 정적) => client 전달 
    
      JSP 구성요소 
      1. 선언부(JSP 페이지에 대한 기본 설정 세팅)
      ex)page(지시자)>> 사용언어, 인코딩 , import 자원
     
      2. 스크립트 요소  
         2.1) 스크립트릿: <%... 자바 코드 영역 
         2.2) 표현식(값을 출력) : 출력대상 >> client 웹 브라우져 <%= 
         2.3) 함수선언부(page에 공통적으로 사용하는 함수) <%!

       
       
    */
 %>  
    
  <%!
     // 공통함수영역
      public int add(int i, int j){
	  return i+j;
  }
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 오늘 날짜: (표현식: 출력)<b><%=day%></b>
 <%
    int result = add(100,200);
 
 %>
 <hr>
 당신이 호출한 함수의 결과는 : <%=result %>
</body>
</html>