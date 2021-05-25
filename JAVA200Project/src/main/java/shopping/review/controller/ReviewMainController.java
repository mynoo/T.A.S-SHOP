package shopping.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shopping.common.controller.SuperClass;
import shopping.member.model.Member;
import shopping.product.controller.ProductDetailViewController;
import shopping.product.controller.ProductListController;
import shopping.review.model.Review;
import shopping.review.model.ReviewDao;

public class ReviewMainController extends SuperClass{
	private Review bean = null ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		
		System.out.println("여기는 리뷰 메인컨트롤러!");
		System.out.println("pno는 : " + request.getParameter("pno"));
		int pno = Integer.parseInt(request.getParameter("pno")) ;
		
		
		bean = new Review();
		Member mem = new Member();
		bean.setPno(pno);
		
		System.out.println("pno : " + bean.getPno());
		
		
		request.setAttribute("bean", bean);
		
		String gotopage = "/review/prReviewInsert.jsp" ;
		super.GotoPage(gotopage);
		
	}
	
	
}
