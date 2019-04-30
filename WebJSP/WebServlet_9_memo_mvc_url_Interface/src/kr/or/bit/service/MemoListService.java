package kr.or.bit.service;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;

public class MemoListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		
		try {
  		  //요청받기
  		
  		  //요청판단 (업무 로직 실행)
  		
  		  memodao dao = new memodao();
  		  List<memo> memolist = dao.getMemoList();
  		  
  		  //요청 결과 저장
  		  request.setAttribute("memolist",memolist);
  		  
  		  //view 지정
  		
  		  
  		  forward = new ActionForward();
    	  forward.setRedirect(false);
    	  forward.setPath("/WEB-INF/views/memolist.jsp");

  		
  	}catch(Exception e){
  		System.out.println(e.getMessage());
  		
  	}
		return forward;
	}

}
