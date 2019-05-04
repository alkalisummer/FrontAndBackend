package kr.or.bit.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class EmpRegInputAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    ActionForward forward = new ActionForward();
    EmpDao dao = new EmpDao();
    List<Emp> list = dao.selectAll();
    
    List<Integer> empnolist = new ArrayList<Integer>();
    
    for (Emp e : list) {
      if (e.getEmpno() != 0) {
        empnolist.add(e.getEmpno());
      }
    }
    
    int newEmpno = Collections.max(empnolist) + 1;
    
    List<String> jobList = dao.selectDistinctJob();
    List<Integer> deptList = dao.selectDistinctDeptno();
    
    request.setAttribute("newEmpno", newEmpno);
    request.setAttribute("mgrList", empnolist);
    request.setAttribute("jobList", jobList);
    request.setAttribute("deptList", deptList);
    
    forward.setRedirect(false);
    forward.setPath("/WEB-INF/views/register.jsp");
    return forward;
  }
}
