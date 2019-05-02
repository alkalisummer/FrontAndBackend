package kr.or.kosta.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.action.Action;
import kr.or.kosta.action.ActionForward;
import kr.or.kosta.service.BoardContentAction;
import kr.or.kosta.service.BoardDeleteAction;
import kr.or.kosta.service.BoardEditAction;
import kr.or.kosta.service.BoardEditOkAction;
import kr.or.kosta.service.BoardListAction;
import kr.or.kosta.service.BoardReplyAction;
import kr.or.kosta.service.BoardReplyDeleteAction;
import kr.or.kosta.service.BoardRewriteOkAction;
import kr.or.kosta.service.BoardWriteAction;


@WebServlet("*.bbs")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String cmdURI = requestURI.substring(contextPath.length());
        
              
        ActionForward forward = new ActionForward();
        Action action = null;

        // 글 작성 화면(화면처리)
        if(cmdURI.equals("/boardwrite.bbs")){
        	forward.setRedirect(false);
        	forward.setPath("/board/board_write.jsp");
        }
         // 글 작성 처리(업무)
        else if(cmdURI.equals("/boardwriteok.bbs")){
        	action = new BoardWriteAction();
        	try {
				forward = action.execute(request, response);
			} 
        	catch (Exception e) {
				e.printStackTrace();
			}
        }
        // 글 리스트 보여주기(업무)
        else if(cmdURI.equals("/boardlist.bbs")){
        	action = new BoardListAction();
        	try {
				forward = action.execute(request, response);
			} 
        	catch (Exception e) {
				e.printStackTrace();
			}
        }
        // 글 상세보기(업무)
        else if(cmdURI.equals("/boardRead.bbs")){
        	action = new BoardContentAction();
        	try {
				forward = action.execute(request, response);
			} 
        	catch (Exception e) {
				e.printStackTrace();
			}
        }
        // 글 수정 화면 제공(업무)
        else if(cmdURI.equals("/boardEditForm.bbs")){
        	action = new BoardEditAction();
        	try {
				forward = action.execute(request, response);
			} 
        	catch (Exception e) {
				e.printStackTrace();
			}
        }
        // 글 수정 처리 (업무)
        else  if(cmdURI.equals("/boardEdit.bbs")){
        	action = new BoardEditOkAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        // 글 삭제 비밀번호 확인(화면)
        else if(cmdURI.equals("/boardDeletePassword.bbs")){
        	forward.setRedirect(false);
        	forward.setPath("/board/board_delete.jsp");
        }
        // 글 삭제 비밀번호 확인 처리(업무)
        else if(cmdURI.equals("/boardDeleteCheck.bbs")){
        	action = new BoardDeleteAction();
        	try {
				forward = action.execute(request, response);
			} 
        	catch (Exception e) {
				e.printStackTrace();
			}
        }
        // 답글작성 화면제공 (화면)
        else if(cmdURI.equals("/boardRewrite.bbs")) {
        	forward.setRedirect(false);
        	forward.setPath("/board/board_rewrite.jsp");
        }
        // 답글 작성(업무)
        else if(cmdURI.equals("/boardRewriteok.bbs")) {
        	action = new BoardRewriteOkAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        // 댓글 작성 화면(UI) >> BoardContent.jsp
        // 댓글 작성(
        else if(cmdURI.equals("/boardReplyok.bbs")) {
        	action = new BoardReplyAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        // 댓글 삭제
        else if(cmdURI.equals("/boardreplyDeleteOk.bbs")) {
        	action = new BoardReplyDeleteAction();
        	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
        
        if(forward != null){
        	if(forward.isRedirect()) {
        		response.sendRedirect(forward.getPath()); //location.href ,
        	}
        	else {
        		RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
        		dis.forward(request, response);
        	}
        }
        
	}


    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
