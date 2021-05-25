package shopping.mall.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.common.model.MyCartList;
import shopping.mall.model.Order;
import shopping.mall.model.OrderDao;
import shopping.member.model.Member;
import shopping.product.controller.ProductDetailViewController;

public class MallInsertController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		if (super.session.getAttribute("loginfo") == null) {
			String message = "로그인이 필요합니다.";
			super.setErrorMessage(message);
			
			String gotopage = "/member/mLogin.jsp" ;
			super.GotoPage(gotopage);
		} else {
			System.out.println("mallInsertController 실행");
			
			int pno = Integer.parseInt(request.getParameter("pno"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			int qty = Integer.parseInt(request.getParameter("qty"));
			
			if(stock < qty) {
				String message = "현재 재고수량은 " + stock + "개 입니다.";
				super.setErrorMessage(message);
				new ProductDetailViewController().doGet(request, response);
			}else {
				
				System.out.println("mycartlist 실행하기 위해 if문 들어옴");
				
				MyCartList mycart = (MyCartList)super.session.getAttribute("mycart");
				
				if (mycart == null) {
					mycart = new MyCartList();
				}
				
				// put into mycart
				mycart.AddOrder(pno, qty);
				super.session.setAttribute("mycart", mycart);
				
				new MallListController().doGet(request, response);
			}
		}
	}
}