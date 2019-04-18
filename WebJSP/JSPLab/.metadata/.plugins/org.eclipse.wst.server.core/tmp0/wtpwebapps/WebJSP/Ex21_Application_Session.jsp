<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
 Today Point
 서버 자원 (WAS) : memory
  application                          
  ->[전역객체]변수(접속하는 모든 사용자에게 공유) 
  
  session
  [개인: 접속한 브라우저: 부여되는 고유값 ] : 접속한 사용자 마다 고유하게 부여되는 변수 
  
  
  사이트 접속: 전체 접속자수 application >>  count +1
  1.application.saetAttribute("count",0) :
   사이트에 접속하는 모든 사용자는 count 변수에 접근가능 ....
   
  2.session.setAttribute("userid","hong");
    접속한 사용자(브라우저) 마다 고유하게 부여되는 변수 
    
    A라는 사용자가 웹서버 접속 
    서버 session 객체 생성 -> 식별값(417325A04B34F4CC8BE4077E38CCC6B9) > 접속브라우저(response)
    session.setAttribute<"userid","kglim");
    
    
    
    B라는 사용자가 웹서버 접속 
    서버 session 객체 생성 -> 식별값(AAAAAAA04B34F4CC8BE4077E38CCC6B9) > 접속브라우저(response)
     session.setAttribute<"userid","hong");
     
     Application 변수는 사용자마다 같은 값 
     Session 변수는 접속하는 사용자마다 다른 값을 가질 수 있다.
     
 -->
     <h3>세션정보</h3>
    웹서버가 부여한 고유한 ID값: <%=session.getId() %>
    <hr>
    
    
   <%
      String userid = request.getParameter("userid");
   session.setAttribute("id", userid);
   //session 변수의 범위: 모든 페이지 
   
   
   %>
     <h3>세션 변수값</h3>
     <%
        String id = (String)session.getAttribute("id");
        out.print("당신의 ID는 <b>" + id + "</b>");
     
     
     
     %>
     
     
     
 
 
 
 
 
</body>

</html>