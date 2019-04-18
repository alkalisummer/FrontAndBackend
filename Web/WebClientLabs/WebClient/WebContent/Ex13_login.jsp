<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   
   // java 코드 구현
   String userid = request.getParameter("userid");
   String userpwd = request.getParameter("userpwd");
   
   
   
   
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h3>당신이 입력한 데이터는</h3>
   ID: <%= userid %> <br>
   PWD:<%= userpwd %><br>
</body>
</html>