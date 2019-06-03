package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.EmpDto;


@WebServlet("/emplistajax.do")
public class empListAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public empListAjax() {
        super();
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out = response.getWriter(); 
		List<EmpDto> empList= new ArrayList<EmpDto>();
		
		int intValue = 0;
		EmpDao dao=null;
		try {
			if(request.getParameter("wordInt")!="") {
				intValue = Integer.parseInt(request.getParameter("wordInt"));
				dao = new EmpDao();
				empList = dao.getEmpListLike(intValue);
			}else {
				dao = new EmpDao();
				empList = dao.getEmpList();
			}
						
		} catch (Exception e) {
			System.out.println("addemp.do 오류발생! - " + e.getMessage());
		}
		response.setContentType("text/html; charset=UTF-8");
		int index=1;
		if(empList.size()!=0) {
			for(EmpDto emp : empList) {
				out.print("		  <tr>" + 
						"            <td class='text-center'>"+ index++ +"</td>" + 
						"            <td class='text-center'>"+emp.getEmpno()+"</td>" + 
						"            <td class='text-center'>"+emp.getEname()+"</td>" + 
						"            <td class='text-center'>"+emp.getJob()+"</td>" + 
						"            <td class='text-center'>"+emp.getMgr()+"</td>" + 
						"            <td class='text-center'>"+emp.getHiredate()+"</td>" + 
						"            <td class='text-center'>"+emp.getSal()+"</td>" + 
						"            <td class='text-center'>"+emp.getComm()+"</td>" + 
						"            <td class='text-center'>"+emp.getDeptno()+"</td>" + 
						"            <td class='td-actions text-center'>" + 
						"                <button type='button' rel='tooltip' class='btn btn-info btn-sm btn-icon' name='"+emp.getEmpno()+"' title='"+emp.getEname()+"'s 프로필 사진등록'>" + 
						"                    <i class='far fa-address-card'></i>" + 
						"                </button>" + 
						"                <button type='button' rel='tooltip' class='btn btn-success btn-sm btn-icon' onclick='location.href='edit.do?empno="+emp.getEmpno()+"'' name='"+emp.getEmpno()+"' id='"+emp.getEmpno()+"' title='"+emp.getEname()+" 정보수정'>" + 
						"                    <i class='fas fa-user-cog'></i>" + 
						"                </button> " + 
						"                <button type='button' rel='tooltip' class='btn btn-danger btn-sm btn-icon' onclick='location.href='delete.do?empno="+emp.getEmpno()+"'' name='"+emp.getEmpno()+"' id='"+emp.getEmpno()+"' title='"+emp.getEname()+" 삭제하기'>" + 
						"                    <i class='fas fa-user-slash'></i>" + 
						"                </button></td></tr>");
			}

		}else {
			out.print("오류발생");
		}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
