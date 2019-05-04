package kr.or.bit.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpRegisterAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    // TODO Auto-generated method stub

    ActionForward forward = null;
    try {
      int result = 0;
      String url = "";

      String msg = "";

      Emp emp = new Emp();
      
      emp.setEmpno(Integer.parseInt(request.getParameter("empno")));
      emp.setEname(request.getParameter("ename"));
      emp.setDeptno(Integer.parseInt(request.getParameter("deptno")));
      emp.setHiredate(Date.valueOf(request.getParameter("hiredate")));
      emp.setJob(request.getParameter("job"));
      emp.setComm(Integer.parseInt(request.getParameter("comm")));
      emp.setMgr(Integer.parseInt(request.getParameter("mgr")));
      emp.setSal(Integer.parseInt(request.getParameter("sal")));

      EmpDao dao = new EmpDao();

      result = dao.insertEmp(emp);

      if (result > 0) {
        msg = "등록 성공";
        url = "list.do";

      } else {
        msg = "등록 실패";
        url = "list.do";
      }
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);

      forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/WEB-INF/views/redirect.jsp");
    } catch (Exception e) {
      e.printStackTrace();
    }

    return forward;
  }

}
