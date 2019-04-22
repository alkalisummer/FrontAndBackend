<%@page import="java.sql.ResultSet" %>
<%@page import="kr.or.bit.utils.SingletonHelper" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  if (session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
    //강제로 다른 페이지 이동
    out.print("<script>location.href='Login.jsp'</script>");
  }
%>

<jsp:include page="common/head.jsp"/>
<link rel="stylesheet" href="css/Detail_Table.css"/>
</head>
<body>
<jsp:include page="common/header.jsp"/>
<div class="center-area">
  <jsp:include page="common/aside.jsp"/>
  <main>
    <%
      String id = request.getParameter("id");
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try {
        conn = SingletonHelper.getConnection("oracle");
        String sql = "select id, pwd, name, age, gender, email from koreamember where id = ?";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, id);
      
        rs = pstmt.executeQuery();
      
      int row = 0;
      while (rs.next()) {
      	row = rs.getRow();
      }
      
      rs = pstmt.executeQuery();
        	
        	
    %>
    
    <img src="images/user.png" style="float: left; margin: 5%;">
    <table class="container" style="float: left; margin: 0 auto;">
      <tr>
      <c:forEach var="i" begin="1" end="<%= row%>">
       <c:set var="next" value="<%= rs.next()%>"/>
        <c:set var="id" value="<%= rs.getString(\"id\")%>" />
        <c:set var="pwd" value="<%= rs.getString(\"pwd\")%>" />
         <c:set var="age" value="<%= rs.getString(\"age\")%>" />
          <c:set var="gender" value="<%= rs.getString(\"gender\")%>" />
           <c:set var="email" value="<%= rs.getString(\"email\")%>" />
            <c:set var="name" value="<%= rs.getString(\"name\")%>" />
        <tr>
     
        <td>아이디</td>
      <%--   <td><%= rs.getString("id") %> --%>
         <td>${id}
        </td>
      </tr>
      <tr>
        <td>비밀번호</td>
      
        <td>${pwd}
        </td>
      </tr>
      <tr>
        <td>이름</td>
       
        <td>${name}
        </td>
      </tr>
      <tr>
        <td>나이</td>
         
        <td>${age}
        </td>
      </tr>
      <tr>
        <td>성별</td>
         
        <td>${gender}
        </td>
      </tr>
      <tr>
        <td>이메일</td>
        <td>${email}
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <a href="MemberList.jsp" style="color: white;">목록 가기</a>
        </td>
      </tr>
      </c:forEach> 
    </table>
    <%
        
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        SingletonHelper.close(rs);
        SingletonHelper.close(pstmt);
      }
    %>
  </main>
</div>
<jsp:include page="common/footer.jsp"/>