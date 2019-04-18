<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.bit.utils.SingletonHelper"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
/* if(session.getAttribute("userid")== null || !session.getAttribute("userid").equals("admin")){
	//강제로 다른 페이지 이동
	 out.print("<script>location.href='Login.jsp'</script>");
} */



%>
<jsp:include page="common/head.jsp" />
<link rel="stylesheet" href="css/Detail_Table.css" />


</head>
<body>
<jsp:include page="common/header.jsp" />
<div class="center-area">
  <jsp:include page="common/aside.jsp" />
  <main>
   
				<%
				System.out.println("hellow");
					String id= request.getParameter("id");
					Connection conn = null;
			 		PreparedStatement pstmt = null;
			 		ResultSet rs = null;
					
			 		try{
			 			conn = SingletonHelper.getConnection("oracle");
				 	 	String sql = "select id, pwd , name, age , gender , email from koreamember where id=?";
				 	 	pstmt = conn.prepareStatement(sql);
				 	 	
				 	 	pstmt.setString(1,"hong");
				 	 	System.out.println("hi");
				 	 	rs = pstmt.executeQuery();
				 	 
				 	 	//rs.next();
				 	 	while(rs.next()){
				 %>	 		
				 		<table class= "container" style="margin-left: auto;margin-right: auto;">
							<tr>
								<td style="width: 100px">아이디</td>
								<td style="width: 100px"><%= rs.getString("id") %></td>
							</tr>
							<tr>
								<td style="width: 100px">비번</td>
								<td style="width: 100px"><%= rs.getString("pwd") %></td>
							</tr>
							<tr>
								<td style="width: 100px">이름</td>
								<td style="width: 100px"><%= rs.getString("name") %></td>
							</tr>
							<tr>
								<td style="width: 100px">나이</td>
								<td style="width: 100px"><%= rs.getString("age") %></td>
							</tr>
							<tr>
								<td style="width: 100px">성별</td>
								<td style="width: 100px"><%= rs.getString("gender") %></td>
							</tr>
							<tr>
								<td style="width: 100px">이메일</td>
								<td style="width: 100px"><%= rs.getString("email") %></td>
							</tr>
							<tr>
								<td style="width: 100px"></td>
								<td style="width: 100px"></td>
							</tr>
							
							<tr>
							   <td colspan="2">
							       <a href ="Memberlist.jsp" style="color:white;">목록가기</a>
							   </td>
							
							
							</tr>
						</table>
				 <%
				 	 	}
			 		}catch(Exception e){
			 			e.printStackTrace();
			 		}finally{
			 			SingletonHelper.close(rs);
			 			SingletonHelper.close(pstmt);
			 			
			 			
			 		}
				%>
			
		
				
	
  </main>
</div>
<jsp:include page="common/footer.jsp" />