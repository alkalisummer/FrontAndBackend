<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="list" value="${requestScope.list}" />
<c:forEach var="emp" items="${list}">
<tr>
  <td>${emp.empno}</td>
  <td><a href = "load.do?empno=${emp.empno}" class="upload">${emp.ename}</a></td>
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