package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;
import kr.or.bit.dto.EmpFace;

public class EmpLoadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int empno = Integer.parseInt(request.getParameter("empno"));
		System.out.println("empno" +empno);
		EmpDao dao = new EmpDao();
		
		EmpFace empface = dao.loadFace(empno);
		System.out.println(empface.getUrl());
		if (empface.getUrl() == null) {
			empface.setUrl("default.png");
		}
		Emp emp = dao.selectByEmpno(empface.getEmpno());
		
		request.setAttribute("empface", empface);
		request.setAttribute("emp", emp);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/face.jsp");
		
		
		return forward;
	}

}
