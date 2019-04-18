<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response 객체(응답객체)</title>
</head>
<body>
<!-- 
 Client(웹브라우져) -> Server
                    request: 요청
                    
 Client(웹브라우져) <- Server
                    response: 응답
                    
   javax(Tomcat)제공 
   :request, response 객체 제공 
   
    response 의 제목
   1. 표현식 (출력)
   2. 페이지의 이동처리(sendRedirect)
   
   response.sendRedirect().....(서버쪽 코드) 
   똑같은 원리 Javascript
   location.href = "Ex01_Basic.jsp"
   >>> 둘다 페이지를 서버에게 재요청 
                        
 -->
 1. 일반적인 사용(=출력): <%= 100+200+300 %><br>
 2. sendRedirect : response객체 함수(클라이언트가 서버에게 페이지를 재요청)<br>
 <%
   response.sendRedirect("Ex01_Basic.jsp");
 %>
 <!-- 
 
  response.sendRedirect 코드가 클라이언트 브라우저가 해석할수 있는 형태로 변환 
  <script type = "text/javascript">
     location.href = "Ex01_Basic.jsp"
     </script>
 
  -->
 
</body>
</html>











