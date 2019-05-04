<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="newEmpno" value="${requestScope.newEmpno}" />
<c:set var="mgrList" value="${requestScope.mgrList}" />
<c:set var="jobList" value="${requestScope.jobList}" />
<c:set var="deptList" value="${requestScope.deptList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록</title>
<link rel="stylesheet" href="../css/update.css">
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
  <form action="register.do" method="POST">
    <label for="empno" class="label">사원번호</label> 
    <input type="text" id="empno" name="empno" class="text" value="${newEmpno}" readonly><br> 
    <label for="ename" class="label">사원이름</label> 
    <input type="text" id="ename" name="ename" class="text"><br> 
    <label for="job" class="label">직업</label> 
    <select name="job" class="select">
      <c:forEach var="job" items="${jobList}">
      <option value="${job}">${job}</option>
      </c:forEach>
    </select><br>
    <label for="hiredate" class="label">입사일</label> 
    <input type="date" id="hiredate" name="hiredate" class="text date"><br> 
    <label for="deptno" class="label">부서번호</label>
    <select name="deptno" class="select">
      <c:forEach var="deptno" items="${deptList}">
      <option value="${deptno}">${deptno}</option>
      </c:forEach>
    </select><br>
    <label for="sal" class="label">월급</label> 
    <input type="text" id="sal" name="sal" class="text"><br>
    <label for="comm" class="label">수당</label> 
    <input type="text" id="comm" name="comm" class="text"><br> 
    <label for="mgr" class="label">관리자 사번</label> 
    <select name="mgr" class="select">
      <option value="0">관리자 없음</option>
      <c:forEach var="mgr" items="${mgrList}">
      <option value="${mgr}">${mgr}</option>
      </c:forEach>
    </select><br>
    <input type="submit" value="등록" class="button"><br>
    <a class="emplink" href="list.do">&lt; 취소하고 돌아가기</a>
  </form>
</body>
</html>