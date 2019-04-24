package kr.or.bit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

/*
  id검증( 사용자가 입력한 id) DB에 있는지 없는지 확인 
  
  isCheckById 사용해서 
  
  return "false" or "true" 
  
  
 */
@WebServlet("/MemoId")
public class MemoId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemoId() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		 response.setContentType("text/html;charset=UTF-8");
		 PrintWriter out = response.getWriter();
		 String id = request.getParameter("id");
		 memodao dao = new memodao();
		 String idcheck = dao.isCheckById(id);
		 out.print(idcheck);
		 
		 
		
	      
	    	
	    	   
	      
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
