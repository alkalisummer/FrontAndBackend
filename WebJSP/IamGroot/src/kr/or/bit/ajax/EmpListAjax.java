package kr.or.bit.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

@WebServlet("/main/search")
public class EmpListAjax extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public EmpListAjax() {

  }

  private void doProcess(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    String order = request.getParameter("orderBy");
    int number = Integer.parseInt(request.getParameter("number"));
    EmpDao dao = new EmpDao();
    List<Emp> list = null;
    
    if (order.equals("empno")) {
      list = new ArrayList<Emp>();
      Emp emp = dao.selectByEmpno(number);
      if (emp != null) {
        list.add(emp);
      }
    } else {
      list = dao.selectByDeptno(number);
    }
    
    request.setAttribute("list", list);
    
    RequestDispatcher dis = request.getRequestDispatcher("/WEB-INF/views/searchResult.jsp");
    dis.forward(request, response);
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doProcess(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doProcess(request, response);
  }

}
