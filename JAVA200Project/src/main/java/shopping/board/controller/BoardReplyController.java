package shopping.board.controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.board.model.Board;
import shopping.board.model.BoardDao;
import shopping.common.controller.SuperClass;

public class BoardReplyController extends SuperClass {
	private Board bean = null ;
	private BoardDao dao = null ; 
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");

		bean = new Board() ;
		bean.setBcontents(request.getParameter("bcontents")); 
		bean.setTitle(request.getParameter("title"));
		bean.setWriter(request.getParameter("writer"));
		
//		int depth = Integer.parseInt(request.getParameter("depth")) ;
//			
//		bean.setDepth(depth);
		
		System.out.println("bean information");
		System.out.println(bean.toString()); 
		
		new BoardReplyController().doPost(request, response); 
		
		
		if (this.validate(request) == true) {
			System.out.println("board reply validation check success");
			dao = new BoardDao();
			int cnt = - 999999 ;
			new BoardReplyController().doGet(request, response); 
			
		} else {
			System.out.println("board reply validation check failure");
			
			request.setAttribute("bean", bean);
			String gotopage = "/board/boReply.jsp" ;
			super.GotoPage(gotopage);
		}
		
		
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		request.setCharacterEncoding("UTF-8");

		dao = new BoardDao() ;
		
		int cnt = -99999 ;
		
		int replysu = 5 ;
		
		String gotopage = "/board/board_detailexam.jsp" ;
		super.GotoPage(gotopage);
		
		if (cnt == replysu) { // �떟湲� �옉�꽦 媛��닔 珥덇낵
			String message = "답글 작성 갯수 " + replysu + "개를 초과하였습니다." ;
			super.setErrorMessage(message);
			
		} else {
			
		}
		
	}
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true ;		
		if (bean.getTitle().length() < 3 || bean.getTitle().length() > 10) {
			request.setAttribute(super.PREFIX + "Title", "제목은 3자리 이상 10자리 이하이어야 합니다.");
			isCheck = false ;
		}
	
		if (bean.getBcontents().length() < 5 || bean.getBcontents().length() > 30) {
			request.setAttribute(super.PREFIX + "Bcontents", "글 내용은 5자리 이상 30자리 이하이어야 합니다.");
			isCheck = false ;
		}
		return isCheck ;
	}
}