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
  404: file not found
  500: 서버쪽 코드(실행시 0으로, null 잘못된 처리)
  
  500에외가 발생하면 ...
 -->
 <%
  String data= request.getParameter("name").toLowerCase();
  

%>
 전달 받은 내용 :<%=data %>
</body>
</html>