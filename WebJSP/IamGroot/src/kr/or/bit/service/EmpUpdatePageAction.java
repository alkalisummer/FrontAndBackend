package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpUpdatePageAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    ActionForward forward = new ActionForward();
    int empno = Integer.parseInt(request.getParameter("empno"));

    EmpDao dao = new EmpDao();
    Emp emp = dao.selectByEmpno(empno);
    List<Emp> list = dao.selectAll();
    
    List<Integer> empnolist = new ArrayList<Integer>();
    
    for (Emp e : list) {
      if (e.getEmpno() != 0) {
        empnolist.add(e.getEmpno());
      }
    }
    
    List<String> jobList = dao.selectDistinctJob();
    List<Integer> deptList = dao.selectDistinctDeptno();
    
    request.setAttribute("emp", emp);
    request.setAttribute("mgrList", empnolist);
    request.setAttribute("jobList", jobList);
    request.setAttribute("deptList", deptList);

    forward.setRedirect(false);
    forward.setPath("/WEB-INF/views/update.jsp");

    return forward;
  }
}
