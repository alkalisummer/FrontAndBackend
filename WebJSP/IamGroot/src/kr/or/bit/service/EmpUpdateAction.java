package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpUpdateAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    ActionForward forward = null;
    Emp emp = new Emp();
    emp.setEmpno(Integer.parseInt(request.getParameter("empno")));
    emp.setEname(request.getParameter("ename"));
    emp.setDeptno(Integer.parseInt(request.getParameter("deptno")));
    emp.setJob(request.getParameter("job"));
    emp.setComm(Integer.parseInt(request.getParameter("comm")));
    emp.setMgr(Integer.parseInt(request.getParameter("mgr")));
    emp.setSal(Integer.parseInt(request.getParameter("sal")));
    
    EmpDao dao = new EmpDao();
    int row = dao.updateEmp(emp);
    
    String msg = "";
    String url = "";
    
    if (row > 0) {
      msg = "수정 성공";
      url = "list.do";
    } else {
      msg = "수정 실패";
      url = "updatePage.do";
    }
    
    request.setAttribute("msg", msg);
    request.setAttribute("url", url);

    forward = new ActionForward();
    forward.setRedirect(false);
    forward.setPath("/WEB-INF/views/redirect.jsp");
    
    return forward;
  }
}
