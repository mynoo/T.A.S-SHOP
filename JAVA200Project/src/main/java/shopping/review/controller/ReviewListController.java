package shopping.review.controller;

import java.io.IOException;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.product.model.Product;
import shopping.product.model.ProductDao;
import shopping.review.model.Review;
import shopping.review.model.ReviewDao;
import shopping.utility.FlowParameters;
import shopping.utility.Paging;
import shopping.utility.PagingR;

public class ReviewListController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int pno=0;
		if(request.getParameter("pno") != null)
		{
			pno = Integer.parseInt(request.getParameter("pno")) ;
		}
		if(request.getAttribute("pno") != null)
		{
			pno = (int) request.getAttribute("pno");
		}
		
		
		String mid = request.getParameter("mid");

		FlowParameters parameters 
			= new FlowParameters(
				request.getParameter("pageNumber"), 
				request.getParameter("mode"), 
				request.getParameter("keyword")); 
	
		System.out.println("parameter list ");
		System.out.println(parameters.toString());
		String contextPath = request.getContextPath() ;
		String url = contextPath + "/Shopping?command=reviewList" ;
		ReviewDao Rdao = new ReviewDao();
		
		
		int totalCount = Rdao.SelectTotalCount(pno) ; 
		System.out.println("total data size : " + totalCount); 
		
		PagingR pageInfo = new PagingR(
								parameters.getPageNumber(), 
								totalCount, 
								url, 
								parameters.getMode(), 
								parameters.getKeyword(),
								pno);	 	

		List<Review> list = Rdao.SelectDataList(
				pageInfo.getBeginRow(), 
				pageInfo.getEndRow(), 
				parameters.getMode(), 
				parameters.getKeyword(),
				pno) ;
		

//		List<Review> lists = Rdao.SelectDataList(pno) ;
		
		System.out.println("product list count : " + list.size()); 
		
		request.setAttribute("totalcount", totalCount);
		request.setAttribute("lists", list);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("pno", pno);
		
		String gotopage = "/review/prReviewList.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}