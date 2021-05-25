package shopping.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.product.controller.ProductListController;
import shopping.product.model.ProductDao;
import shopping.review.model.ReviewDao;

public class ReviewDeleteController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int vnum = Integer.parseInt(request.getParameter("vnum")) ;
		int pno = Integer.parseInt(request.getParameter("pno")) ;
		int cnt = -99999 ;
		
		ReviewDao dao = new ReviewDao();
		cnt = dao.DeleteData(vnum) ;
		
		if(cnt != 0) {
			System.out.println("상품 삭제 성공");
			
			new ReviewListController().doGet(request, response);
			
		}else {
			System.out.println("상품 삭제 실패");
			
			String gotopage = "/product/prList.jsp" ;
			super.GotoPage(gotopage);
		}
		
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}
