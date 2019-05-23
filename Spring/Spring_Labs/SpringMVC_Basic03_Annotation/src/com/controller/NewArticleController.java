package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.NewArticleCommand;
import com.service.ArticleService;

/*
 클라이언트 요청 
 1. 화면주세요 (글쓰기 화면) write.do
 2. 처리해주세요 (글쓰기 처리) writeok.do


 /article/newArticle.do(GET방식 , Post 방식)>> 요청 method(get), method(post)
 하나의 요청: 화면, 처리 
 
 */


@Controller
@RequestMapping("/article/newArticle.do") // method Get, Post 구분
public class NewArticleController {
         
	
   private ArticleService articleservice;
   
	@Autowired
	public void setArticleservice(ArticleService articleservice) {
	this.articleservice = articleservice;
}

	//GET 방식 요청(사용자에게 화면단 제공)
	@RequestMapping(method=RequestMethod.GET)
	public String form() {
        System.out.println("GET 방식에 대한 요청");
		return "article/newArticleForm";
		//ViewResolver 에 의해서 
		///WEB-INF/views/ + article/newArticleForm + .jsp
		
    }
    
	/*
	 1.전통적으로 사용되는 Client 요청 데이터 받는 방법 
	 (Spring 에서 더이상 사용되지 않음)
	  public String submit(HttpServletRequest request){
	     
	     request.getParameter("title")
	  }
	  
	  

	
	
	//POST 방식 요청(글쓰기 처리)
	@RequestMapping(method=RequestMethod.POST)
    public String submit(HttpServletRequest request) {
    	 NewArticleCommand article = new NewArticleCommand();
         article.setParentId(Integer.parseInt(request.getParameter("parentId")));
         article.setTitle(request.getParameter("title"));
         article.setContent(request.getParameter("content"));
         
         articleservice.writeArticle(article);
         return "article/newArticleSubmitted";
    	
    }
    
    2. parameter DTO 타입을 명시
     public String submit(NewArticleCommand command)
     //동작원리 JPS(Userbean Action 태그:setProperty)
      input name="이름" >> DTO 객체 memberfield 같다면 ...setter
      
      >>submit(NewArticleCommand command)
      DTO 타입의 memberfield 명과 parameter 이름이 같다면 
      1. 자동으로 DTO 객체 생성: NewArticleCommand command = new NewArticleCommand()
      2. 넘어온 parameter 값을 setter 통해서 자동주입 
      1.1 NewArticleCommand 객체 IoC 컨테이너 안에서 생성 id ="newArticleCommand" 자동 생성 
      
      원칙: ModelAndView mv = new ModelAndView();
           mv.addObject("newArticleCommand", command);
           return mv
           
      1.2 위 원칙이 없어도 view 페이지에 DTO 객체 자동으로 forward(KEY POINT: NewArticleCommand)
       
      
      다시 한번 정리하면 
      1. submit(NewArticleCommand command)
        >> 자동 객체 생성, 주입 , 객체변수명이 자동 (key): newArticleCommand
        >> forward >> view page 전달 
        
      2. 객체의 이름이 자동으로 생성되는 것이 싫어요 
         submit(@ModelAttribute("Articledata") NewArticleCommand command)
         >> 자동으로 생성되는 객체변수명이 Articledata 강제(key:Articledata)
         
      3. Model.addAttribute("Articledata", new NewArticleCommand)
      
      
         
     
       
       
       
     */
	
	@RequestMapping(method=RequestMethod.POST)
    public String submit(@ModelAttribute("Articledata")NewArticleCommand command) {
         articleservice.writeArticle(command);
         return "article/newArticleSubmit";
    	
    }
	
	
	
	
	
}
