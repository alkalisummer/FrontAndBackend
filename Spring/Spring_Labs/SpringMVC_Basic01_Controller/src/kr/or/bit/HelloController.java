package kr.or.bit;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// 기존 servlet 과 동일한 역할 >> 요청이 오면 >> [doGET, doPOST(doProcess)]>>handleRequest
public class HelloController implements Controller {

	public HelloController() {
		System.out.println("HelloController 객체 생성");
	}
	
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    System.out.println("HelloController 요청실행: handleRequest 함수 실행");
	    //업무 수행(게시판 목록보기, 글쓰기....)
	    ModelAndView mav = new ModelAndView(); //데이터를 담고, view를 지정 
	    
	    mav.addObject("name","hong");// request.setAttribute 와 비슷 
	    mav.setViewName("Hello");// view 별도 구성 
	    
	    
	    
		return mav;
	}

}
