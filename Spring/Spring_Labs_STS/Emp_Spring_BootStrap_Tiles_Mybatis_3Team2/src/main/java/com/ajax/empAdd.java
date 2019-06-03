package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.EmpDto;

@WebServlet("/addemp.do")
public class empAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public empAdd() {
        
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter(); 
		int resultrow=0;
		int totalMember=0;
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		int mgr = Integer.parseInt(request.getParameter("mgr"));
		String hiredate = request.getParameter("hiredate");
		int sal = Integer.parseInt(request.getParameter("sal"));
		int comm = Integer.parseInt(request.getParameter("comm"));
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		
		EmpDto dto = new EmpDto(empno,ename,job,mgr,hiredate,sal,comm,deptno);
		EmpDao dao=null;
		try {
			dao = new EmpDao();
			resultrow = dao.AddEmpMember(dto);
			totalMember = dao.totalEmpMemberCount();
		} catch (Exception e) {
			System.out.println("addemp.do 오류발생! - " + e.getMessage());
		}
		
		if(resultrow!=-1) {
			out.print("<tr><td class='text-center'>"+totalMember+"</td>");
			out.print("<td class='text-center'>"+empno+"</td>" + 
					"            <td class='text-center'>"+ename+"</td>" + 
					"            <td class='text-center'>"+job+"</td>" + 
					"            <td class='text-center'>"+mgr+"</td>" + 
					"            <td class='text-center'>"+hiredate+"</td>" + 
					"            <td class='text-center'>"+sal+"</td>" + 
					"            <td class='text-center'>"+comm+"</td>" + 
					"            <td class='text-center'>"+deptno+"</td>" + 
					"            <td class='td-actions text-center'>" + 
					"                <button type='button' rel='tooltip' class='btn btn-info btn-sm btn-icon'" + 
					"                name='"+ename+"' title='"+ename+"'s 프로필 사진등록'>" + 
					"                    <i class='far fa-address-card'></i>" + 
					"                </button>" + 
					"                <button type='button' rel='tooltip' class='btn btn-success btn-sm btn-icon'" + 
					"                onclick='location.href='edit.do?empno="+empno+"''" + 
					"                name='"+empno+"' id='"+empno+"' title='"+ename+"'s 정보수정'>" + 
					"                    <i class='fas fa-user-cog'></i>" + 
					"                </button>" + 
					"                <button type='button' rel='tooltip' class='btn btn-danger btn-sm btn-icon'" + 
					"                onclick='location.href='delete.do?empno="+empno+"''" + 
					"                 name='"+empno+"' id='"+empno+"' title='"+ename+"'s 삭제하기'>" + 
					"                    <i class='fas fa-user-slash'></i>" + 
					"                </button></td></tr>");
		}else {
			out.print("FALSE");
		}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
