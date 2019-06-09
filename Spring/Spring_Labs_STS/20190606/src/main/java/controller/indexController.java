package controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.EmpDao;

import dto.Emp;


@Controller
public class indexController {

	private SqlSession session;
	
	
	
   @Autowired
   public void setSession(SqlSession session) {
		this.session = session;
	}

@RequestMapping("/index.htm")
	public String index() {
	   
	   
	   return "home";
   }
   
   @RequestMapping("/join.htm")
   public String join() {
	   
	   
	   
	   return "join";
   }
   
 
   
   @RequestMapping("/emptable.htm")
   public String showEmp(Model model) {
	  EmpDao empdao = session.getMapper(EmpDao.class);
	 List<Emp> list = empdao.selectAll();
	    
	   model.addAttribute("list",list);
	   return "empTable";
   }
}


