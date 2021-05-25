package shopping.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.product.model.Product;
import shopping.product.model.ProductDao;

public class ProductDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int pno = Integer.parseInt(request.getParameter("pno")) ;
		
		int cnt = -99999 ;
		
		ProductDao dao = new ProductDao();
		cnt = dao.DeleteData(pno) ;
		
		if(cnt != 0) {
			System.out.println("상품 삭제 성공");
			
			new ProductListController().doGet(request, response);
			
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