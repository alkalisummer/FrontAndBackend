package controllers.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.NoticeDao;
import vo.Notice;

//게시판 목록보기 (업무)
//Service -> Dao 객체 생성 -> dao 함수 호출 -> 결과받기
//NoticeController 와 NoticeDao 관계 
//NoticeController 는 NoticeDao에 의존한다.


public class NoticeController implements Controller {

	public NoticeController() {
		System.out.println("[NoticeController]");
	}
	
	private NoticeDao noticedao;
	//NoticeDao noticedao = new NoticeDao()(방식 x)
	//setter 주입(xml 설정, annotation 설정)
	
	public void setNoticedao(NoticeDao noticedao) {
		this.noticedao = noticedao;
	}
     
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 게시판 목록보기(목록보기 서비스)
		//검색처리
		String _page=request.getParameter("pg");
		String _field=request.getParameter("f");
		String _query=request.getParameter("q");
	
		//검색처리(null) default 값 처리
		int page =1;
		String field="TITLE";
		String query="%%";
		
		//조건 처리 
		
		if(_page !=null&&!_page.equals("")) {
			page = Integer.parseInt(_page);
		}
		
		if(_field !=null&&!_field.equals("")) {
			field = _field;
		}
		if(_query !=null&&!_query.equals("")) {
			query = _query;
		}
		//DAO 객체 받아오기
		List<Notice> list =noticedao.getNotices(page,field,query);
		
		//SpringMVC (ModelAndView 객체) >> 기존 request.setAttribute("list",list);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("notice.jsp");
		
		return mv;
	}
	
	



	
}
