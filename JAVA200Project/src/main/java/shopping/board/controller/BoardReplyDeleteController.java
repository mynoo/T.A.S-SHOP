package shopping.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.reply.model.ReplyDao;

public class BoardReplyDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("groupno"));
		
		System.out.println("bnobno : "+bno);
		
		request.setAttribute("bno", bno);
		
		int rno = Integer.parseInt(request.getParameter("rno")) ;
		
		System.out.println("bnobno : "+rno);
		
		ReplyDao dao = new ReplyDao();
		int cnt = -99999 ;
		cnt = dao.DeleteData(rno) ;
		
		response.sendRedirect( request.getContextPath() + "/Shopping?command=boDetailView&bno=" + bno );
		
		
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}
