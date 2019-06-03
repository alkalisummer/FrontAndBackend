package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.EmpDao;




@WebServlet("/checkEmpnoAjax.do")
public class checkEmpnoAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public checkEmpnoAjax() {
        super();
    }
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out = response.getWriter(); 
    	
    	String empnoStr = request.getParameter("empno");
    	if(empnoStr.equals("")) {
    		out.print("true");
    	}else {
        	EmpDao dao = new EmpDao();
        	if(dao.isCheckByEmpno(empnoStr)=="true") {
        		out.print("true");
        	}else {
        		out.print("false");
        	}
    	}
    	

	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doProcess(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
