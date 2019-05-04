package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;

public class EmpDeleteAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

    ActionForward forward = new ActionForward();

    int empno = Integer.parseInt(request.getParameter("empno"));

    EmpDao dao = new EmpDao();
    int result = dao.deleteEmp(empno);

    String msg = "";
    String url = "list.do";

    if (result > 0) {
      msg = "삭제되었습니다";
    } else {
      msg = "삭제되지 않았습니다";
    }

    request.setAttribute("msg", msg);
    request.setAttribute("url", url);

    forward.setRedirect(false);
    forward.setPath("/WEB-INF/views/redirect.jsp");

    return forward;
  }

}
