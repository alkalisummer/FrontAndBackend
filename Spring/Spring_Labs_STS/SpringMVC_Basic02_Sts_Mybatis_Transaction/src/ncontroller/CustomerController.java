package ncontroller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import dao.NoticeDao;
import service.CustomerService;
import vo.Notice;

@Controller
@RequestMapping("/customer/")
public class CustomerController {
/*  Mybatis 사용 구현 객체는 (X) 
	private NoticeDao noticedao;
	@Autowired
	public void setNoticedao(NoticeDao noticedao) {
		this.noticedao = noticedao;
	}
	*/
	//서비스 객체에 의존한다.. 누가 ? CustomerController 가... 
	
	private CustomerService customerservice;
	
	@Autowired
	public void setCustomerservice(CustomerService customerservice) {
		this.customerservice = customerservice;
	}
	

	
   //글 목록보기
	@RequestMapping("notice.htm")
	public String notices(String pg , String f , String q , Model model) {
		
				
		 List<Notice> list = customerservice.notices(pg, f, q, model);
		
		model.addAttribute("list", list); //View 단 페이지에 자동 forward (list 이름으로)
		
		//return "notice.jsp";
		return "customer.notice";
	}
	
	//글 상세보기 
	@RequestMapping("noticeDetail.htm")
	public String noticeDetail(String seq , Model model) {
		
		Notice notice = customerservice.noticeDetail(seq);
		
		model.addAttribute("notice", notice);
		
		//return "noticeDetail.jsp";
		return "customer.noticeDetail";
	}
	

	
	//글쓰기 화면
	@RequestMapping(value="noticeReg.htm",method=RequestMethod.GET)
	public String noticeReg() {
		
	
		return "customer.noticeReg";
	}
	
	//글쓰기 처리 
	@RequestMapping(value="noticeReg.htm",method=RequestMethod.POST)
	public String noticeReg(Notice n , HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException {
		
	  String url ="redirect:notice.htm";
		try {
			url=customerservice.noticeReg(n, request);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		//예외발생에 상관없이 목록페이지 요청처리 
		return url;

	}
	
	//글삭제하기
	@RequestMapping("noticeDel.htm")
	public String noticeDel(String seq) throws ClassNotFoundException, SQLException {
		
		return customerservice.noticeDel(seq);
	}
	
	//글 수정하기
	@RequestMapping(value="noticeEdit.htm", method=RequestMethod.GET)
	public String noticeEdit(String seq, Model model) throws ClassNotFoundException, SQLException {
		
		Notice notice =customerservice.noticeEdit(seq);
		model.addAttribute("notice", notice);
		//return "noticeEdit.jsp";
		return "customer.noticeEdit";
	}
	
	
	//글수정하기(DB Update ) : POST
	//파일업로드 처리 (INSERT  동일)
	//처리(update) -> noticeDetail 페이지 redirect 
	@RequestMapping(value="noticeEdit.htm", method=RequestMethod.POST)
	public String noticeEdit(Notice n , HttpServletRequest request) throws IOException, ClassNotFoundException, SQLException {
		
     return customerservice.noticeEdit(n, request);
	
}
	@RequestMapping("download.htm")
	public void download(String p, String f, HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		customerservice.download(p, f, request, response);
	}
	
	
}






