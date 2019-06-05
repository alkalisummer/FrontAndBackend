package ncontroller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.MemberDAO;
import vo.Member;

@Controller
@RequestMapping("/joinus/")
public class JoinController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	private MemberDAO memberdao;
	@Autowired
	public void setMemberdao(MemberDAO memberdao) {
		this.memberdao = memberdao;
	}
	
	//회원 가입 페이지
	@RequestMapping(value="join.htm",method=RequestMethod.GET)
	public String join() {
		//return "join.jsp";
		return "joinus.join";  // <definition name="*.*" 폴더명.파일명
		
	}
	//회원 가입 처리 
	@RequestMapping(value="join.htm",method=RequestMethod.POST)
	public String join(Member member) {
		System.out.println(member.toString());
		try {
			member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
			memberdao.insert(member);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/index.htm"; //   /index.htm 
		//http://localhost:8090/SpringMVC_Basic06_WebSite_Annotation_JdbcTemplate/index.htm
	}
	
	//로그인 페이지
	@RequestMapping(value="login.htm",method=RequestMethod.GET)
	public String login() {
		return "joinus.login"; //Tiles 적용
	}
	
}







