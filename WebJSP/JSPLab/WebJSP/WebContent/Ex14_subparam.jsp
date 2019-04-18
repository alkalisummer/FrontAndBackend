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
 include 된 페이지에서는 메인 페이지에서 request 객체를 공유받을 수 있다. 
 -->
     <h3>Ex14_include_param_main.jsp : request 객체 공유</h3>
     <fieldset>
     <legend> include</legend>
     request:<%= request.getParameter("type") %>
     request:<%= request.getParameter("userid") %>   
     </fieldset>
     <h3>Main 페이지 Param 액션태그 값 읽기</h3>
     <fieldset>
        <legend>include(param 액션태그)</legend>
        <%
           String aa = request.getParameter("aaaa");
           String pp = request.getParameter("pwd");
           out.print("param 설정값: " + pp+"<br>");
           
           if(aa.equals("CCC")){
        	    out.print("<i>당신이 요청한 제품은: "+ aa+ "</i>");

           }else{
        	   out.print("<i>당신이 요청한 제품은 품절입니다.</i>");
           }
        	  
        
        
        
        %>
     </fieldset>
</body>
</html>