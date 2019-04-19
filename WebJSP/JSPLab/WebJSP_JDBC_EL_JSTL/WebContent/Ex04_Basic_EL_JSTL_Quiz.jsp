<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	String id = request.getParameter("ID");
	if(id.equals("hong")){
%>
	<%=id%><img src="images/1.jpg" alt="이미지" style="width: 100px;height: 100px">
<%		
	}
%>    
<!--  
 param      :	 요청 파라미터의  값을 String으로, request.getParameter()의 결과와 동일
 paramValue	:    요청 파라미터의  값을 String[]으로, request.getParameterValues()의 결과와 동일
-->    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h3>EL 과 JSTL</h3>
	<c:if test="${param.ID == 'hong'}">
		${param.ID}<img src="images/1.jpg" alt="이미지" style="width: 100px;height: 100px">
	</c:if>
	<!-- 
		문제: Client 에서 ?age=100 값을 받아서 age 값이 20 보다 큰 값이면
		      그 값을 출력하는 EL & JSTL 구문을 작성하세요
		      
		      EL: ${200+300}<br>
			  EL: ${"1" + 1}<br> 
			  EL: ${1==1}<br>
              EL: ${!true}<br>
              EL" ${empty x}<br>
              http://localhost:8090/WebJSP_JDBC_EL_JSTL/Ex04_Basic_EL_JSTL_Quiz.jsp?ID=hong&age=100
	 -->
	 <h3>JSTL IF문</h3>
	 <c:if test="${param.age > 20}"  var="result">
	 	param value : ${param.age}<br>
	 	result = ${param.age}
	 </c:if>
	 <br>
	 if구문의 조건 결과값 저장 : ${result}
 </body>
</html>















