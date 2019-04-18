<%@page import="java.util.Enumeration"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    request.setCharacterEncoding("UTF-8");
    
    //1. request(클라이언트가 입력한 값을 얻어 올 수 있다. )
    //input > text , password,radio, textarea, select
    // 넘어오는 값이 : 단일값, 다중값 
    // input type : "text" name = "userid" >?userid = kglim
    String userid = request.getParameter("userid");
    String userpwd = request.getParameter("pwd");
    
    //2.다중값
    //input > checkbox(name 동일), select(multimple)
    String [] hobbys = request.getParameterValues("hobby");
    Enumeration<String> e  = request.getParameterNames();
    
    String hb = e.nextElement();
    String [] data = request.getParameterValues(hb);
    String name = "";
    while(e.hasMoreElements()){
    	
    	name += "/" +e.nextElement();
    }
    String data1 = "";
    for(int i = 0; i< data.length; i++){
        data1 += data[i];
    	
    }
    		
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    출력1> <%= userid %><br>
    출력2> <%= userpwd %><br>
    <%
      for(String str : hobbys){
    %>
        취미: <%= str %><br>
        
    <%   
      } 
    %>
    
    values =<%=data1.toString() %><br>
    
    
    
    
    
    [request.getParameterNames()]:<%=name %><br> 




</body>
</html>