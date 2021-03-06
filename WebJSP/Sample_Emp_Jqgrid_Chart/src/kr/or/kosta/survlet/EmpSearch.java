package kr.or.kosta.survlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.kosta.dao.DAO;
import kr.or.kosta.dto.DTO;


@WebServlet("/EmpSearch")
public class EmpSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EmpSearch() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //String empno = request.getParameter("empno");
        String select_name = request.getParameter("select_name"); //encoding select_name
        String select_type = request.getParameter("select_type");
        

        
        // json 배열 객체 생성
        JSONArray jsonarray = new JSONArray();
        
		try{
			select_name = URLDecoder.decode(select_name, "UTF-8"); //한글 select_name
	       
	        
            DAO dao = new DAO();
//			request.setAttribute("result", dtoarr);
//			RequestDispatcher dis = request.getRequestDispatcher("/search.jsp");
//			dis.forward(request, response);
            
         // 디비로 부터 데이터 조회
            ArrayList<DTO> dtoArr = dao.SearchList(select_name,select_type);
 			
            System.out.println("EMPSEARCH 들어왔늬  "+dtoArr.size());
            
 			DTO dto = new DTO();
 			
 			// 조회된 배열 데이터를 jsonObject로 
 			for(int i=0; i<dtoArr.size(); i++){
 				
 				dto = dtoArr.get(i);
 				System.out.println("dto.getEmpno: "+dto.getEmpno());
 				// 담아줄 객체를 새로 생성
 				JSONObject jsonobject = new JSONObject();
 				
 				// dto 객체를 jsonObject 객체로 이동
 				jsonobject.put("empno", dto.getEmpno());
 				jsonobject.put("ename", dto.getEname());
 				jsonobject.put("comm", dto.getComm());
 				jsonobject.put("depno", dto.getDeptno());
 				jsonobject.put("hiredate", dto.getHiredate().toString());
 				jsonobject.put("job", dto.getJob());
 				jsonobject.put("mgr", dto.getMgr());
 				jsonobject.put("sal", dto.getSal());
 				
 				// 담아준 jsonObject 객체를  jsonArray로 담기
 				jsonarray.add(jsonobject);
 			}
            
		}catch(Exception e){
			System.out.println(e.getMessage()); 
		}
		
		// 연결할 페이지와 상관없이 body에 넣어줄 값으로 리턴
		response.getWriter().print(jsonarray);
    }

}
