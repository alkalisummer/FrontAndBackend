package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.EmpLoginAction;

/**
 * Servlet implementation class EmpController
 */
@WebServlet("*.do")
public class EmpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EmpController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    String requestUri = request.getRequestURI();
    String contextPath = request.getContextPath();
    String urlCommand = requestUri.substring(contextPath.length());
    	
    Action action = null; 
    ActionForward forward = null;
    if(urlCommand.equals("/login.do")) {
    	action = new EmpLoginAction();
    	forward = action.execute(request, response);
    }
    
    
    
    if (forward != null) {
        if (forward.isRedirect()) {
          response.sendRedirect(forward.getPath());
        } else {
          RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
          dis.forward(request, response);
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
