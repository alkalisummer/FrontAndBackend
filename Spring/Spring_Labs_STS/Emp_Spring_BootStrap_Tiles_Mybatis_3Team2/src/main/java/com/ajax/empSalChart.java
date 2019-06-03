package com.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.EmpDao;




@WebServlet("/empsalchart.do")
public class empSalChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public empSalChart(){super();}

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out = response.getWriter();
    	EmpDao dao = new EmpDao(); 
		String json = dao.salChart();
		System.out.println(json);
		out.print(json);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doProcess(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doProcess(request, response);}
}