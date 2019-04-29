package com;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 
 서블릿(servlet)
 java 파일로 [웹서비스]를 할 목적으로 만든 파일(SimpleController.java)
 서블릿 조건: request, response 객체 사용가능 
 
 1. extends HttpServlet 반드시 상속(웹 환경에서 제공되는 요청,응답) 처리 가능
 
 2. SimpleController 서블릿 
 
 3. SimpleController 서블릿은 이벤트 기본동작
    (함수가 특정 상황에 맞추어서 자동 호출)
    [상황]: 클라이언트가 SimpleController에게 요청을 보냈을때 
  클라이언트가 전송방식 GET으로 요청이 오면 자동으로 호출되는 함수 : doGet
  클라이언트가 전송방식 POST으로 요청이 오면 자동으로 호출되는 함수: doPost
  
  doGET(),doPost() 공통점 
  HttpServletRequest request, HttpServletResponse response 
  parameter 제공 받음으로써 parameter 받고 응답도 가능하다
  
  doGet() 호출되는경우: <a href = "board.do?id=kglim"> 서버에 요청 </a>
  doPost() 호출되는경우: <form method = "post"... submit()
  
  3.1 클라이언트의정보를 얻어온다: request.getParameter()
  
  4.실행단계 
    SimpleController(서블릿)자바파일 요청 -> 컴파일 -> 클래스파일 -> 실행 -> 결과 리턴 
    
  5. 자바 멀티쓰레드 기반 (웹 효율적으로 사용가능) 
     
  6. 만들어진 순서
     servlet(UI만들기힘듬) -> jsp(java코드 + 혼재) -> MVC 패턴 -> Framework(Spring)
     
  7. 최종: Model2 기반의 MVC 패턴을 적용한 프로젝트
  
  7.1:JSP 만 가지고 개발 > Model(DAO,DTO)+JSP > model1 방식
      JSP 모든 클라이언트 요청 받고 -> 처리담당 -> ....    
     
      Model2 방식의 MVC 
      Model(DTO,DAO) >>순수한 JAVA 클래스 
      View>> JSP(EL&JSTL) >> 화면구성
      
      그럼 누가 클라이언트의 요청을 받고 처리하는 과정을 담당 (servlet)
      
      controller>> Servlet  extends HttpServlet 상속받는 파일 
      1. 클라이언트 요청 파악(로그인, 게시판 글쓰기, 게시판 상세보기)
      2. 요청파악을 통해서 (다양한 MVC 적용): DTO 객체 생성, DAO 객체 생성... 
      
   8. 서블릿파일을 클라이언트에서 어떻게 요청할까 
     <form action="loginok.jsp" method="Post">
     //localhost:8090/WebServlet_1/loginok.jsp?id=kglim&pwd=1004
      
     
   8.1 
     서블릿 파일은 요청은 
      1.web.xml 설정을 통해서 주소만들기 
      
      2. servlet 파일의 상단에: @webServlet("/SimpleController")
      localhost:8090/WebServlet_1/SimpleController
      
      최초요청 -> servlet 컴파일  -> 실행 -> doget() 호출, dopost()호출 
       두번째 -> 실행 -> doGet() 호출 or doPost () 호출 
   
  <?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" id="WebApp_ID" version="4.0">
  <display-name>WebServlet_1</display-name>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
  
  </welcome-file-list>
  <servlet>
   <servlet-name>simplecontroller</servlet-name>
   <servlet_class>com.SimpleController</servlet_class>
  </servlet>
  <servlet-mapping>
  <servlet-name>simplecontroller</servlet-name>
  <url-pattern>/simple</url-pattern>
  </servlet-mapping>
</web-app>                                        
      
      
    
  
 
 
 
 
 
 
 
 */

//@WebServlet("/SimpleController")
public class SimpleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SimpleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("클라이언트 요청");
		//1. 사용자의 요청 파악(요청값 받기)
		String type = request.getParameter("type");
		
		//2.요청에 따른 업무수행(service 실행)
		 Object resultobj = null;
		 if(type==null || type.equals("greeting")){
                 resultobj="hello world";
                 
		 }else if(type.equals("date")) {
			 resultobj= new Date();
		 }else {
			 resultobj = "invalid type";
		 }
			//3. 요청완료에 따라서 그 결과를 요청한 사용자에게 전달 
		    //정보를 저장: request객체, session객체, application객체
		  request.setAttribute("result", resultobj);
		  
		  //4. 결과 보여주기 > 필요한 view 를 지정
		  
		  //화면을 출력할 페이지를 정하고 -> 출력할 데이터를 넘겨줘야한다. 
		  // 제어권(forward)
		  
		RequestDispatcher dis =  request.getRequestDispatcher("/simpleview.jsp");
		 //내가 view로 지정한 곳에 forward 작업 
		 dis.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
