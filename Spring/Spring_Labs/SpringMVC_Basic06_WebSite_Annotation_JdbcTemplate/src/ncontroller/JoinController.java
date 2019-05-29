package ncontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.MemberDao;
import vo.Member;

@Controller
@RequestMapping("/joinus/")
public class JoinController {
	private MemberDao memberdao;
	
	@Autowired
	public void setMemberdao(MemberDao memberdao) {
		this.memberdao = memberdao;
	}
	
	//회원 가입 페이지
	@RequestMapping(value="join.htm", method=RequestMethod.GET)
	public String join() {
		return "join.jsp";
	}
	
	//회원 가입 처리
	@RequestMapping(value="join.htm", method=RequestMethod.POST)
	public String join(Member member) {
		try {
			memberdao.insert(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/index.htm";
	}
	
}
