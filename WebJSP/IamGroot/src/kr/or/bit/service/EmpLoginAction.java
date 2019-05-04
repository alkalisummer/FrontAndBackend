package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;

public class EmpLoginAction implements Action {
  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    ActionForward forward = new ActionForward();
    HttpSession session = request.getSession();
    String id = request.getParameter("id");
    String pwd = request.getParameter("password");
    
    // System.out.println(id + pwd);
    
    EmpDao dao = new EmpDao();
    boolean login = dao.login(id, pwd);
    
    String msg = "";
    String url = "";
    String loginSuccess = login ? "true" : "false";
    System.out.println(loginSuccess);
    
    if (login) {
      msg = id + "님, 환영합니다.";
      url = "main/list.do";
      session.setAttribute("id", id);
      session.setAttribute("login", loginSuccess);
      System.out.println("loginaction: " + session.getAttribute("id"));
      System.out.println("loginaction: " + session.getAttribute("login"));
    } else {
      msg = "일치하는 회원 정보가 없습니다.";
      url = "login.html";
      session.setAttribute("login", loginSuccess);
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);
    
    forward.setRedirect(false);
    forward.setPath("/WEB-INF/views/redirect.jsp");
    
    return forward;
  }
}
