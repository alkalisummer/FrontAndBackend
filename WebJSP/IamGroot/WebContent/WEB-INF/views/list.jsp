<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>사원 목록</title>
<link rel="stylesheet" href="../css/master.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
  $(function() {
    $("#btn").on("click", function() {
      if (!$("#numberSelect").val()) {
        alert("값을 입력해주세요");
      } else {
        $.ajax({
          url : "search",
          dataType : "html",
          data : {
            orderBy : $("#orderSelect").val(),
            number : $("#numberSelect").val()
          },
          success : function(data) {
            $("#searchResult").html(data);
          },
          error : function(xhr) {
            console.log(xhr.status);
          }
        })
      }
    });
  });
</script>
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
<div class = "main">
  <table class = "emptable">
    <thead>
      <th>사번</th>
      <th>이름</th>
      <th>직종</th>
      <th>관리자 사번</th>
      <th>입사일자</th>
      <th>연봉</th>
      <th>커미션</th>
      <th>부서번호</th>
      <th colspan = "2"></th>
    </thead>
    <tbody id="searchResult">
      <c:forEach var="emp" items="${requestScope.list}">
        <tr>
          <td>${emp.empno}</td>
          <td><a href = "load.do?empno=${emp.empno}" class = "upload">${emp.ename}</a></td>
          <td>${emp.job}</td>
          <td>${emp.mgr}</td>
          <td>${emp.hiredate}</td>
          <td>${emp.sal}</td>
          <td>${emp.comm}</td>
          <td>${emp.deptno}</td>
          <td><a class = "emplink" href="updatePage.do?empno=${emp.empno}">수정</a></td>
          <td><a class = "emplink" href="delete.do?empno=${emp.empno}">삭제</a></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <div class = "search">
  
  <div class = "searchleft">
  <select name="orderBy" id="orderSelect" class = "select">
    <option value="empno">사원 번호</option>
    <option value="deptno">부서 번호</option>
  </select>
  <input type="text" name="number" id="numberSelect" class = "selecttext"/>
  </div>
  <input type="button" value="검색하기" id="btn" class = "button" />
  </div>
</div>
</body>
</html>
