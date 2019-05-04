package kr.or.bit.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.EmpFace;

public class EmpUploadAction implements Action {

  @Override
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
    String uploadpath = request.getServletContext().getRealPath("images");
    System.out.println(uploadpath);

    int size = 1024 * 1024 * 10;
    ActionForward forward = null;

    try {
      MultipartRequest multi = new MultipartRequest(request, uploadpath, size, "UTF-8", new DefaultFileRenamePolicy());
      Enumeration<String> filenames = multi.getFileNames();
      String file = filenames.nextElement();
      String face = multi.getFilesystemName(file);
      System.out.println(face);
      int empno = Integer.parseInt(multi.getParameter("empno"));
      System.out.println(face + empno);

      EmpFace empface = new EmpFace();
      empface.setEmpno(empno);
      empface.setUrl(face);

      EmpDao dao = new EmpDao();
      int row = dao.uploadFace(empface);

      String msg = "";
      String url = "load.do?empno=" + empno;
      System.out.println("row="+row);
      if (row > 0) {
        msg = "업로드 성공";
      } else {
        msg = "업로드 실패";
      }

      request.setAttribute("msg", msg);
      request.setAttribute("url", url);

      forward = new ActionForward();
      forward.setRedirect(false);
      forward.setPath("/WEB-INF/views/redirect.jsp");

    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    return forward;
  }

}
