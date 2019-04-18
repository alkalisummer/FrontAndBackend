<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
     request.setCharacterEncoding("UTF-8");
    
    String userid = request.getParameter("userId");
    String username = request.getParameter("userName");
    String userpass = request.getParameter("userPass");
    String gender = request.getParameter("gender").equals("male") ? "남자" : "여자" ;
    String userssn1 = request.getParameter("userSsn1") ;
    String userssn2 = request.getParameter("userSsn2");
    String userzipcode = request.getParameter("userZipCode");
    String userAddr1 = request.getParameter("userAddr1");
    String userAddr2 = request.getParameter("userAddr2");
    String userPhone = request.getParameter("userPhone");
    
    String [] hobbys = request.getParameterValues("hobby");
    
    String year = request.getParameter("year") ;
                       
    
    String month = request.getParameter("month");
    
    String day = request.getParameter("day");
    
    
    
    
    
    
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
아이디:<%= userid%><br>
이름:<%= username%><br>
비밀번호: <%= userpass%><br>
성별:<%= gender%><br>
주민번호:<%= userssn1%> - <%=userssn2%><br>
우편번호:<%=userzipcode %><br>
주소:<%= userAddr1%>&nbsp;<%= userAddr2%><br>
번호:<%=userPhone %><br>
<% for(String obj : hobbys) {%>

취미:<%=obj%><br>
<% }   %>
생일:<%=year %> 년 <%=month %>월 <%= day %>일 <br>


</body>
</html>









