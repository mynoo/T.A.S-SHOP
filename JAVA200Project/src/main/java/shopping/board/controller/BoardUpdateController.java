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

public class BoardUpdateController extends SuperClass {	
	private Board bean = null ; 
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("bno")) ;
		BoardDao dao = new BoardDao();

		Board bean = dao.SelectDataByPk(bno) ; 
		
		request.setAttribute("bean", bean);
		
		String gotopage = "/board/boUpdate.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		System.out.println("board update controller");
		
		request.setCharacterEncoding("UTF-8");
		
		bean = new Board() ;
		bean.setBcontents(request.getParameter("bcontents"));
		bean.setTitle(request.getParameter("title"));
		bean.setWriter(request.getParameter("writer"));
		bean.setBno(Integer.parseInt(request.getParameter("bno")));		
		
		System.out.println("bean information");
		System.out.println(bean.toString()); 
		
		if (this.validate(request) == true) {
			System.out.println("board update validation check success");
			BoardDao dao = new BoardDao();
			int cnt = - 999999 ;
			cnt = dao.UpdateData(bean) ;
			
			new BoardListController().doGet(request, response); 
			
		} else {
			System.out.println("board update validation check failure");
			
			request.setAttribute("bean", bean);
			String gotopage = "/board/boUpdate.jsp" ;
			super.GotoPage(gotopage);
		}
	}

	
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true ;		
		if (bean.getTitle().length() < 3 || bean.getTitle().length() > 10) {
			request.setAttribute(super.PREFIX + "subject", "3글자 이상 10글자 이하입니다.");
			isCheck = false ;
		}
		
		if (bean.getBcontents().length() < 5 || bean.getBcontents().length() > 30) {
			request.setAttribute(super.PREFIX + "content", "5글자 이상 30글자 이하입니다.");
			isCheck = false ;
		}
		return isCheck ;
	}
}