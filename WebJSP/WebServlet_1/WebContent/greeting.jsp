<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>FrontServletController 에 의해서 forward 된 페이지 </h3>
VIEW:<%=request.getAttribute("msg") %>
<br>
결과:${requestScope.msg}<br>
</body>
</html>