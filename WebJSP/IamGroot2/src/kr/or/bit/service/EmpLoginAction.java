package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;

public class EmpLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	
	     ActionForward forward = new ActionForward();
	    HttpSession session = request.getSession();
	    String id = request.getParameter("id");
	    String pwd = request.getParameter("pwd");
	    
	    System.out.println(id + pwd);
	    EmpDao dao = new EmpDao();
	  boolean result = dao.login(id, pwd);
	   String msg = ""; 
	   String url = "";
	     if(result) {
	    	 msg = "환영합니다.";
	    	 url = "login.html";
	    	 session.setAttribute("id", id);
	    	 session.setAttribute("loginsucess", result);
	    	 
	    	 
	     }else {
	    	 msg ="회원이 아닙니다.";
	    	 url = "login.html";
	    	 session.setAttribute("loginsucess", result);
	    	 
	     }
	    
	     request.setAttribute("msg", msg);
	     request.setAttribute("url", url);
	     
	     forward.setRedirect(false);
	     forward.setPath("/WEB-INF/views/redirect.jsp");
	     
	    
		
		
		
		return forward;
	}

}
