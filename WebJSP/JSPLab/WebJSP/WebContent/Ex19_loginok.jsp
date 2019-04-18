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
UID, PWD, Chk 여부 

1. ID, PWD같다면 로그인 성공(id(ID.equals(...)
   chk 이 체크 되었다면 
   > 쿠키 생성 ID 값을 쿠키에 담아서 : 유효타입(24시간)
   > 쿠키 쓰기 완료 
   
2.ID, PWD같다면 로그인 성공(id(ID.equals(...)
   chk이 체크되어 있지 않다면 
   > 만들었던 쿠키 삭제 : setMaxAge(0)
   
   Cookie delco = new Cookie("UID","");
   delco.setMaxAge(0);
   response.addCookie(delco);
   
  
   
3. ID, PWD 같지 않다면 
   response.sendRedirect() -> Ex19_login.jsp 이동 처리 

 -->
<%

  String id = "asdf";
  String pw = "1234";
 
  String uid =  request.getParameter("UID");
  String pwd =  request.getParameter("PWD");
  String chk =  request.getParameter("chk");

  

 if(id.equals(uid) && pwd.equals(pwd) ){
	 out.print("로그인 성공!<br>");
	 if(chk!= null){
		 if(chk.equals("on")){
		 
		   Cookie co = new Cookie(uid,pwd);
		   co.setMaxAge(24*60*60);
		   response.addCookie(co); 
		 }
	 }else{
		   Cookie delco = new Cookie(uid,pwd);
		   delco.setMaxAge(0);
		   response.addCookie(delco);
	 }
     
 }else{
	 response.sendRedirect("/Ex19_login.jsp");
	 
 }

 

%>

   id : <%=uid%><br>
   password: <%=pwd%><br>
   chk: <%=chk%>



</body>
</html>