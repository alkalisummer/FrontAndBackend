<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="border-collapse: collapse">
		<tr>
		<th>사번 </th>
		<th>이름 </th>
		<th>직업 </th>
		<th>연봉 </th>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr>
		<td>${list.empno}</td>
		<td>${list.ename}</td>
		<td>${list.job}</td>
		<td>${list.sal}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>