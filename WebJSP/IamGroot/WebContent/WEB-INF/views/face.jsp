<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="empface" value="<%=request.getAttribute(\"empface\")%>" />
<c:set var="emp" value="<%=request.getAttribute(\"emp\")%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 사진 업로드</title>
<link rel="stylesheet" href="../css/master.css">
<link rel="stylesheet" href="../css/face.css">
</head>
<body>
  <nav>
    <div class = "wrap">
    <a href = "list.do">
    <img src = "../picture/icon/groot.png" class = "logo"></a>
    <h1>(주)GROOT</h1>
    <ul>
      <li><a href="regInput.do">사원 등록</a></li>
      <li><a href="chart.do">사원 통계</a></li>
    </ul>
    <ul>
  		<li class="user"><%= session.getAttribute("id") %>님</li>
  		<li><a class="user" href="logout.do">로그아웃</a> </li>
  	</ul>
  </div>
  </nav>
  <div class="container">
  <h3 class="ename">${emp.ename}</h3>
  <h4 class="empno">${empface.empno}</h4>
  <img alt="사원 사진" src="/IamGroot/images/${empface.url}" class="photo">
  <form action="upload.do" method="post" enctype="multipart/form-data">
  <label class="fileSelect pointer">
    <input type="file" name="face" class="file">
         사진 선택하기
  </label> 
    <input type="hidden" name="empno" value="${empface.empno}"><br>
    <input type="submit" value="사진 바꾸기" class="upload-button pointer">
  </form>
  <a href="list.do" class="back pointer">&lt;&nbsp;돌아가기</a>
  </div>
</body>
</html>